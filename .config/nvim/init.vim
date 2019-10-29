set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set showcmd           " Show partial commands

set number            " Show line numbers

set hlsearch          " Highlight search results
set incsearch         " Immediately show matches

set ignorecase        " Case insensitive searching
set smartcase         " Case sensitive searching when pattern includes upper case characters

set statusline+=%#warningmsg#
set statusline+=%*

filetype plugin indent on
syntax on

call plug#begin('$XDG_CONFIG_HOME/nvim/plugged')
  Plug 'tpope/vim-sensible'
  Plug 'lervag/vimtex'
  Plug 'editorconfig/editorconfig-vim'

  Plug 'godlygeek/tabular'
  Plug 'plasticboy/vim-markdown'
call plug#end()
