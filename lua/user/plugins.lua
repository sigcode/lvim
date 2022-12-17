-- Additional Plugins
lvim.plugins = {
	"nvim-treesitter/playground",
	"nvim-treesitter/nvim-treesitter-textobjects",
	"mrjones2014/legendary.nvim",
	"mfussenegger/nvim-jdtls",
	"karb94/neoscroll.nvim",
	"stevearc/dressing.nvim",
	"j-hui/fidget.nvim",
	"windwp/nvim-ts-autotag",
	"kylechui/nvim-surround",
	"christianchiarulli/harpoon",
	"MattesGroeger/vim-bookmarks",
	{
		"NvChad/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({
				filetypes = {
					"*", -- Highlight all files, but customize some others.
					"!vim", -- Exclude vim from highlighting.
					-- Exclusion Only makes sense if '*' is specified!
				},
			})
		end,
	},
	--"ghillb/cybu.nvim",
	"moll/vim-bbye",
	"folke/todo-comments.nvim",
	"windwp/nvim-spectre",
	"f-person/git-blame.nvim",
	"ruifm/gitlinker.nvim",
	"mattn/vim-gist",
	"mattn/webapi-vim",
	"folke/zen-mode.nvim",
	"lvimuser/lsp-inlayhints.nvim",
	"lunarvim/darkplus.nvim",
	"lunarvim/templeos.nvim",
	"kevinhwang91/nvim-bqf",
	"is0n/jaq-nvim",
	"hrsh7th/cmp-emoji",
	"nacro90/numb.nvim",
	"TimUntersberger/neogit",
	"sindrets/diffview.nvim",
	"simrat39/rust-tools.nvim",
	"olexsmir/gopher.nvim",
	"leoluz/nvim-dap-go",
	"ggandor/lightspeed.nvim",
	"mfussenegger/nvim-dap-python",
	"jose-elias-alvarez/typescript.nvim",
	{ "junegunn/fzf" },
	{ "junegunn/fzf.vim" },
	"mxsdev/nvim-dap-vscode-js",
	{
		"saecki/crates.nvim",
		tag = "v0.3.0",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("crates").setup({
				null_ls = {
					enabled = true,
					name = "crates.nvim",
				},
			})
		end,
	},
	{
		"jinh0/eyeliner.nvim",
		config = function()
			require("eyeliner").setup({
				highlight_on_key = true,
			})
		end,
	},
	{ "christianchiarulli/telescope-tabs", branch = "chris" },
	--"monaqa/dial.nvim",
	{
		"0x100101/lab.nvim",
		run = "cd js && npm ci",
	},
	{ "tzachar/cmp-tabnine", run = "./install.sh" },
	{
		"zbirenbaum/copilot.lua",
		event = { "VimEnter" },
		config = function()
			vim.defer_fn(function()
				require("copilot").setup({
					plugin_manager_path = os.getenv("LUNARVIM_RUNTIME_DIR") .. "/site/pack/packer",
					suggestion = {
						enabled = true,
						auto_trigger = true,
						debounce = 75,
						keymap = {
							accept = "<C-e>",
							accept_word = false,
							accept_line = false,
							next = "<C-r>",
							prev = "<C-w>",
							dismiss = "<C-]>",
						},
					},
				})
			end, 100)
		end,
	},
	-- {
	-- 	"zbirenbaum/copilot-cmp",
	-- 	after = { "copilot.lua" },
	-- 	config = function()
	-- 		require("copilot_cmp").setup()
	-- 	end,
	-- },

	-- https://github.com/jose-elias-alvarez/typescript.nvim
	-- "rmagatti/auto-session",
	-- "rmagatti/session-lens"
}
