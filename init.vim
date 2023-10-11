""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GENERAL
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nu
set ruler
set nowrap

set tabstop=2
set softtabstop=2
set shiftwidth=2

" Turn off search highlighting
set nohlsearch

" Spaces instead of tabs
set expandtab

" Auto indent
" Copy the indentation from the previous line when starting a new line
set ai

" Smart indent
" Automatically inserts one extra level of indentation in some cases, and works for C-like files
set si

" Delete trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LEADER KEY SETUP
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","

" Select among multiple tag matches
nnoremap <leader>t :ts<cr>

" Open nerdtree to the current file's directory
nnoremap <leader>n :NERDTreeFind<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN INSTALLS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Plug: https://github.com/junegunn/vim-plug

" Install vim plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" FZF: Fuzzy file search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" NERDTree: Directory navigation
Plug 'scrooloose/nerdtree'

" Vim Tab labeling
Plug 'webdevel/tabulous'

" Commenting/Uncommenting
Plug 'scrooloose/nerdcommenter'

" ALE
Plug 'dense-analysis/ale'

" Themes
Plug 'arcticicestudio/nord-vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'morhetz/gruvbox'

" Rails
" Plug 'tpope/vim-rails'

" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" ctags
Plug 'ludovicchabant/vim-gutentags'

" Typescript
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'Quramy/tsuquyomi'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}

" Javascript formatting
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" Markdown previewing
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" Latex previewing
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN CONFIG
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree on ctrl+n
let NERDTreeShowHidden=1
map <silent> <C-n> :NERDTreeToggle<CR>

" close NERDTree after a file is opened
let g:NERDTreeQuitOnOpen=1

" make FZF respect gitignore if `ag` is installed
if (executable('ag'))
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
endif

" Colorscheme
set termguicolors
set background=light
" colorscheme gruvbox
colorscheme nord
" colorscheme PaperColor

" Bind FZF to Ctrl-P
nnoremap <C-P> :Files<CR>

let g:NERDSpaceDelims = 1

" Gutentags Tags config
let g:gutentags_ctags_exclude = ["*.min.js", "*.min.css", "build", "vendor", ".git", "node_modules", "public", "tmp", "frontend", "coverage", "isomorphic-server"]
let g:gutentags_ctags_executable_ruby = 'ripper-tags'
let g:gutentags_ctags_extra_args = ['--recurse']
let g:gutentags_define_advanced_commands = 1
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" Uncomment following line for trace output in vim :messages
" let g:gutentags_trace = 1

" Latex preview config
autocmd Filetype tex setl updatetime=1
let g:livepreview_previewer = 'open -a Preview'
