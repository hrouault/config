set nocompatible

filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

set modelines=0

set encoding=utf-8

set showmode   "always show mode
set number
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set smarttab
set scrolloff=4
set hlsearch

set visualbell
set cursorline

set relativenumber


"change vim regiex handling
nnoremap / /\v
vnoremap / /\v

set gdefault

" leader commands
let mapleader=","
nnoremap <leader><space> :noh<cr>
nnoremap <leader>q gqip
vnoremap <leader>q gqip
nnoremap <leader>w :let &columns +=80<CR><C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

"makes j and k behaves by screen lines
nnoremap j gj
nnoremap k gk

set ts=2
set sw=2
set expandtab
set softtabstop=2

"fix for french keyboard
map <C-m> <C-]>


syntax on

set showcmd		" Show (partial) command in status line.
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set ruler


" Define shell as zsh
set shell=/bin/zsh


" alt-i (normal mode) inserts a single char, and then switches back to normal
map <A-i> i <ESC>r

set complete+=k

set wildmenu
set wildmode=list:longest
set wildignore=*.bak,*.o,*.e,*~

set foldmethod=syntax
set foldcolumn=4
set foldlevel=5

au BufRead ~/.tmp/mutt* set tw=72

" automatically give executable permissions if file begins with #! and
" contains
" '/bin/' in the path
"
"Doesn't work!!
"au BufWritePost * if getline(1) =~ "^#!\/bin" | silent !chmod a+x <afile> | endif

function ModeChange()
   if getline(1) =~ "^#!"
      if getline(1) =~ "/bin/"
         silent !chmod a+x <afile>
      endif
   endif
endfunction

au bufwritepost * call ModeChange() 

au BufWritePost * if getline(1) =~ "^#!" | if getline(1) =~ "/@(usr|bin|opt)/" | silent !chmod a+x <afile> | endif | endif

let g:tex_flavor="latex"
let g:Tex_ViewRule_pdf='open -a Preview'


set ofu=syntaxcomplete#Complete

"color theme
colorscheme mustang

"mapping for ctags
map <C-F12> :!/usr/local/bin/ctags -R .<CR>

" tags for c++ std lib
set tags+=~/.vim/tags/cpp

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

" vim-pad
let g:pad_dir="~/notes"

