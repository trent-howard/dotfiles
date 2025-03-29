return {
  "nvim-treesitter/nvim-treesitter-context",
  event = "VimEnter",
  opts = { mode = "cursor", max_lines = 3 },
  config = function()
    local tsc = require("treesitter-context")

    -- disable by default
    tsc.disable()

    vim.keymap.set("n", "<leader>tx", tsc.toggle, { desc = "[T]oggle conte[X]t" })
    vim.keymap.set("n", "[x", function()
      tsc.go_to_context(vim.v.count1)
    end, { desc = "Previous conte[X]t" })
  end,
}
