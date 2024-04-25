local wezterm = require("wezterm")
local config = {}

config.disable_default_key_bindings = true
-- config.leader = { key = "\\", timeout_milliseconds = 1000 }

config.keys = {
	{
		key = "f",
		mods = "ALT",
		action = wezterm.action.SendKey({ key = "f", mods = "ALT" }),
	},
	{
		key = "=",
		mods = "CTRL",
		action = wezterm.action.IncreaseFontSize,
	},
	{
		key = "-",
		mods = "CTRL",
		action = wezterm.action.DecreaseFontSize,
	},

	-- { key = "\\", mods = "LEADER", action = wezterm.action.SendKey({ key = "\\", mods = "ALT" }) },
}

return config
