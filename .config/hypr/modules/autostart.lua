-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function ()
  hl.exec_cmd("waybar")
  hl.exec_cmd("swaync")
  hl.exec_cmd("nm-applet")
  hl.exec_cmd("hypridle")

  hl.exec_cmd("wl-paste --type text --watch cliphist store")
  hl.exec_cmd("wl-paste --type image --watch cliphist store")
  hl.exec_cmd("hyprctl setcursor Hackneyed-24px 20")

  hl.exec_cmd("pgrep awww-daemon >/dev/null || awww-daemon")
end)
