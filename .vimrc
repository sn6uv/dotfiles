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
set grepprg=grep\ -nH\ $*

function F9()
  if expand("%:e") == "tex"
    cd %:h
      !pdflatex -file-line-error %
    cd -
  endif
endfunction

function F10()
  if expand("%:e") == "tex"
    !evince %:r.pdf &
  endif
endfunction

map <F8> :w<CR>:!make<CR>
imap <F8> <Esc>:w<CR>:!make<CR>a

map <F9> :call F9()<CR>
imap <F9> <Esc>:call F9()<CR>a

map <F10> :call F10()<CR>
imap <F10> <Esc>:call F10()<CR>a
