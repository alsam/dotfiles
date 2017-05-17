set nocompatible	" Use Vim defaults (much better!)
set history=256  " Number of things to remember in history.

if exists("did_load_filetypes")
  finish
endif

augroup filetypedetect
  au BufNewFile,BufRead [Jj]ustfile setf yaml
augroup END

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'racer-rust/vim-racer'
Plugin 'JuliaLang/julia-vim'
" Plugin 'Shougo/neocomplcache'
" Plugin 'Shougo/neosnippet'
" Plugin 'Shougo/neosnippet-snippets'
Plugin 'valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


"syntax on
set bs=2		" allow backspacing over everything in insert mode
"set ai			" always set autoindenting on
"set backup		" keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set ruler		" show the cursor position all the time

"let g:C_AuthorName      = 'Alexander Samoilov'
"let g:C_AuthorRef       = 'Mr.'
"let g:C_Email           = 'alexander.samoilov@gmail.com'
"let g:C_Company         = ''

set tabstop    =4
set shiftwidth =4
set number
set expandtab

"http://unix.stackexchange.com/questions/141097/how-to-enable-and-use-code-folding-in-vim
"http://stackoverflow.com/questions/4710104/is-there-any-code-collapse-plugin-of-vim-like-this

"set foldmethod=indent   
"set foldnestmax=10
"set nofoldenable
"set foldlevel=2

set nofoldenable     " no foldable by default
set foldmethod=syntax
set foldcolumn=2     " the number of columns to use for folding display at the left

set cindent
set hlsearch
hi Search guibg=LightBlue

" au BufNewFile,BufRead [Mm]akefile*
"   \ set tabstop    =8 |
"   \ set shiftwidth =8 |
"   \ set noexpandtab   |
"   \ set nocindent

autocmd FileType make set noexpandtab tabstop=8 shiftwidth=8 softtabstop=0
autocmd FileType c,fortran set expandtab tabstop=4 shiftwidth=4 softtabstop=0

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

" filetype plugin on

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

" Highlighting of class scope if disabled by default. To enable set

"let g:cpp_class_scope_highlight = 1

" Highlighting of template functions is enabled by setting

"let g:cpp_experimental_template_highlight = 1

syntax on

let g:vim_markdown_math=1

" Disable Folding
" 
" Add the following line to your .vimrc to disable folding configuration.
" 
" let g:vim_markdown_folding_disabled=1
" This option only controls vim_markdown's folding configuration. To enable/disable folding use Vim's folding configuration.
" 
" set [no]foldenable
" Disable Default Key Mappings
" 
" Add the following line to your .vimrc to disable default key mappings. You can map them by yourself with <Plug> mappings.
" 
" let g:vim_markdown_no_default_key_mappings=1
" Syntax extensions
" 
" The following options control which syntax extensions will be turned on. They are off by default.
" 
" LaTeX math
" 
" Used as $x^2$, $$x^2$$, escapable as \$x\$ and \$\$x\$\$.
" 
" let g:vim_markdown_math=1
" " "


"enable mouse support
set mouse=a

" check file change every 4 seconds ('CursorHold') and reload the buffer upon detecting change
set autoread
au CursorHold * checktime

autocmd VimEnter * NERDTree
autocmd BufEnter * NERDTreeMirror

"CTRL-q to toggle tree view with CTRL-q
nmap <silent> <C-q> :NERDTreeToggle<CR>
"Set F2 to put the cursor to the nerdtree
nmap <silent> <F2> :NERDTreeFind<CR>

" launch rustfmt
" noremap <F3> :Autoformat<CR>
noremap <F3> :RustFmt<CR>
" au BufWrite * :Autoformat

" launch rust racer
set hidden
let g:racer_cmd = "$HOME/.cargo/bin/racer"
"let g:racer_cmd = "$HOME/.multirust/toolchains/nightly/cargo/bin/racer"
"let $RUST_SRC_PATH="/mnt/disk2/opt/pkgs/rust/src/"
let $RUST_SRC_PATH="/scratch/github/rust/src/"

let g:neocomplcache_enable_at_startup = 1


" look for tags in current and upper levels of hierarchy 
set tags=tags;/
