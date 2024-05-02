return {
	{
		"onsails/lspkind.nvim",
		opts = function(_, opts)
			-- use codicons preset
			opts.preset = "codicons"
			-- set some missing symbol types
			opts.symbol_map = {
				Array = "",
				Boolean = "",
				Snippet = "",
				Key = "",
				Namespace = "",
				Null = "",
				Number = "",
				Object = "",
				Package = "",
				String = "",
			}
		end,
	},
}
