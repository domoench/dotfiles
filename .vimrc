syntax on
filetype plugin indent on

" FONT
set guifont=Menlo:h16

" LINE APPEARANCE
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set linespace=3
set ai " auto indent
set nowrap

" COLORS
colorscheme elflord

" SAVE + RESTORE FOLDS
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

" LINES + RULER
set nu
set ruler

" AUTORELOAD VIMRC ON UPDATE
autocmd! bufwritepost .vimrc source %

" DELETE TRAILING WHITESPACES ON SAVE
autocmd FileType c,cpp,py,go,rb,sh,md autocmd BufWritePre <buffer> :%s/\s\+$//e
