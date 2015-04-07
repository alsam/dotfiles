set nocompatible	" Use Vim defaults (much better!)
"" filetype off                  " required
"" 
"" " Vundle
"" " set the runtime path to include Vundle and initialize
"" set rtp+=~/.vim/bundle/Vundle.vim
"" call vundle#begin()
"" " alternatively, pass a path where Vundle should install plugins
"" "call vundle#begin('~/some/path/here')
"" 
"" " let Vundle manage Vundle, required
"" Plugin 'gmarik/Vundle.vim'
"" 
"" " The following are examples of different formats supported.
"" " Keep Plugin commands between vundle#begin/end.
"" " plugin on GitHub repo
"" Plugin 'tpope/vim-fugitive'
"" " plugin from http://vim-scripts.org/vim/scripts.html
"" Plugin 'L9'
"" " Git plugin not hosted on GitHub
"" Plugin 'git://git.wincent.com/command-t.git'
"" " git repos on your local machine (i.e. when working on your own plugin)
"" Plugin 'file:///home/gmarik/path/to/plugin'
"" " The sparkup vim script is in a subdirectory of this repo called vim.
"" " Pass the path to set the runtimepath properly.
"" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"" " Avoid a name conflict with L9
"" Plugin 'user/L9', {'name': 'newL9'}
"" 
"" " All of your Plugins must be added before the following line
"" call vundle#end()            " required
"" "filetype plugin indent on    " required
"" " To ignore plugin indent changes, instead use:
"" filetype plugin on
"" "
"" " Brief help
"" " :PluginList       - lists configured plugins
"" " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
"" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
"" " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"" "
"" " see :h vundle for more details or wiki for FAQ
"" " Put your non-Plugin stuff after this line

syntax on
set bs=2		" allow backspacing over everything in insert mode
"set ai			" always set autoindenting on
"set backup		" keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time

let g:C_AuthorName      = 'Alexander Samoilov'
let g:C_AuthorRef       = 'Mr'
let g:C_Email           = 'samoilov.alexander@huawei.com'
let g:C_Company         = 'HUAWEI'

set tabstop    =4
set shiftwidth =4
set expandtab
set cindent
set hlsearch
hi Search guibg=LightBlue

au BufNewFile,BufRead [Mm]akefile*
  \ set tabstop    =8 |
  \ set shiftwidth =8 |
  \ set noexpandtab   |
  \ set nocindent

"
"-------------------------------------------------------------------
" taglist.vim : toggle the taglist window
" taglist.vim : define the title texts for make
" taglist.vim : define the title texts for qmake
"-------------------------------------------------------------------
 noremap <silent> <F11>  <Esc><Esc>:Tlist<CR>
inoremap <silent> <F11>  <Esc><Esc>:Tlist<CR>

let tlist_make_settings  = 'make;m:makros;t:targets'
let tlist_qmake_settings = 'qmake;t:SystemVariables'

if has("autocmd")
  " ----------  qmake : set filetype for *.pro  ----------
  autocmd BufNewFile,BufRead *.pro  set filetype=qmake
endif " has("autocmd")

" Fortran support
"au BufRead,BufNewFile *.f let b:fortran_fixed_source=0
"au BufRead,BufNewFile *.f90 let b:fortran_fixed_source=0

filetype plugin on

let s:extfname = expand("%:e")

if s:extfname ==? "scala"
  set tabstop    =2
  set shiftwidth =2
endif

if s:extfname ==? "f90" || s:extfname ==? "F"
    let fortran_free_source=1
    unlet! fortran_fixed_source
    let fortran_more_precise=1
else
    let fortran_fixed_source=1
    unlet! fortran_free_source
endif

" enables menubar
set guioptions+=m

" load my tags
"set tags=/home/scratch.asamoilov_kepler/asamoilov_kepler1_gk100_tree1/hw/tags
"

" pathogen

call pathogen#infect()
call pathogen#helptags()

" vim-scala
" Bundle 'derekwyatt/vim-scala'

" By default vim will only look for the tags file in the directory of the file open in the current buffer. If you want vim do move up the directory hierarchy until it has found the file add this to your ~/.vimrc:

set tags=tags;/
