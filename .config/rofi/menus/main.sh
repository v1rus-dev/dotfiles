#!/usr/bin/env bash

choice=$(printf "%s\n" \
"󰕾 Audio" \
"󰐥 Power" \
"󰋩 Wallpapers" \
"󰍹 Displays" \
"󰖩 Network" \
"󰂯 Bluetooth" \
"󰍉 Screenshot" \
"󰚰 Reload Hyprland" \
"󰃢 Clear Notifications" \
| rofi -dmenu -i -p "Command Palette")

case "$choice" in
  "󰕾 Audio") ~/.config/rofi/menus/audio.sh ;;
  "󰐥 Power") ~/.config/rofi/menus/power.sh ;;
  "󰋩 Wallpapers") wallpaper-select ;;
  "󰍹 Displays") hyprland-dialog ;;
  "󰖩 Network") nm-connection-editor ;;
  "󰂯 Bluetooth") blueman-manager ;;
  "󰍉 Screenshot") screenshot-area ;;
  "󰚰 Reload Hyprland") hyprctl reload ;;
  "󰃢 Clear Notifications") swaync-client -C ;;
esac
