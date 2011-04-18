" System vimrc file for MacVim
"
" Maintainer:	Bjorn Winckler <bjorn.winckler@gmail.com>
" Last Change:	Sat Aug 29 2009

set nocompatible

" Disable localized menus for now since only some items are translated (e.g.
" the entire MacVim menu is set up in a nib file which currently only is
" translated to English).
set langmenu=none

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set guioptions=aegit
colorscheme molokai
if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set tabstop=4		" tells how many spaces are equal to tab
set shiftwidth=4
set expandtab
set number
set foldmethod=syntax  

" Don't use Ex mode, use Q for formatting
map Q gq

" In many terminal emulators the mouse works just fine, thus enable it.
set mouse=a

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
syntax on
set hlsearch

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
	 	\ | wincmd p | diffthis
set completeopt=menuone,menu,longest,preview
"set tags+=~/.vim/tags/cpp
"set tags+=~/.vim/tags/python
"============================================

"compile
map \c :cclose<CR>:make "%:r"<CR>:copen 8<CR><C-W>x<C-W>w
map \b :make<CR>:copen 8 <CR><C-W>x
map \n :cn<CR>
map \p :cp<CR>

set wildchar=<TAB> wildmenu wildmode=full
set wildcharm=<C-Z>
nnoremap <TAB> :b <C-Z>
set list listchars=tab:❘-,trail:·,extends:»,precedes:«,nbsp:×
set cursorline
let g:C_CFlags = "-I/opt/local/include -Wall -ansi -pedantic"
set go-=Lr
