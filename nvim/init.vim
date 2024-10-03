set number
set guifont=DroidSansMono\ Nerd\ Font\ 13
set guifontwide=DroidSansMono\ Nerd\ Font\ 13
set hlsearch
set smartindent
set ruler
set history=1000
set encoding=utf8
set clipboard+=unnamedplus
set nowrap
set cursorline
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
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'neovim/nvim-lspconfig'
Plug 'yaegassy/coc-ruby-syntax-tree', {'do': 'yarn install --frozen-lockfile'}
Plug 'numToStr/Comment.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'dinhhuy258/git.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

nnoremap <silent> <Space>a ggVG
nnoremap C :let @+= expand('%')<CR>
nnoremap <silent> <Space>w :GBrowse<CR>

" coc.nvim SETTINGS
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
let g:airline#extensions#tabline#enabled = 1
nmap <C-p> <Pluag>AirlineSelectPrevTab
nmap <C-n> <Plug>AirlineSelectNextTab
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-s> :NERDTreeFind<CR>


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
nnoremap <Space>G :lua require('telescope.builtin').live_grep({ search_dirs = {vim.fn.input("Directory: ")} })<CR>
nnoremap <silent> <Space>f :Telescope find_files<CR>
nnoremap <silent> <Space>g :Telescope live_grep<CR>
nnoremap <silent> <Space>b :Telescope buffers<CR>
nnoremap :fh <cmd>Telescope help_tags<cr>

call plug#end()

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  }
}
require('git').setup()
require('gitsigns').setup()
require('gitsigns').setup {
  current_line_blame = true,
}
EOF

lua require('Comment').setup()
colorscheme nord

