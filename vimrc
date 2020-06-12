syntax on                                                                                                                       
                                                                                                                                
set tabstop=4 softtabstop=4                                                                                                     
set shiftwidth=4                                                                                                                
set expandtab                                                                                                                   
set nu                                                                                                                          
set wrap                                                                                                                        
set linebreak                                                                                                                   
set incsearch                                                                                                                   
                                                                                                                                
set colorcolumn=128                                                                                                             
highlight ColorColumn ctermbg=0 guibg=lightgrey                                                                                 
                                                                                                                                
call plug#begin()                                                                                                               
                                                                                                                                
Plug 'Valloric/YouCompleteMe'                                                                                                   
Plug 'morhetz/gruvbox'                                                                                                          
Plug 'lifepillar/vim-solarized8'                                                                                                
Plug 'scrooloose/nerdtree'                                                                                                      
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }                                                                          
Plug 'lervag/vimtex'                                                                                                            
Plug 'dense-analysis/ale'

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
                                                                                                                                
autocmd BufRead,BufNewFile *.tex,*.sty,*.bib set background=light                                                               
autocmd BufRead,BufNewFile *.tex,*.sty,*.bib colorscheme solarized8                                                             
                                                                                                                                
let mapleader=" "                                                                                                               
let g:livepreview_previewer = 'okular'                                                                                          
                                                                                                                                
" NERDTree                                                                                                                      
nnoremap <leader>n :NERDTreeToggle<CR>                                                                                          
nnoremap <leader>ll :LLPStartPreview<CR>                                                                                        
                                                                                                                                
" "YCM                                                                                                                          
nnoremap <silent> <leader>gd: YcmCompleter GoTo<CR>                                                                             
nnoremap <silent> <leader>gd: YcmCompleter FixIt<CR>                                                                            
                                                                                                                                
" Spell check                                                                                                                   
autocmd BufRead,BufNewFile *.md,*.tex setlocal spell