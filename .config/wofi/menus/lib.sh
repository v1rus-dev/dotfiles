#!/usr/bin/env bash
# Shared helpers for the wofi action menus.

# menu "Prompt" — render a dmenu list (entries piped on stdin), echo the choice.
# wofi reads ~/.config/wofi/{config,style.css} automatically; icons are baked
# into the labels as glyphs, so no image column is needed.
menu() {
    wofi --dmenu --insensitive --prompt "$1"
}

# run cmd [args…] — run cmd only if its binary is on PATH, else notify.
run() {
    if command -v "$1" >/dev/null 2>&1; then
        "$@"
    else
        notify-send "wofi menu" "Command not found: $1" 2>/dev/null
    fi
}
