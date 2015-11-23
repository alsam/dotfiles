set nocompatible	" Use Vim defaults (much better!)
"syntax on
set bs=2		" allow backspacing over everything in insert mode
"set ai			" always set autoindenting on
"set backup		" keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time

let g:C_AuthorName      = 'Alexander Samoilov'
let g:C_AuthorRef       = 'Mr.'
let g:C_Email           = 'alexander.samoilov@gmail.com'
let g:C_Company         = ''

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

" Pathogen load
filetype off

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
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

" launch rustfmt
noremap <F3> :Autoformat<CR>
" au BufWrite * :Autoformat

" launch rust racer
set hidden
let g:racer_cmd = "$HOME/.cargo/bin/racer"
let $RUST_SRC_PATH="/mnt/disk2/opt/pkgs/rust/src/"

" look for tags in current and upper levels of hierarchy 
set tags=tags;/
