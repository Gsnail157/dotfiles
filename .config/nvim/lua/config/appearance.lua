vim.opt.termguicolors = true

vim.api.nvim_set_hl(0, 'LineNr', { fg = '#fffafa', bold = true })
vim.api.nvim_set_hl(0, "CursorLine", { underline = true, bg=NONE })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#AAFF00", bold = true })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })

-- / Searching highlighting
vim.cmd("highlight Search guifg=Black guibg=Green")
vim.cmd("highlight IncSearch guifg=Green guibg=Cyan")

-- Lualine
require('lualine').setup{
    options = {
        theme = 'gruvbox-material'
    }}
