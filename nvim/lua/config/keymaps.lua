-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local Util = require("lazyvim.util")
local map = Util.safe_keymap_set
map("n", "<leader>h", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<leader>j>", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "<leader>k", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "<leader>l", "<C-w>l", { desc = "Go to right window", remap = true })
map("n", "<leader>fj", "<cmd>close<cr>", { desc = "Hide Terminal" })
