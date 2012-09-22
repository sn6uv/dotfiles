runtime! debian.vim

if has("syntax")
  syntax on
endif

set background=dark

" Have Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set showmatch		" Show matching brackets.
set incsearch		" Incremental search

" Replace tabs with spaces
set tabstop=4
set shiftwidth=4
set expandtab

" Limit linewidth of text to 72 characters in mutt
au BufRead /tmp/mutt-* set tw=72

set grepprg=grep\ -nH\ $*

map <F8> :w<CR>:!pdflatex %<CR>
imap <F8> :w<CR>:!pdflatex %<CR>

map <F9> :w<CR>:make<CR>
imap <F9> :w<CR>:make<CR>
