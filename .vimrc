 "- Ultra Setup (VSCode-like Experience)
" ========================================

" ----------------------------
" Plugin Manager: vim-plug
" ----------------------------
call plug#begin('~/.vim/plugged')

" === UI & Appearance ===
Plug 'morhetz/gruvbox'                     
Plug 'vim-irline/vim-airline-themes'      
Plug 'ryanoasis/vim-devicons'              
Plug 'junegunn/goyo.vim'                    
Plug 'junegunn/limelight.vim'               
Plug 'akinsho/bufferline.nvim'              
Plug 'nvim-lualine/lualine.nvim'            
Plug 'glepnir/dashboard-nvim'               
Plug 'folke/which-key.nvim'                 

" === File Navigation & Fuzzy Finder ===
Plug 'preservim/nerdtree'                   
Plug 'Xuyuanp/nerdtree-git-plugin'          
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'                      
Plug 'airblade/vim-rooter'                  
Plug 'ThePrimeagen/harpoon'                  

" === Language Server Protocol (LSP) ===
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'                  
Plug 'ray-x/lsp_signature.nvim'               
Plug 'folke/neodev.nvim'                       

" === Autocomplete ===
Plug 'SirVer/ultisnips'                      
Plug 'honza/vim-snippets'                    
Plug 'zchee/deoplete-clang'                  
Plug 'zchee/deoplete-jedi'                   

" === Git Tools ===
Plug 'tpope/vim-fugitive'                    
Plug 'airblade/vim-gitgutter'                
Plug 'sindrets/diffview.nvim'                 
Plug 'tpope/vim-rhubarb'                     
Plug 'lewis6991/gitsigns.nvim'               

" === Tools ===
Plug 'scrooloose/nerdcommenter'              
Plug 'preservim/tagbar', {'do': 'majutsushi/tagbar.git'}                      
Plug 'mbbill/undotree'                       
Plug 'norcalli/nvim-colorizer.lua'          
Plug 'sheerun/vim-polyglot'                  

" === Edition Plugins ===
Plug 'junegunn/vim-easy-align'               
Plug 'godlygeek/tabular'                     
Plug 'jiangmiao/auto-pairs'                  
Plug 'alvan/vim-closetag'                    
Plug 'wellle/targets.vim'                    
Plug 'bkad/CamelCaseMotion'                  
Plug 'jlanzarotta/bufexplorer'               
Plug 'matze/vim-move'                        


call plug#end()

" ----------------------------
" General Settings
" ----------------------------
syntax on
set number
set relativenumber
set encoding=utf-8
set fileencoding=utf-8
set clipboard=unnamedplus
set hidden
set mouse=a
set ignorecase
set smartcase
set incsearch
set hlsearch
set splitbelow
set splitright
set termguicolors
set cursorline

" ----------------------------
" Theme
" ----------------------------
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'
set background=dark

" ----------------------------
" Airline Config
" ----------------------------
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='gruvbox'

" ----------------------------
" NERDTree Config
" ----------------------------
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" ----------------------------
" FZF Config
" ----------------------------
nnoremap <C-p> :Files<CR>
nnoremap <C-f> :Rg<CR>

" ----------------------------
" coc.nvim (LSP)
" ----------------------------
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ coc#refresh()

let g:coc_global_extensions = [
      \ 'coc-json',
      \ 'coc-tsserver',
      \ 'coc-pyright',
      \ 'coc-clangd',
      \ 'coc-go',
      \ 'coc-html',
      \ 'coc-css',
      \ 'coc-snippets'
      \]

" ----------------------------
" Auto Pairs
" ----------------------------
let g:AutoPairsMapBS = 1

" ----------------------------
" Tagbar
" ----------------------------
nnoremap <F8> :TagbarToggle<CR>

" ----------------------------
" Misc Keymaps
" ----------------------------
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>fg :GFiles<CR>
nnoremap <Leader>fb :Buffers<CR>
nnoremap <Leader>fh :Helptags<CR>
nnoremap <Leader>us :UndotreeToggle<CR>

