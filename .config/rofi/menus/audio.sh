#!/usr/bin/env bash

choice=$(printf "%s\n" \
"󰕾 Volume Mixer" \
"󰓃 PulseAudio Control" \
"󰕿 Mute Output" \
"󰍬 Mute Microphone" \
| rofi -dmenu -i -p "Audio")

case "$choice" in
  "󰕾 Volume Mixer") pwvucontrol ;;
  "󰓃 PulseAudio Control") pavucontrol ;;
  "󰕿 Mute Output") wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle ;;
  "󰍬 Mute Microphone") wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle ;;
esac
