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
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" FZF: https://github.com/junegunn/fzf.vim
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" NERDTree
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
Plug 'tpope/vim-rails'

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
colorscheme gruvbox
" colorscheme nord
" colorscheme PaperColor

" Bind FZF to Ctrl-P
nnoremap <C-P> :Files<CR>

let g:NERDSpaceDelims = 1

" Gutentags Tags config
let g:gutentags_ctags_exclude = ["*.min.js", "*.min.css", "build", "vendor", ".git", "node_modules", "public", "tmp", "frontend", "coverage", "isomorphic-server"]
let g:gutentags_ctags_executable_ruby = 'ripper-tags'
let g:gutentags_ctags_extra_args = ['--ignore-unsupported-options', '--recursive']
let g:gutentags_define_advanced_commands = 1
