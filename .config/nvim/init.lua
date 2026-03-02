require("config.options")
require("config.keymaps")
require("config.lazy")
require("config.appearance")

-- Enable LSPs for configured langugage
vim.lsp.enable({"clangd"})
vim.lsp.enable({"vtsls"})
vim.lsp.enable({"html"})
vim.lsp.enable({"cssls"})
