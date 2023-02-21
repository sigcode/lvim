lvim.log.level = "warn"
lvim.builtin.alpha.active = true
lvim.builtin.illuminate.active = true
lvim.builtin.bufferline.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.breadcrumbs.active = true
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.dap.active = true
lvim.builtin.cmp.cmdline.enable = false
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.diagnostic.config({
	underline = true,
	virtual_text = false,
	virtual_lines = {
		only_current_line = true,
	},
})
vim.opt.softtabstop = 4
lvim.builtin.cmp.completion.keyword_length = 3
lvim.builtin.cmp.window.completion = {
	border = "rounded",
	winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
}
lvim.builtin.cmp.formatting = {
	format = require("tailwindcss-colorizer-cmp").formatter,
}
-- lvim.builtin.cmp.formatting.source_names = {
-- 	nvim_lsp = "",
-- 	emoji = "",
-- 	path = "",
-- 	calc = "",
-- 	cmp_tabnine = "",
-- 	vsnip = "",
-- 	luasnip = "",
-- 	buffer = "",
-- 	tmux = "",
-- 	copilot = "",
-- 	treesitter = "",
-- }
lvim.builtin.cmp.formatting = {
	format = function(entry, vim_item)
		vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind
		vim_item.menu = ({
			nvim_lsp = "[LSP]",
			nvim_lua = "[Lua]",
			buffer = "[BUF]",
			path = "[PATH]",
			calc = "[CALC]",
			vsnip = "[VSNIP]",
			tabnine = "[TABNINE]",
			nvim_treesitter = "[TS]",
			spell = "[SPELL]",
			emoji = "[EMOJI]",
		})[entry.source.name]
		return vim_item
	end,
}
-- lvim.builtin.cmp.window = {
-- 	completion = {
-- 		winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
-- 		col_offset = -3,
-- 		side_padding = 0,
-- 	},
-- 	documentation = {
-- 		border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
-- 	},
-- }
lvim.builtin.cmp.sources = {
	{ name = "nvim_lsp" },
	{ name = "nvim_lua" },
	{ name = "buffer" },
	{ name = "path" },
	{ name = "calc" },
	{ name = "vsnip" },
	{ name = "tabnine" },
	{ name = "nvim_treesitter" },
	{ name = "spell" },
	{ name = "emoji" },
}

vim.opt.showtabline = 1

local options = {
	backup = false, -- creates a backup file
	clipboard = "unnamedplus", -- allows neovim to access the system clipboard
	cmdheight = 1, -- more space in the neovim command line for displaying messages
	completeopt = { "menuone", "noselect" }, -- mostly just for cmp
	conceallevel = 0, -- so that `` is visible in markdown files
	fileencoding = "utf-8", -- the encoding written to a file
	hlsearch = true, -- highlight all matches on previous search pattern
	ignorecase = true, -- ignore case in search patterns
	mouse = "a", -- allow the mouse to be used in neovim
	pumheight = 20, -- pop up menu height
	showmode = true, -- we don't need to see things like -- INSERT -- anymore
	showtabline = 2, -- always show tabs
	smartcase = true, -- smart case
	smartindent = true, -- make indenting smarter again
	splitbelow = true, -- force all horizontal splits to go below current window
	splitright = true, -- force all vertical splits to go to the right of current window
	swapfile = false, -- creates a swapfile
	termguicolors = true, -- set term gui colors (most terminals support this)
	timeoutlen = 1000, -- time to wait for a mapped sequence to complete (in milliseconds)
	undofile = true, -- enable persistent undo
	updatetime = 100, -- faster completion (4000ms default)
	writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	expandtab = true, -- convert tabs to spaces
	shiftwidth = 4, -- the number of spaces inserted for each indentation
	tabstop = 4, -- insert 2 spaces for a tab
	cursorline = true, -- highlight the current line
	number = true, -- set numbered lines
	laststatus = 3,
	showcmd = false,
	ruler = false,
	relativenumber = true,
	numberwidth = 4, -- set number column width to 2 {default 4}
	signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
	wrap = false, -- display lines as one long line
	scrolloff = 0,
	hidden = true,
	sidescrolloff = 8,
	--guifont = "monospace:h17", -- the font used in graphical neovim applications
	title = true,
	-- colorcolumn = "80",
	-- colorcolumn = "120",
	orcolumn = "120",
}
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
-- vim.opt.fillchars.eob = " "
-- vim.opt.fillchars = vim.opt.fillchars + "vertleft: "
-- vim.opt.fillchars = vim.opt.fillchars + "vertright: "
vim.opt.fillchars = vim.opt.fillchars + "eob: "
vim.opt.fillchars:append({
	stl = " ",
})

vim.opt.shortmess:append("c")

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])
vim.cmd([[set formatoptions-=cro]]) -- TODO: this doesn't seem to work

vim.filetype.add({
	extension = {
		conf = "dosini",
	},
})

vim.cmd("autocmd TermEnter term://*toggleterm#* tnoremap <silent><c-t> <Cmd>exe v:count1 . 'ToggleTerm'<CR>")
