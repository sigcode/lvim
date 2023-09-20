reload("user.plugins")
reload("user.options")
-- reload("user.winbar")
reload("user.keymaps")
reload("user.autocommands")
reload("user.lsp")
reload("user.neoscroll")
reload("user.fidget")
reload("user.harpoon")
--reload("user.cybu")
reload("user.surround")
reload("user.bookmark")
reload("user.todo-comments")
-- reload("user.jaq")
-- reload("user.lab")
reload("user.git")
reload("user.zen-mode")
reload("user.inlay-hints")
reload("user.whichkey")
reload("user.telescope")
reload("user.bqf")
--reload("user.dial")
reload("user.numb")
reload("user.treesitter")
reload("user.neogit")
reload("user.colorizer")

local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
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
})
-- require("mini.cursorword").setup()
-- require("mini.jump").setup()
-- require("mini.indentscope").setup()
require("leap").add_default_mappings()
