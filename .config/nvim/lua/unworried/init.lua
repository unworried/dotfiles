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
  group = vim.api.nvim_create_augroup("whitespace-cleanup", {}),
  pattern = '*',
  command = [[%s/\s\+$//e]],
})

vim.api.nvim_create_autocmd("LspAttach", {
  desc = "Lsp keybindings",
  group = vim.api.nvim_create_augroup("lsp-keymap", {}),
  callback = function(e)
    local opts = { buffer = e.buf }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)

    vim.keymap.set("n", "[d", function()
      vim.diagnostic.jump({
        count = -1,
        on_jump = function()
          vim.diagnostic.open_float(nil, {
            focus = false,
            border = "rounded",
          })
        end,
      })
    end, opts)

    vim.keymap.set("n", "]d", function()
      vim.diagnostic.jump({
        count = 1,
        on_jump = function()
          vim.diagnostic.open_float(nil, {
            focus = false,
            border = "rounded",
          })
        end,
      })
    end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
  end,
})
