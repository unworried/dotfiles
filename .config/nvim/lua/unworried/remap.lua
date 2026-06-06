-- lua/unworried/remap.lua
-- set global leader to <space>
vim.g.mapleader = " "
-- (normal)<leader>pv : open netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- (visual)<shift>j : shift current line down once
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
-- (visual)<shift>j : shift current line up once
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- (normal)<shift>j : join current line with next line without
-- moving cursor position
vim.keymap.set("n", "J", "mzJ`z")
-- redraw cursor line (zz) when 1/2 page down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- redraw cursor line (zz) when 1/2 page up
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- centre cursor line when jumping to next search result
vim.keymap.set("n", "n", "nzzzv")
-- centre cursor line when jumping to previous search result
vim.keymap.set("n", "N", "Nzzzv")

-- (select)<leader>p : paste current register and void overwritten data
-- data is voided through the black hole register (_)
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
-- (normal|visual)<leader>y : yank into system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
-- (normal)<leader><shift>y : yank cursor to EOL into system clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- (normal|visual)<leader>d : void buffer, delete without yanking
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- (normal)<shift>q : nop. disables default Ex keybind
vim.keymap.set("n", "Q", "<nop>")
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
-- (normal)<leader>f : runs active lsp formatter for current buffer
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- (normal)<ctrl>k : jump to next quickfix item + centre cursor line
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- (normal)<ctrl>j : jump to previous quickfix item + centre cursor line
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- (normal)<leader>k : jump to next locational item + centre cursor line
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- (normal)<leader>j : jump to previous locational item + centre cursor line
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- (normal)<leader>s : rename word found at cursor across entire buffer,
-- cursor is left at field replacement stage so they required modifcation/
-- replacement can be made before processing the regex query.
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- (normal)<leader>x : make current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- (normal)<leader><leader> : source current file
vim.keymap.set("n", "<leader><leader>", function() vim.cmd("so") end)
