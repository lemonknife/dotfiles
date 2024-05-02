local prefix = "<leader>m"
return {
	{ import = "astrocommunity.editing-support.dial-nvim" },
	{
		"brenton-leighton/multiple-cursors.nvim",
		cmd = {
			"MultipleCursorsAddDown",
			"MultipleCursorsAddUp",
			"MultipleCursorsMouseAddDelete",
			"MultipleCursorsAddMatches",
			"MultipleCursorsAddMatchesV",
			"MultipleCursorsAddJumpNextMatch",
			"MultipleCursorsJumpNextMatch",
			"MultipleCursorsLock",
		},
		dependencies = {
			{ "AstroNvim/astroui", opts = { icons = { Multicursor = "󰗧" } } },
			{
				"AstroNvim/astrocore",
				opts = function(_, opts)
					local maps = opts.mappings
					maps.n[prefix] = { desc = require("astroui").get_icon("Multicursor", 1, true) .. "Multicursor" }
					maps.x[prefix] = { desc = require("astroui").get_icon("Multicursor", 1, true) .. "Multicursor" }
					for lhs, map in pairs({
						["<A-j>"] = { "<Cmd>MultipleCursorsAddDown<CR>", desc = "Add cursor down" },
						["<A-k>"] = { "<Cmd>MultipleCursorsAddUp<CR>", desc = "Add cursor up" },
					}) do
						maps.n[lhs] = map
						maps.i[lhs] = map
					end
					for lhs, map in pairs({
						[prefix .. "a"] = { "<Cmd>MultipleCursorsAddMatches<CR>", desc = "Add cursor matches" },
						[prefix .. "A"] = {
							"<Cmd>MultipleCursorsAddMatchesV<CR>",
							desc = "Add cursor matches in previous visual area",
						},
						[prefix .. "j"] = {
							"<Cmd>MultipleCursorsAddJumpNextMatch<CR>",
							desc = "Add cursor and jump to next match",
						},
						[prefix .. "J"] = {
							"<Cmd>MultipleCursorsJumpNextMatch<CR>",
							desc = "Move cursor to next match",
						},
						[prefix .. "l"] = { "<Cmd>MultipleCursorsLock<CR>", desc = "Lock virtual cursors" },
					}) do
						maps.n[lhs] = map
						maps.x[lhs] = map
					end
				end,
			},
		},
		opts = {
			pre_hook = function()
				local notify = require("astrocore").notify
				local function bool2str(bool)
					return bool and "on" or "off"
				end
				local ok, ultimate_autopair = pcall(require, "ultimate-autopair")
				if ok and not vim.g.ultimate_autopair_enabled then
					ultimate_autopair.toggle()
					vim.g.ultimate_autopair_enabled = require("ultimate-autopair.core").disable
					notify(string.format("ultimate-autopair %s", bool2str(not vim.g.ultimate_autopair_enabled)))
				else
					notify("ultimate-autopair not available")
				end
			end,
			post_hook = function()
				local notify = require("astrocore").notify
				local function bool2str(bool)
					return bool and "on" or "off"
				end
				local ok, ultimate_autopair = pcall(require, "ultimate-autopair")
				if ok and vim.g.ultimate_autopair_enabled then
					ultimate_autopair.toggle()
					vim.g.ultimate_autopair_enabled = require("ultimate-autopair.core").disable
					notify(string.format("ultimate-autopair %s", bool2str(not vim.g.ultimate_autopair_enabled)))
				else
					notify("ultimate-autopair not available")
				end
			end,
		},
	},
}
