#!/usr/bin/env bash
source "$HOME/.config/rofi/menus/lib.sh"

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
| menu "Command Palette")

case "$choice" in
  "󰕾 Audio")               exec "$HOME/.config/rofi/menus/audio.sh" ;;
  "󰐥 Power")               exec "$HOME/.config/rofi/menus/power.sh" ;;
  "󰋩 Wallpapers")          run waypaper ;;
  "󰍹 Displays")            run wdisplays ;;
  "󰖩 Network")             run nm-connection-editor ;;
  "󰂯 Bluetooth")           run blueman-manager ;;
  "󰍉 Screenshot")          run screenshot-area ;;
  "󰚰 Reload Hyprland")     run hyprctl reload ;;
  "󰃢 Clear Notifications") run swaync-client -C ;;
esac
