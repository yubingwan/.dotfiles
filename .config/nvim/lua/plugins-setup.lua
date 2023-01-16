local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")

if not status then
  return
end

return require('packer').startup(function(use)
  -- packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim' -- lua functions that many plugins use

  -- vimwiki
  use 'vimwiki/vimwiki'
  use 'tbabej/taskwiki'
  use 'plasticboy/vim-markdown'

  -- line comforty
  use 'junegunn/goyo.vim'
  use 'junegunn/limelight.vim'
  use 'junegunn/vim-easy-align'

  -- colorschemes
  use 'ellisonleao/gruvbox.nvim'
  use 'sainnhe/gruvbox-material'
  use 'bluz71/vim-nightfly-colors'
  use 'xiyaowong/nvim-transparent'

  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'
  use 'nvim-lualine/lualine.nvim'

  use {'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  }

  -- auto closing
  use 'windwp/nvim-autopairs' -- autoclose parens, brackets, quotes, etc...
  use { "windwp/nvim-ts-autotag", after = "nvim-treesitter" } -- autoclose tags

  use 'vim-test/vim-test'

  use 'lewis6991/gitsigns.nvim'

  use 'preservim/vimux'

  use 'christoomey/vim-tmux-navigator'

  use 'github/copilot.vim'

  -- commenting with gc
  use 'numToStr/Comment.nvim'

  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp", -- for autocompletion
    { "glepnir/lspsaga.nvim", branch = "main" }, -- enhanced lsp uis
    "jose-elias-alvarez/typescript.nvim", -- additional functionality for typescript server (e.g. rename file & update imports)
    "onsails/lspkind.nvim", -- vs-code like icons for autocompletion
  }

  -- fuzzy finding w/ telescope
  use { "BurntSushi/ripgrep" }
  use { "sharkdp/fd" }
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" } -- dependency for better sorting performance
  use { "nvim-telescope/telescope.nvim", branch = "0.1.x" } -- fuzzy finder

  -- autocompletion
  use "hrsh7th/nvim-cmp" -- completion plugin
  use "hrsh7th/cmp-buffer" -- source for text in buffer
  use "hrsh7th/cmp-path" -- source for file system paths

  -- formatting & linting
  use "jose-elias-alvarez/null-ls.nvim" -- configure formatters & linters
  use "jayp0521/mason-null-ls.nvim" -- bridges gap b/w mason & null-ls

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
