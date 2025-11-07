return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    explorer = { enabled = true },
  },
  keys = {
    {
      "<leader>gb",
      function()
        Snacks.gitbrowse()
      end,
      desc = "Git browse",
      mode = { "n", "v" },
    },
    {
      "<leader>gy",
      function()
        Snacks.gitbrowse.open({
          open = function(url)
            vim.fn.setreg("+", url)
            vim.notify("Yanked git remote into clipboard")
          end,
        })
      end,
      desc = "Yank git remote into system clipboard",
      mode = { "n", "v" },
    },
    {
      "<leader>gg",
      function()
        Snacks.lazygit()
      end,
      desc = "Lazygit",
    },
    {
      "\\",
      function()
        Snacks.explorer({ hidden = true })
      end,
      desc = "File Explorer",
    },
  },
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        -- Create some toggle mappings
        Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>tw")
        Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>ts")
        Snacks.toggle({
          name = "Virtual diagnostic",
          get = function()
            return vim.diagnostic.config().virtual_text
          end,
          set = function(isEnabled)
            vim.diagnostic.config({ virtual_text = isEnabled and { spacing = 0 } or false })
          end,
        }):map("<leader>tv")
      end,
    })
  end,
}
