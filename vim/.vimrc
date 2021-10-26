syntax on

set encoding=utf-8
set clipboard=unnamedplus
set exrc
set guicursor=
set nohlsearch
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set backspace=indent,eol,start
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

Plug 'ycm-core/YouCompleteMe'
Plug 'joshdick/onedark.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'dense-analysis/ale'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'lervag/vimtex'

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
autocmd BufRead,BufNewFile *.tex,*.sty,*.bib 
    \ set background=light |
    \ setlocal spell |
    \ colorscheme solarized8
" Set xml files
autocmd BufRead,BufNewFile *.urdf,*.xacro,*.sdf,*.world,*.launch
    \ set filetype=xml 

" Set leader key
let mapleader=" "

" YCM
let g:ycm_autoclose_preview_window_after_completion=1
nnoremap <silent> <leader>yg: YcmCompleter GoTo<CR>

" ALE
let g:ale_linters = {
\   'python': ['flake8', 'pylint', 'pyright'],
\   'xml': ['xmllint'],
\   'tex': ['textlint'],
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['black'],
\   'xml': ['xmllint'],
\   'tex': ['textlint'],
\}
nnoremap <leader>ad :ALEGoToDefinition<CR>
nnoremap <leader>al :ALELint<CR>
nnoremap <leader>af :ALEFix<CR>
call ch_logfile(expand('/tmp/chlogfile.log'), 'w')

" Set lightline
set laststatus=2
set noshowmode

" NERDTree
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>nl :LLPStartPreview<CR>

" Set nerdcommenter 
let g:NERDSpaceDelims = 1
" let g:NERDCompactSexyComs = 1
let g:NERDCommentEmptyLines = 1
let g:NERDToggleCheckAllLines = 1
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" vim-fugitive
nnoremap <leader>g :G<CR>

" Vimtex 
let g:tex_flavor = 'latex'
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'
