call pathogen#infect()

set ts=3
set sw=3
set smarttab
set expandtab
set softtabstop=3

set hlsearch

syntax on

if has("autocmd")
  filetype indent on
endif
filetype plugin on

set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set ruler
set number


" Define shell as zsh
set shell=/bin/zsh


" alt-i (normal mode) inserts a single char, and then switches back to normal
map <A-i> i <ESC>r

set complete+=k

set wildmenu
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

let g:tex_flavor="latex"
let g:Tex_ViewRule_pdf='open -a Preview'

nmap <C-R> <C-]>

function ModeChange()
   if getline(1) =~ "^#!"
      if getline(1) =~ "/bin/"
         silent !chmod a+x <afile>
      endif
   endif
endfunction

au bufwritepost * call ModeChange() 

au BufWritePost * if getline(1) =~ "^#!" | if getline(1) =~ "/@(usr|bin|opt)/" | silent !chmod a+x <afile> | endif | endif


set ofu=syntaxcomplete#Complete
