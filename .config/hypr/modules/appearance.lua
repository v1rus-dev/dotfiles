hl.config({
    general = {
        gaps_in          = 4,
        gaps_out         = 8,

        border_size      = 2,

        col              = {
            active_border   = { colors = { "rgba(ff9933ee)", "rgba(ff3399ee)", "rgba(9933ffee)" }, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },

        resize_on_border = false,
        allow_tearing    = false,
        layout           = "dwindle",
    },

    decoration = {
        rounding         = 5,
        rounding_power   = 2,

        active_opacity   = 1.0,
        inactive_opacity = 0.9,

        shadow           = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },

        blur             = {
            enabled  = true,
            size     = 3,
            passes   = 2,
            vibrancy = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})
