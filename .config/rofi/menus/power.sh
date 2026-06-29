#!/usr/bin/env bash

choice=$(printf "%s\n" \
"󰌾 Lock" \
"󰤄 Suspend" \
"󰗼 Logout" \
"󰜉 Reboot" \
"󰐥 Shutdown" \
| rofi -dmenu -i -p "Power")

case "$choice" in
  "󰌾 Lock") hyprlock ;;
  "󰤄 Suspend") systemctl suspend ;;
  "󰗼 Logout") hyprctl dispatch exit ;;
  "󰜉 Reboot") systemctl reboot ;;
  "󰐥 Shutdown") systemctl poweroff ;;
esac
