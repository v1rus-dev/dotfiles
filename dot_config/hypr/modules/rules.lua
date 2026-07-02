hl.window_rule({
    name           = "suppress-maximize-events",
    match          = { class = ".*" },

    suppress_event = "maximize",
})

hl.window_rule({
    name     = "fix-xwayland-drags",
    match    = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

-- Audio popup: pwvucontrol as a compact floating panel under the top-right of the bar
-- (waybar pulseaudio on-click toggles it). Bar ends at y~=36 (margin-top 6 + height 30).
hl.window_rule({
    name  = "pwvucontrol-popup",
    match = { class = "com.saivert.pwvucontrol" },

    float = true,
    size  = "460 640",
    move  = "monitor_w-470 46",
})
