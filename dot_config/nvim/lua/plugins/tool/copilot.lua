return {
	{ import = "astrocommunity.completion.copilot-lua" },
	{
		"hrsh7th/nvim-cmp",
		dependencies = { "zbirenbaum/copilot.lua" },
		opts = function(_, opts)
			local cmp, copilot = require("cmp"), require("copilot.suggestion")
			local snip_status_ok, luasnip = pcall(require, "luasnip")
			if not snip_status_ok then
				return
			end
			if not opts.mapping then
				opts.mapping = {}
			end
			opts.mapping["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif copilot.is_visible() then
					copilot.accept()
				elseif luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				else
					fallback()
				end
			end, { "i", "s" })

			opts.mapping["<C-l>"] = cmp.mapping(function()
				if copilot.is_visible() then
					copilot.accept()
				end
			end)
		end,
	},
}
