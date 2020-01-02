" Use Vim settings, rather than Vi settings
set nocompatible

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Keep 50 lines of command line history
set history=50

" Always show the cursor position

" Display incomplete commands
set showcmd

" Do incremental searching
set incsearch

" Turn on autoindenting
set autoindent

" Set number on lines
set nu
" Set foldmethod
" set foldmethod=syntax
" set foldlevelstart=0

" let javaScript_fold=1 " JavaScript

" Don't use Ex mode, use Q for formatting
map Q gq

if &t_Co > 2 || has('gui_running')
 syntax on
      set hlsearch
  endif

" Only do this part when compiled with support for autocommands
if has('autocmd')

     " Enable file type detection
     filetype plugin indent on

     " When editing a file, always jump to the last known cursor position
     autocmd BufReadPost *
         \ if line("'\"") > 1 && line("'\"") <= line("$") |
         \     exe "normal! g`\"" |
         \ endif
endif

" Convenient command to see the difference between the current buffer 
if !exists(':DiffOrig')
 command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | 
wincmd p | diffthis
endif

" Set tab behavior
set tabstop=4
set expandtab
set shiftwidth=4

" Highlight lines longer than 131 characters
match ErrorMsg '\%>131v.\+'

" Custom commands
command D set background=dark
command ND set background=light
command E match ErrorMsg '\%>131v.\+'
command NE match ErrorMsg '\%>1310v.\+'
command I set ignorecase
command NI set noignorecase
command K set list
command NK set nolist
command L set number
command NL set nonumber
command S set spell spelllang=en_us
command NS set nospell
command HI set cursorline

" Set paste mode command
set pastetoggle=<F2>

" Delete current file and exit
command Remove echo delete(@%) | q!

" Replace all characters on a line (except '-' and '#') with the matched 
" Then remove trailing spaces and turn off highlighting.
command Title execute 's/\(.\&[^-]\&[^#]\)/\1 /g | s/\s\+$// | noh'

" Set filetypes
au BufNewFile,BufRead *.mode set filetype=perl
au BufNewFile,BufRead *.ctl set filetype=perl


function! Smart_TabComplete()
    let line = getline('.')                         " current line

    let substr = strpart(line, -1, col('.')+1)      " from the start of the current
    
    let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
    if (strlen(substr)==0)                          " nothing to match on empty string
        return "\<tab>"
    endif
    let has_period = match(substr, '\.') != -1      " position of period, if any
    let has_slash = match(substr, '\/') != -1       " position of slash, if any
    if (!has_period && !has_slash)
        return "\<C-X>\<C-P>"                         " existing text matching
    elseif ( has_slash )
        return "\<C-X>\<C-F>"                         " file matching
    else
        return "\<C-n>"                         " plugin matching
    endif
endfunction

imap <tab> <c-r>=Smart_TabComplete()<CR>

nnoremap <F5> "=strftime("%c")<CR>P

