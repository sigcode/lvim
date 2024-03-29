lvim.log.level = "warn"
lvim.builtin.alpha.active = true
lvim.builtin.illuminate.active = true
lvim.builtin.bufferline.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.reload_config_on_save = true
lvim.format_on_save = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.breadcrumbs.active = true
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.dap.active = true
lvim.builtin.cmp.active = true
-- lvim.builtin.cmp.cmdline.enable = true
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
lvim.builtin.bufferline.active = true
vim.opt.softtabstop = 4
lvim.builtin.lualine.active = true
lvim.builtin.lualine.style = "default"
lvim.builtin.cmp.completion.keyword_length = 3
lvim.builtin.cmp.window.completion = {
	border = "rounded",
	winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
}
lvim.builtin.cmp.formatting = {
	format = require("tailwindcss-colorizer-cmp").formatter,
}

local cmp = require("cmp")
lvim.builtin.cmp.snippet = {
	expand = function(args)
		require("luasnip").lsp_expand(args.body)
	end,
}
lvim.builtin.cmp.mapping.preset.insert({
	["<C-d>"] = cmp.mapping.scroll_docs(-4),
	["<C-f>"] = cmp.mapping.scroll_docs(4),
	["<C-Space>"] = cmp.mapping.complete(),
	["<CR>"] = cmp.mapping.confirm({
		behavior = cmp.ConfirmBehavior.Replace,
		select = true,
	}),
	["<Tab>"] = cmp.mapping(function(fallback)
		if cmp.visible() then
			cmp.select_next_item()
		elseif luasnip.expand_or_jumpable() then
			luasnip.expand_or_jump()
		else
			fallback()
		end
	end, { "i", "s" }),
	["<S-Tab>"] = cmp.mapping(function(fallback)
		if cmp.visible() then
			cmp.select_prev_item()
		elseif luasnip.jumpable(-1) then
			luasnip.jump(-1)
		else
			fallback()
		end
	end, { "i", "s" }),
})

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

vim.opt.showtabline = 0

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
	splitbelow = true, -- force all horizontal splits to go below current window
	splitright = true, -- force all vertical splits to go to the right of current window
	swapfile = false, -- creates a swapfile
	termguicolors = true, -- set term gui colors (most terminals support this)
	timeoutlen = 1000, -- time to wait for a mapped sequence to complete (in milliseconds)
	undofile = true, -- enable persistent undo
	updatetime = 100, -- faster completion (4000ms default)
	writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	tabstop = 4, -- insert 2 spaces for a tab
	softtabstop = 4,
	autoindent = true,
	showmatch = true,
	smartindent = true,
	expandtab = true,
	shiftwidth = 4,
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
