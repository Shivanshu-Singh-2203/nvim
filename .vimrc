" =======================
"  Plugin Manager: vim-plug
" =======================
call plug#begin('~/.vim/plugged')

" --- UI & Appearance ---
Plug 'morhetz/gruvbox'                      " Gruvbox theme
Plug 'ryanoasis/vim-devicons'               " Icons for files
Plug 'vim-airline/vim-airline-themes'       " Airline themes for Gruvbox

" --- File Navigation ---
Plug 'preservim/nerdtree'                    " File explorer
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy finder
Plug 'junegunn/fzf.vim'                       " FZF integration

" --- Git Integration ---
Plug 'tpope/vim-fugitive'                     " Git wrapper
Plug 'airblade/vim-gitgutter'                 " Git diff in gutter

" --- Code Editing ---
Plug 'neoclide/coc.nvim', {'branch': 'release'}  " LSP + Completion
Plug 'jiangmiao/auto-pairs'                    " Auto close brackets/quotes
Plug 'tpope/vim-commentary'                    " Easy commenting
Plug 'tpope/vim-surround'                      " Surround editing
Plug 'dense-analysis/ale'                      " Async linting/fixing

" --- Syntax & Language ---
Plug 'sheerun/vim-polyglot'                    " Language packs
Plug 'preservim/tagbar'                        " Code structure viewer

" --- Productivity ---
Plug 'tpope/vim-repeat'                        " Repeat last change with .
Plug 'easymotion/vim-easymotion'              " Fast navigation
Plug 'mbbill/undotree'                         " Undo tree visualizer

" --- Snippets ---
Plug 'honza/vim-snippets'                      " Snippets collection
Plug 'SirVer/ultisnips'                        " Snippet engine

call plug#end()

" =======================
"  ALE settings — stop lint while typing
" =======================
let g:ale_lint_on_text_changed = 'never'    " Stop linting while typing
let g:ale_lint_on_insert_leave = 1          " Lint when leaving insert mode
let g:ale_lint_on_save = 1                  " Lint when saving

" =======================
"  General Settings
" =======================
set number
set relativenumber
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set wrap
set cursorline
syntax enable
set background=dark
colorscheme gruvbox

" =======================
"  Airline Gruvbox Theme
" =======================
let g:airline_theme='gruvbox'

" =======================
"  Keymaps
" =======================
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-p> :Files<CR>
nnoremap <leader>f :Rg<CR>
nnoremap <leader>t :TagbarToggle<CR>
nnoremap <leader>u :UndotreeToggle<CR>

" =======================
"  Coc.nvim Autocompletion
" =======================
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()

inoremap <silent><expr> <S-TAB>
      \ pumvisible() ? "\<C-p>" :
      \ "\<C-h>"

inoremap <silent><expr> <CR>
      \ pumvisible() ? coc#_select_confirm() :
      \ "\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" =======================
"  FZF settings
" =======================
let g:fzf_layout = { 'down': '40%' }

