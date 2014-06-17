"
"   .vimrc
"

runtime! debian.vim
runtime! archlinux.vim

if has("syntax")
  syntax on
endif

" Colours
colorscheme ansi_blows
set background=dark

" Have Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set nocompatible
set mouse=a
set mousehide
set showmatch		" Show matching brackets.
set incsearch		" Incremental search

" Replace tabs with spaces
set tabstop=4
set shiftwidth=4
set expandtab

" Limit linewidth of text to 72 characters in mutt
au BufRead /tmp/mutt-* set tw=72

set grepprg=grep\ -nH\ $*

function F9()
   w
   if getcwd() == '/home/angus/thesis'
      echom "thesis"
      !make
    else
      echom "not thesis"
      cd %:h
      !pdflatex % -file-line-error
      cd -
   endif
endfunction

function F10()
   if getcwd() == '/home/angus/thesis'
      !make view
    else
      evince %:r.pdf &
    endif
endfunction

map <F8> :w<CR>:!make<CR><CR>
map <F9> :call F9()<CR>
imap <F9> <Esc>:call F9()<CR>a
map <F10> :call F10()<CR>
imap <F10> <Esc>:call F10()<CR>a
