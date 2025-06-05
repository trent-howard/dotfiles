return {
  {
    "folke/tokyonight.nvim",
    priority = 1000,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    config = function()
      require("rose-pine").setup({
        extend_background_behind_borders = true,

        styles = {
          bold = true,
          italic = true,
          transparency = true,
        },

        palette = {
          moon = {
            base = "#191724",
          },
        },

        highlight_groups = {
          TelescopeBorder = { bg = "none" },
          CursorLine = { bg = "base" },
          RenderMarkdownCode = { bg = "base" },
          RenderMarkdownCodeInline = { bg = "base" },
          NormalFloat = { bg = "base" },
          BlinkCmpDoc = { bg = "base" },
          BlinkCmpDocSeparator = { bg = "base" },
          SnacksPicker = { link = "none" },
        },
      })
    end,
    init = function()
      vim.cmd.colorscheme("rose-pine-moon")
    end,
  },
}
