return {
  { import = "astrocommunity.pack.java" },
  {
    "mfussenegger/nvim-jdtls",
    opts = {
      settings = {
        format = {
          enabled = true,
          settings = {
            url = "https://raw.githubusercontent.com/google/styleguide/gh-pages/eclipse-java-google-style.xml",
            profile = "GoogleStyle",
          },
        },
      },
    },
  },
}
