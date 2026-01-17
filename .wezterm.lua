-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "GruvboxDark"
-- and finally, return the configuration to wezterm
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
	left = 2,
	right = 2,
	top = 2,
	bottom = 2,
}
local act = wezterm.action
config.font = wezterm.font("JetBrains Mono")
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }
local modal = wezterm.plugin.require("https://github.com/MLFlexer/modal.wezterm")
wezterm.on("modal.enter", function(name, window, pane)
	modal.set_right_status(window, name)
	modal.set_window_title(pane, name)
end)

wezterm.on("modal.exit", function(name, window, pane)
	window:set_right_status("NOT IN A MODE")
	modal.reset_window_title(pane)
end)
modal.apply_to_config(config)
modal.set_default_keys(config)
return config
