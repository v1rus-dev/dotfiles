#!/usr/bin/env bash
source "$HOME/.config/rofi/menus/lib.sh"

choice=$(printf "%s\n" \
"󰌾 Lock" \
"󰤄 Suspend" \
"󰗼 Logout" \
"󰜉 Reboot" \
"󰐥 Shutdown" \
| menu "Power")

case "$choice" in
  "󰌾 Lock")     run hyprlock ;;
  "󰤄 Suspend")  run systemctl suspend ;;
  "󰗼 Logout")   run uwsm stop ;;
  "󰜉 Reboot")   run systemctl reboot ;;
  "󰐥 Shutdown") run systemctl poweroff ;;
esac
