-- Pull in the wezterm API
local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font_size = 20
config.font = wezterm.font_with_fallback({
	{ family = "CaskaydiaCove Nerd Font Propo", weight = "Regular" },
	{ family = "FiraCode Nerd Font Propo",      weight = "Regular" },
	"Noto Sans SC",
	"Noto Color Emoji",
})

config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"
config.show_new_tab_button_in_tab_bar = false

config.window_background_opacity = 0.8
config.macos_window_background_blur = 70
config.text_background_opacity = 0.9
config.tab_bar_at_bottom = true
config.show_tabs_in_tab_bar = true
config.tab_max_width = 25

---cursor
config.force_reverse_video_cursor = true
config.hide_mouse_cursor_when_typing = true

---visual bell
config.audible_bell = "SystemBeep"
config.visual_bell = {
	fade_in_function = "EaseOut",
	fade_in_duration_ms = 200,
	fade_out_function = "EaseIn",
	fade_out_duration_ms = 200,
}

config.window_padding = {
	top = 20,
	left = 20,
	right = 20,
	bottom = 5,
}

config.color_scheme = "tokyonight_moon"

return config
