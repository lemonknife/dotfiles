local prefix = "<leader>s"
return {
  { import = "astrocommunity.editing-support.ultimate-autopair-nvim" },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    dependencies = {
      { "AstroNvim/astroui", opts = { icons = { Surround = "" } } },
      {
        "AstroNvim/astrocore",
        opts = function(_, opts)
          local maps = opts.mappings
          maps.n[prefix] = { desc = require("astroui").get_icon("Surround", 1, true) .. "Surround" }
        end,
      },
    },
    keys = {
      { prefix .. "a", "<Plug>(nvim-surround-normal)", desc = "Add surrounding", mode = "n" },
      { prefix .. "A", "<Plug>(nvim-surround-normal-line)", desc = "Add surrounding to new line", mode = "n" },
      { prefix .. "aa", "<Plug>(nvim-surround-normal-cur)", desc = "Add surrounding on current line", mode = "n" },
      {
        prefix .. "aA",
        "<Plug>(nvim-surround-normal-cur-line)",
        desc = "Add surrounding on current line to new line",
        mode = "n",
      },
      { prefix .. "d", "<Plug>(nvim-surround-delete)", desc = "Delete surrounding", mode = "n" },
      { prefix .. "c", "<Plug>(nvim-surround-change)", desc = "Change surrounding", mode = "n" },
      { prefix .. "C", "<Plug>(nvim-surround-change-line)", desc = "Change surrounding to new line", mode = "n" },
      { prefix .. "a", "<Plug>(nvim-surround-visual)", desc = "Add surrounding", mode = "x" },
      { prefix .. "A", "<Plug>(nvim-surround-visual-line)", desc = "Add surrounding to new line", mode = "x" },
    },
    opts = {
      keymaps = {
        insert = nil,
        insert_line = nil,
        normal = nil,
        normal_cur = nil,
        normal_line = nil,
        normal_cur_line = nil,
        visual = nil,
        visual_line = nil,
        delete = nil,
        change = nil,
        change_line = nil,
      },
    },
  },
}
