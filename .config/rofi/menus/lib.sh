#!/usr/bin/env bash
# Shared helpers for the rofi action menus.

MENU_THEME="$HOME/.config/rofi/menus/menu.rasi"

# menu "Prompt" — render a dmenu list (entries piped on stdin), echo the choice.
# Icons are baked into the labels as glyphs, so disable the icon column to
# avoid an empty left gutter that show-icons reserves for real icons.
menu() {
    rofi -dmenu -i -no-show-icons -theme "$MENU_THEME" -p "$1"
}

# run cmd [args…] — run cmd only if its binary is on PATH, else notify.
run() {
    if command -v "$1" >/dev/null 2>&1; then
        "$@"
    else
        notify-send "rofi menu" "Command not found: $1" 2>/dev/null
    fi
}
