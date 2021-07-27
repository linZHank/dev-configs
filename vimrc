syntax on

set clipboard=unnamedplus
set exrc
set guicursor=
set nohlsearch
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set noswapfile
set nobackup
set undodir=~/.vim/undodir/
set undofile
set incsearch
set termguicolors
set scrolloff=8
set nowrap
set colorcolumn=80
set signcolumn=yes

highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin()

Plug 'davidhalter/jedi-vim'
" Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/nerdtree'
Plug 'lervag/vimtex'
Plug 'tpope/vim-fugitive'
Plug 'dense-analysis/ale'
Plug 'itchyny/lightline.vim'
Plug 'joshdick/onedark.vim'
Plug 'lifepillar/vim-solarized8'

call plug#end()

" Enable true color 启用终端24位色
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

" Set background and colorscheme
set background=dark
colorscheme onedark

" Set status line
set laststatus=2
set noshowmode

" Set color and spell for text editing
autocmd BufRead,BufNewFile *.tex,*.sty,*.bib 
    \ set background=light |
    \ setlocal spell |
    \ colorscheme solarized8

" Set leader key
let mapleader=" "

" vim-fugitive
nnoremap <leader>g :G<CR>

" NERDTree
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>ll :LLPStartPreview<CR>

" YCM
let g:ycm_autoclose_preview_window_after_completion=1
nnoremap <silent> <leader>yg: YcmCompleter GoTo<CR>
nnoremap <silent> <leader>yf: YcmCompleter FixIt<CR>

" Vimtex 
let g:tex_flavor = 'latex'
let g:livepreview_previewer = 'okular'

" ALE
let g:ale_completion_enable = 1
