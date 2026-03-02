-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
        
    -- APPEARANCES
    -- Neovim Theme
    {
        -- https://github.com/rebelot/kanagawa.nvim
        "rebelot/kanagawa.nvim",
        config = function()
            require('kanagawa').setup({
                transparent = true,
                background = {
                    dark = "wave",
                    light = "dragon"
                }
            })
            require("kanagawa").load("wave")
        end,
    },
    
    -- Status Bar at the bottom
    {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
    },

    -- using Hex codes will show the actual color in the buffer
    { "catgoose/nvim-colorizer.lua", opts = { events = "BufReadPre" }},

    -- FUCTIONALITY
    
    -- automatically pairs special characters 
    { 'windwp/nvim-autopairs', opts = { events = "InsertEnter", config = true }},

    -- Underlines the same word in your current buffer
    { "sontungexpt/stcursorword", opts = { event = "VeryLazy", config = true }},

    -- Autocompletion
    { 'saghen/blink.cmp',
        dependencies = { 'rafamadriz/friendly-snippets' },
        version = '1.*',
        opts = {
            -- I made tab be the key to accept
            keymap = { preset = 'default', ['<Enter>'] = {'accept', 'fallback'} },
            appearance = {
                nerd_font_variant = 'mono'
            },
            completion = { documentation = { auto_show = false } },
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
            },
            fuzzy = { implementation = "prefer_rust_with_warning" }
            },
            opts_extend = { "sources.default" }
    },

    -- Easier way to download and manage LSP on ur system. I dont want to manually download lsps
    {
    "mason-org/mason.nvim",
    opts = {
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
                }
            }
        }
    }

    -- Easy way to download and manage LSPs to use instead of downloading them manually 
    -- Still have the make a new config lua file in lsp folder and copy the default settings from lspconfig github repo
    },
    install = { colorscheme = { "habamax" } },
    checker = { enabled = true },
    })

