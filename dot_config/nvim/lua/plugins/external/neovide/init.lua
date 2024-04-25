if not vim.g.neovide then return {} end

return {
  { import = "astrocommunity.recipes.neovide" },
  {
    "AstroNvim/astrocore",
    opts = {
      options = {
        opt = {
          guifont = "CaskaydiaCove Nerd Font Propo:h20",
        },
      },
    },
  },
}
