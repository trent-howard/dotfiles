---@diagnostic disable: undefined-global
return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  --@type snacks.Config
  opts = {
    bigfile = { enabled = true },
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
      "<leader>gc",
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
  },
}
