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

set backspace=indent,eol,start " make backspace a more flexible

"change vim regex handling
nnoremap / /\v
vnoremap / /\v

set gdefault

" 3 scrolling mapping
noremap <S-space> <C-u>
noremap <space> <C-d>

" Make Arrow Keys Useful Again {
map <left> <ESC>:tabp<CR>
map <right> <ESC>:tabp<CR>
map <down> <ESC>:bn<RETURN>
map <up> <ESC>:bp<RETURN>

map <left> <ESC>:bn<RETURN>
map <left> <ESC>:NERDTreeToggle<RETURN>
map <right> <ESC>:Tlist<RETURN>
map <up> <ESC>:bp<RETURN>

" leader commands
let mapleader=","
nnoremap <leader><space> :noh<cr>
nnoremap <leader>w :let &columns +=80<CR><C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" ctags command
nnoremap <leader>ct :!/usr/local/bin/ctags -R .<cr>
" search for tags down the tree
set tags=./tags;/


set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=80


"makes j and k behaves by screen lines
nnoremap j gj
nnoremap k gk

set ts=4
set sw=4
set expandtab
set softtabstop=4

"fix for french keyboard   Breaks the command-line window
" noremap <C-m> <C-]>
noremap <C-^> <C-]>



syntax on

set showcmd		" Show (partial) command in status line.
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set ruler

set autochdir


" Define shell as zsh
set shell=/bin/zsh


" alt-i (normal mode) inserts a single char, and then switches back to normal
map <A-i> i <ESC>r

set complete+=k

set foldmethod=syntax
set foldcolumn=4
set foldlevel=5
" remap space to toggle folds
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf


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
" for latex:
set iskeyword+=:


set ofu=syntaxcomplete#Complete

let g:UltiSnipsEditSplit = 'horizontal'

" set conceallevel=2
" set concealcursor=vin

let g:clang_use_library = 1
let g:clang_snippets = 1
" let g:clang_conceal_snippets=1
let g:clang_snippets_engine = 'ultisnips'

let g:SuperTabDefaultCompletionType='<c-x><c-u><c-p>'

" Deactivate c-support <c-j> for ultisnips
let g:C_Ctrl_j   = 'off'

set wildmenu
set wildmode=list:longest
set wildignore=*.bak,*.o,*.e,*~


" vim-pad
let g:pad_dir="~/notes"

" command-line window is better by default
nnoremap : q:i
" nnoremap / q/i
nnoremap ? q?i

"c and c++ makeprg
au FileType c,cpp set makeprg=make\ -C\ ../build\ $*\ 2>&1\\\|sed\ 's,\.\./src,src,g'

au FileType python set ts=4
au FileType python set sw=4
au FileType python set softtabstop=4

set background=dark
colorscheme solarized

" Required by vim-latex (see its doc)
set grepprg=grep\ -nH\ $*

" syntastic flags
let g:syntastic_c_compiler = 'clang'

" status line
set laststatus=2 " Always display the statusline in all windows
set noshowmode " Hide the default mode text
               " (e.g. -- INSERT -- below the statusline)
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
