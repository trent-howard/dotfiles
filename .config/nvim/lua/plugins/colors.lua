return {

  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    "folke/tokyonight.nvim",
    priority = 1000, -- Make sure to load this before all the other start plugins.
    -- init = function()
    -- Load the colorscheme here.
    -- Like many other themes, this one has different styles, and you could load
    -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
    -- vim.cmd.colorscheme("tokyonight-night")

    -- You can configure highlights by doing something like:
    -- vim.cmd.hi("Comment gui=none")
    -- end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        extend_background_behind_borders = true,

        styles = {
          bold = true,
          italic = true,
          transparency = true,
        },

        highlight_groups = {
          TelescopeBorder = { bg = "none" },
          CursorLine = { bg = "base" },
        },
      })
      vim.cmd.colorscheme("rose-pine-moon")
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    name = "kanagawa",
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require("kanagawa").setup({
        transparent = true,
        extend_background_behind_borders = false,
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = "none",
              },
            },
          },
        },
        overrides = function(colors)
          local theme = colors.theme
          return {
            NormalFloat = { bg = "none" },
            FloatBorder = { bg = "none" },
            FloatTitle = { bg = "none" },

            -- Save an hlgroup with dark background and dimmed foreground
            -- so that you can use it where your still want darker windows.
            -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
            NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

            -- Popular plugins that open floats will link to NormalFloat by default;
            -- set their background accordingly if you wish to keep them dark and borderless
            LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            TelescopeBorder = { bg = "none" },

            -- dark completion menus
            -- Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
            -- PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
            -- PmenuSbar = { bg = theme.ui.bg_m1 },
            -- PmenuThumb = { bg = theme.ui.bg_p2 },
          }
        end,
      })
    end,
    init = function()
      -- vim.cmd.colorscheme("kanagawa-dragon")
    end,
  },
}
