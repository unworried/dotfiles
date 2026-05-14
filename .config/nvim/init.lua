vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

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

-- set
local opt = vim.opt

vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

opt.nu = true
opt.relativenumber = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.smartindent = true

opt.wrap = false

opt.updatetime = 50
