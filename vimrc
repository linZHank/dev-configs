syntax on
set t_Co=256
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set nu
set wrap
set linebreak
set incsearch
set clipboard=unnamedplus
set undodir=~/.vim/undodir
set undofile

set colorcolumn=128
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin()

Plug 'Valloric/YouCompleteMe'
Plug 'morhetz/gruvbox'
Plug 'lifepillar/vim-solarized8'
Plug 'scrooloose/nerdtree'
Plug 'lervag/vimtex'
Plug 'tpope/vim-fugitive'
Plug 'dense_analysis/ale'
Plug 'powerline/powerline'


call plug#end()

" Enable true color 启用终端24位色
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

" Set background and colorscheme
set background=dark
colorscheme gruvbox

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
