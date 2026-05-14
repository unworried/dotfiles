-- lua/unworried/init.lua
require("unworried.set")
require("unworried.remap")

require("unworried.lazy")

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 40 })
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
    desc = "Cleanup whitespace before saving current buffer",
    group = vim.api.nvim_create_augroup("whitespace_cleanup", {}),
    pattern = '*',
    command = [[%s/\s\+$//e]],
})
