-- KEYMAPS FOR NEOVIM
-- Shorten Function Name local keymap = vim.keymap.set 
local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

-- Remap SPACE as leader key
keymap("", "<SPACE>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Remap <ESC> key to enter into normal mode from insert mode
keymap("i", "jk", "<ESC>", opts)
keymap("v", "jk", "<ESC>", opts)

-- Visual Mode Mappings --
-- Stays in indent mode while in Visual Mode
keymap("v", "<C-h>", "<gv", opts)
keymap("v", "<C-l>", ">gv", opts)

-- Move Text up and down with ALT-j or ALT-k
keymap("v", "<C-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<C-k>", ":m '<-2<CR>gv=gv", opts)

-- Hold on to value even if you replace something with paste
keymap("v", "p", '"_dp"', opts)
