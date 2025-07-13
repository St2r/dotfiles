local wezterm = require("wezterm")

local config = {
	font = wezterm.font("Maple Mono NF CN", { weight = "Regular" }),
	font_size = 20,
	color_scheme = "Catppuccin Mocha",

	use_fancy_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,
	window_decorations = "RESIZE",
	show_new_tab_button_in_tab_bar = false,
	window_background_opacity = 1,
	macos_window_background_blur = 70,

	text_background_opacity = 1,

	window_padding = {
		left = 20,
		right = 20,
		top = 20,
		bottom = 5,
	},
}

return config
