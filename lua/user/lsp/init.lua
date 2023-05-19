require("user.lsp.languages.rust")
require("user.lsp.languages.go")
-- require("user.lsp.languages.python")
require("user.lsp.languages.js-ts")
-- add `pyright` to `skipped_servers` list
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- remove `jedi_language_server` from `skipped_servers` list
lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
    return server ~= "jedi_language_server"
end, lvim.lsp.automatic_configuration.skipped_servers)
lvim.format_on_save = true
-- vim.diagnostics.config({ virtual_text = true })
-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
    "java",
    "php",
    "javascript",
    "typescript",
    "python",
    "css",
    "scss",
}

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "jdtls" })
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
    { name = "black" },
    { name = "stylua" },
    { name = "google_java_format" },
    {
        name = "prettier",
        ---@usage arguments to pass to the formatter
        -- these cannot contain whitespace
        -- options such as `--line-width 80` become either `{"--line-width", "80"}` or `{"--line-width=80"}`
        args = { "--print-width", "100" },
        ---@usage only start in these filetypes, by default it will attach to all filetypes it supports
        filetypes = { "typescript", "typescriptreact", "css", "scss", "js", "ts" },
    },
}
lvim.format_on_save.enabled = true
lvim.format_on_save.pattern = { "*.py" }

-- formatters.setup {
--     { name = "black",             filetypes = { "py" } },
--     { name = "prettier",          filetypes = { "css", "scss", "rs", "ts", "js", "py" } },
--     { name = "stylua" },
--     { name = "google_java_format" },
-- }
lvim.lsp.on_attach_callback = function(client, bufnr)
    if client.server_capabilities.documentSymbolProvider then
        local navic = require("nvim-navic")
        navic.attach(client, bufnr)
    end
end

-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "eslint_d", filetypes = { "javascript" } },
-- }
