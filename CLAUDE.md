# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

Personal Arch Linux dotfiles for a Hyprland desktop. The stack (per `README.md`): Hyprland (WM), Waybar, Kitty, Starship, Zsh — plus rofi/wofi launchers, wlogout, swaync (notifications), hyprlock/hypridle, hyprpaper.

This is a configuration repo — there is no build, lint, or test step.

## Deployment model

Config lives under the repo at `.config/`, `.zshrc`, `.gitconfig`, etc., and is **symlinked into `$HOME`** (e.g. `~/.config/hypr` → `~/dotfiles/.config/hypr`). Symlinks are created manually — there is no installer, Makefile, or stow config. Consequence: **editing a tracked file changes the live system immediately**; no copy/deploy step is needed. New files added to the repo must be symlinked into place by hand before they take effect.

Applying changes:
- Hyprland config: `hyprctl reload` (the lua entrypoint is re-evaluated on reload).
- Zsh: `source ~/.zshrc` or open a new shell.
- Most other tools (waybar, rofi) restart on Hyprland reload via autostart, or restart the process directly.

**Before every commit, verify symlinks are correct.** Because config is symlinked into `$HOME`, a tracked file only affects the live system if the corresponding `~/...` path resolves back into this repo. Before committing changes to any config, confirm the live path is a symlink pointing into the repo — e.g. `readlink -f ~/.config/<tool>` should land under `~/dotfiles/`. A newly added file that isn't symlinked yet takes no effect until linked by hand; flag that instead of committing silently.

## Hyprland config architecture (the non-obvious part)

Hyprland here is configured in **Lua**, not the classic `hyprland.conf` syntax:

- `.config/hypr/hyprland.conf` is intentionally near-empty (one `env` line). The real config is `.config/hypr/hyprland.lua`.
- `hyprland.lua` is just an ordered list of `require("modules.<name>")`. **Load order matters** — `variables` and `env` load first, then permissions/misc, then monitors → workspaces → input → appearance → animations → layouts → rules → binds → autostart.
- Each module is a file in `.config/hypr/modules/`. They communicate through **global variables** set in `modules/variables.lua` (`terminal`, `browser`, `fileManager`, `mainMod`, `launcher`, `commandPalette`) — these are plain globals, not locals, so any later module can read them.
- Bindings and dispatchers use the Hyprland Lua API: `hl.bind(...)`, `hl.dsp.exec_cmd(...)`, `hl.dsp.window.*`, `hl.dsp.layout(...)`. Use this API for new config rather than raw `.conf` directives.

When editing config, change the relevant module; do not move logic into `hyprland.conf`. To add a new module, create `modules/<name>.lua` and add a `require` line in `hyprland.lua` at the correct position in the load order.

`.bak` files (e.g. `animations.lua.bak`) are manual backups, not loaded.

## Command palette / menus

`mainMod + SHIFT + R` opens a rofi command palette: `.config/rofi/menus/main.sh`. It dispatches to sibling scripts (`audio.sh`, `power.sh`) and to external commands (`wallpaper-select`, `hyprland-dialog`, `screenshot-area`, etc.) that are expected to be on `PATH` — they are system/AUR tools, not in this repo.

## Conventions

- `.gitconfig` uses `includeIf "gitdir:/home/yegor/Projects/Work/Modsen/**"` → `~/.gitconfig-work` for work identity. `.gitconfig-work` is gitignored (the only gitignored file).
- The repo remote is `github.com:v1rus-dev/dotfiles`; main branch is `main`.
