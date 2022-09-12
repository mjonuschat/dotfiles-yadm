local wezterm = require 'wezterm';

return {
    font = wezterm.font_with_fallback({"SauceCodePro Nerd Font"}),
    font_size = 14.0,
    use_ime = true,
    default_prog = {"/bin/zsh", "-l"},
    warn_about_missing_glyphs = false,
    -- color_scheme = "Solarized Dark - Patched",
    leader = {key = "b", mods = "CTRL"},
    keys = {
        {key = "c", mods = "LEADER", action = wezterm.action {SpawnTab = "CurrentPaneDomain"}},
        {key = "mapped:&", mods = "LEADER", action = wezterm.action {CloseCurrentTab = {confirm = true}}},
        {key = "p", mods = "LEADER", action = wezterm.action {ActivateTabRelative = -1}},
        {key = "n", mods = "LEADER", action = wezterm.action {ActivateTabRelative = 1}},
        {key = "1", mods = "LEADER", action = wezterm.action {ActivateTab = 0}},
        {key = "2", mods = "LEADER", action = wezterm.action {ActivateTab = 1}},
        {key = "3", mods = "LEADER", action = wezterm.action {ActivateTab = 2}},
        {key = "4", mods = "LEADER", action = wezterm.action {ActivateTab = 3}},
        {key = "5", mods = "LEADER", action = wezterm.action {ActivateTab = 4}},
        {key = "6", mods = "LEADER", action = wezterm.action {ActivateTab = 5}},
        {key = "7", mods = "LEADER", action = wezterm.action {ActivateTab = 6}},
        {key = "8", mods = "LEADER", action = wezterm.action {ActivateTab = 7}},
        {key = "9", mods = "LEADER", action = wezterm.action {ActivateTab = -1}},
        {key = '"', mods = "LEADER|SHIFT", action = wezterm.action {SplitVertical = {domain = "CurrentPaneDomain"}}},
        {key = "%", mods = "LEADER|SHIFT", action = wezterm.action {SplitHorizontal = {domain = "CurrentPaneDomain"}}},
        {key = "LeftArrow", mods = "LEADER", action = wezterm.action {ActivatePaneDirection = "Left"}},
        {key = "RightArrow", mods = "LEADER", action = wezterm.action {ActivatePaneDirection = "Right"}},
        {key = "DownArrow", mods = "LEADER", action = wezterm.action {ActivatePaneDirection = "Down"}},
        {key = "UpArrow", mods = "LEADER", action = wezterm.action {ActivatePaneDirection = "Up"}},
        {key = "LeftArrow", mods = "LEADER|CTRL", action = wezterm.action {AdjustPaneSize = {"Left", 1}}},
        {key = "RightArrow", mods = "LEADER|CTRL", action = wezterm.action {AdjustPaneSize = {"Right", 1}}},
        {key = "DownArrow", mods = "LEADER|CTRL", action = wezterm.action {AdjustPaneSize = {"Down", 1}}},
        {key = "UpArrow", mods = "LEADER|CTRL", action = wezterm.action {AdjustPaneSize = {"Up", 1}}},
        {key = "x", mods = "LEADER", action = wezterm.action {CloseCurrentPane = {confirm = true}}},
        {key = "z", mods = "LEADER", action = "TogglePaneZoomState"},
        {key = "b", mods = "LEADER|CTRL", action = wezterm.action {SendString = "\x02"}},
        {key = "l", mods = "ALT", action = wezterm.action.ShowLauncher}
    },
    launch_menu = {
        {
            label = "zsh",
            args = {"/bin/zsh", "-l"}
        },
        {
            label = "bash",
            args = {"/bin/bash", "-l"}
        }
    },
    unix_domains = {
        {
            name = "unix"
        }
    },
    ssh_domains = {
        {
            name = "devvm.mjonuschat",
            remote_address = "devvm-mjonuschat.sharks-with-lasers.net:22",
            remote_wezterm_path = "/home/linuxbrew/.linuxbrew/bin/wezterm",
        },
    },
    tls_clients = {
        {
            name = "devvm-mjonuschat",
            remote_address = "devvm-mjonuschat.sharks-with-lasers.net:8082",
            bootstrap_via_ssh = "devvm-mjonuschat.sharks-with-lasers.net",
            remote_wezterm_path = "/home/linuxbrew/.linuxbrew/bin/wezterm",
        }
    },
    tls_servers = {
        {
            bind_address = "0.0.0.0:8082"
        }
    },
    hyperlink_rules = {
        -- Linkify things that look like URLs and the host has a TLD name.
        -- Compiled-in default. Used if you don't specify any hyperlink_rules.
        {
          regex = '\\b\\w+://[\\w.-]+\\.[a-z]{2,15}\\S*\\b',
          format = '$0',
        },

        -- linkify email addresses
        -- Compiled-in default. Used if you don't specify any hyperlink_rules.
        {
          regex = [[\b\w+@[\w-]+(\.[\w-]+)+\b]],
          format = 'mailto:$0',
        },

        -- file:// URI
        -- Compiled-in default. Used if you don't specify any hyperlink_rules.
        {
          regex = [[\bfile://\S*\b]],
          format = '$0',
        },
        -- Linkify things that look like URLs with numeric addresses as hosts.
        -- E.g. http://127.0.0.1:8000 for a local development server,
        -- or http://192.168.1.1 for the web interface of many routers.
        {
          regex = [[\b\w+://(?:[\d]{1,3}\.){3}[\d]{1,3}\S*\b]],
          format = '$0',
        },
        -- Linkify things that look like localhost URLs with a port.
        -- E.g. http://localhost:8000 for a local development server,
        -- or http://localhost for the web interface on the local device.
        {
            regex = [[\b\w+://localhost(?::[\d]{1,5})?\S*\b]],
            format = '$0',
        },
    },
    default_gui_startup_args = {"connect", "unix"}
}
