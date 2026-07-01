#!/usr/bin/env bash
source "$HOME/.config/wofi/menus/lib.sh"

choice=$(printf "%s\n" \
"󰕾 Volume Mixer" \
"󰓃 PulseAudio Control" \
"󰕿 Mute Output" \
"󰍬 Mute Microphone" \
| menu "Audio")

case "$choice" in
  "󰕾 Volume Mixer")       run pwvucontrol ;;
  "󰓃 PulseAudio Control") run pavucontrol ;;
  "󰕿 Mute Output")        run wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle ;;
  "󰍬 Mute Microphone")    run wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle ;;
esac
