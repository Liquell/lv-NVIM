-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.g.mapleader = " "
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local vimKey = vim.keymap.set
local vimCmd = vim.cmd
local vimG = vim.g

-- Keymaps default
vimKey("n", "<leader>s", vimCmd.w)
vimKey("n", "<C-s>", vimCmd.w)
vimKey("i", "jj", "<Esc>")

-- Telescope
local builtin = require("telescope.builtin")

vimKey("n", "<leader>ff", builtin.find_files, {})
vimKey("n", "<leader>fw", builtin.live_grep, {})
vimKey("n", "<leader>fb", builtin.buffers, {})

-- Buffer navigation
map("n", "<C-t>", ":tabnew<CR>", opts) -- Create a new tab
map("n", "<C-w>", ":bd!<CR>", opts) -- Close the current buffer
map("n", "<leader>w", ":bd!<CR>", opts) -- Close the current buffer

for i = 1, 9 do
  map("n", "<leader>" .. tostring(i), "<Cmd>BufferLineGoToBuffer " .. tostring(i) .. "<CR>", opts)
end

map("n", "<leader>n", "<Cmd>BufferLineCycleNext<CR>", opts)
map("n", "<leader>p", "<Cmd>BufferLineCyclePrev<CR>", opts)

-- Comment
-- map("n", "<leader>/", ":CommentToggle<CR>", opts)
-- map("v", "<leader>/", ":CommentToggle<CR>", opts)

-- Copilot
vimG.copilot_no_tab_map = true
vimG.copilot_assume_mapped = true
map("i", "<c-l>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

-- LazyGit
map("n", "<leader>lg", ":LazyGit<CR>", opts)
-- TogleTerm
map("n", "<leader>tt", ":ToggleTerm<CR>", opts)
