"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"               ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"               ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"               ██║   ██║██║██╔████╔██║██████╔╝██║
"               ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║
"                ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"                 ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim needs a POSIX compatible shell to work properly
if &shell =~# 'fish$'
    set shell=zsh
endif

if &compatible
    set nocompatible
endif

" Install vim-plug if not found
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif


call plug#begin('~/.vim/plugged')

  Plug 'dense-analysis/ale'
  Plug 'preservim/nerdtree'
  Plug 'dracula/vim'
  Plug 'ryanoasis/vim-devicons'
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'preservim/nerdcommenter'
  Plug 'mhinz/vim-startify'
  Plug 'vim-airline/vim-airline'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'gruvbox-community/gruvbox'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'preservim/nerdcommenter'
  Plug 'vimwiki/vimwiki'
 " Plug 'tbabej/taskwiki'
  Plug 'plasticboy/vim-markdown'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}
  " Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()


