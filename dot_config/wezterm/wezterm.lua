-- vim: set ts=2 sw=2 et:
local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.initial_cols = 120
config.initial_rows = 28
config.font_size = 14
config.font = wezterm.font_with_fallback({
	{ family = "Lilex", weight = "Medium", italic = false },
	"Symbols Nerd Font Mono",
})
config.color_scheme = "Flexoki Dark"

config.use_fancy_tab_bar = true
config.window_frame = {
	active_titlebar_bg = "1C1B1A",
}
config.colors = {
	tab_bar = {
		background = "#1C1B1A",
		-- The color of the inactive tab bar edge/divider
		inactive_tab_edge = "#BC5215",
		active_tab = {
			bg_color = "#100F0F",
			fg_color = "#878580",
		},
		inactive_tab = {
			bg_color = "#1C1B1A",
			fg_color = "#878580",
		},
	},
}

config.default_prog = { "pwsh.exe" }

config.front_end = "WebGpu"
return config
