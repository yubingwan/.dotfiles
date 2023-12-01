local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	"nvim-lua/plenary.nvim", -- lua functions that many plugins

	-- vimwiki
	"vimwiki/vimwiki",
	"tbabej/taskwiki",
	"plasticboy/vim-markdown",

	-- line comforty
	"junegunn/goyo.vim",
	"junegunn/limelight.vim",
	"junegunn/vim-easy-align",

	-- colorschemes
	"ellisonleao/gruvbox.nvim",
	"sainnhe/gruvbox-material",
	"bluz71/vim-nightfly-colors",
	"xiyaowong/nvim-transparent",

	"nvim-tree/nvim-tree.lua",
	"nvim-tree/nvim-web-devicons",
	"nvim-lualine/lualine.nvim",

	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			pcall(require("nvim-treesitter.install").update({ with_sync = true }))
		end,
		dependencies = {
			"windwp/nvim-ts-autotag",
		},
	},

	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},

	-- auto closing
	"windwp/nvim-autopairs", -- autoclose parens, brackets, quotes, etc...
	"vim-test/vim-test",
	"lewis6991/gitsigns.nvim",
	"preservim/vimux",
	"christoomey/vim-tmux-navigator",
	"github/copilot.vim",

	-- commenting with gc
	"numToStr/Comment.nvim",
	{
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp", -- for autocompletion
		{ "glepnir/lspsaga.nvim", branch = "main" }, -- enhanced lsp uis
		"jose-elias-alvarez/typescript.nvim", -- additional functionality for typescript server e.g. rename file & update imports
		"onsails/lspkind.nvim", -- vs-code like icons for autocompletion
	},

	-- fuzzy finding w/ telescope
	{ "BurntSushi/ripgrep" },
	{ "sharkdp/fd" },
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- dependency for better sorting performance
	{ "nvim-telescope/telescope.nvim" }, -- fuzzy finder

	-- autocompletion
	"hrsh7th/nvim-cmp", -- completion plugin
	"hrsh7th/cmp-buffer", -- source for text in buffer
	"hrsh7th/cmp-path", -- source for file system paths

	-- formatting & linting
	"jose-elias-alvarez/null-ls.nvim", -- configure formatters & linters
	"jayp0521/mason-null-ls.nvim", -- bridges gap b/w mason & null-ls
})
