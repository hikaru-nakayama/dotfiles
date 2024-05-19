set number
set guifont=DroidSansMono\ Nerd\ Font\ 13
set guifontwide=DroidSansMono\ Nerd\ Font\ 13
set hlsearch
set smartindent
set ruler
set history=1000
set encoding=utf8
set clipboard+=unnamed
syntax enable

"// PLUGIN SETTINGS
call plug#begin('~/.config/nvim/plugged')

Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'shaunsingh/nord.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.5' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" coc.nvim SETTINGS
autocmd CursorHold * silent call CocActionAsync('highlight')
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
"スペースfmtでFormat
nmap <silent> <space>fmt <Plug>(coc-format)
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"


" NERDTree SETTINGS
nmap <C-f> :NERDTreeToggle<CR>
let g:airline#extensions#tabline#enabled = 1
nmap <C-p> <Pluag>AirlineSelectPrevTab
nmap <C-n> <Plug>AirlineSelectNextTab

" Airline SETTINGS
let g:airline_powerline_fonts = 1

" Esc SETTINGS
inoremap jj <Esc>

" Example config in Vim-Script
let g:nord_contrast = v:true
let g:nord_borders = v:false
let g:nord_disable_background = v:false
let g:nord_italic = v:false
let g:nord_uniform_diff_background = v:true
let g:nord_bold = v:false

" Find files using Telescope command-line sugar.
" Find files using Telescope command-line sugar.
nnoremap :ff <cmd>Telescope find_files<cr>
nnoremap :fg <cmd>Telescope live_grep<cr>
nnoremap :fb <cmd>Telescope buffers<cr>
nnoremap :fh <cmd>Telescope help_tags<cr>

call plug#end()

colorscheme nord
