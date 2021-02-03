filetype plugin on
au BufNewFile,BufRead Jenkinsfile setf groovy

call plug#begin('~/.local/share/nvim/plugged')

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'psliwka/vim-smoothie'
Plug 'psliwka/vim-smoothie'
Plug 'stephpy/vim-yaml'
Plug 'hashivim/vim-terraform'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'mhartington/oceanic-next'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'
Plug 'tpope/vim-fugitive'
Plug 'RishabhRD/popfix'
Plug 'RishabhRD/nvim-lsputils'
Plug 'airblade/vim-gitgutter'
Plug 'npxbr/glow.nvim', {'do': ':GlowInstall'}
Plug 'thecodesmith/vim-groovy'
Plug 'ayu-theme/ayu-vim'
Plug 'Yggdroot/indentLine'
Plug 'christianchiarulli/nvcode-color-schemes.vim'
Plug 'glepnir/lspsaga.nvim'
Plug 'itchyny/lightline.vim'    " Dependency: status line
Plug 'spywhere/lightline-lsp'

call plug#end()

autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 1000)

let ayucolor="mirage"
colorscheme ayu


let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
filetype indent on

inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"

let g:airline_theme='oceanicnext'
let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_enable_underline = 0
let g:diagnostic_auto_popup_while_jump = 1
let g:diagnostic_insert_delay = 1
let g:terraform_align=1
let g:terraform_fmt_on_save=1

nnoremap <leader><leader> :Files<CR>

nnoremap <leader>C       :Commits<CR>
nnoremap <leader>L       :Lines<CR>
nnoremap <leader>b       :Buffers<CR>
nnoremap <silent> ff    <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <leader>p :Glow<CR>
" Magic buffer-picking mode
nnoremap <silent> <Leader>s :BufferPick<CR>
" Sort automatically by...
" Move to previous/next
nnoremap <silent>    <Leader>, :BufferPrevious<CR>
nnoremap <silent>    <Leader>. :BufferNext<CR>
" Re-order to previous/next
nnoremap <silent>    <Leader>< :BufferMovePrevious<CR>
nnoremap <silent>    <Leader>> :BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent>    <Leader>1 :BufferGoto 1<CR>
nnoremap <silent>    <Leader>2 :BufferGoto 2<CR>
nnoremap <silent>    <Leader>3 :BufferGoto 3<CR>
nnoremap <silent>    <Leader>4 :BufferGoto 4<CR>
nnoremap <silent>    <Leader>5 :BufferGoto 5<CR>
nnoremap <silent>    <Leader>6 :BufferGoto 6<CR>
nnoremap <silent>    <Leader>7 :BufferGoto 7<CR>
nnoremap <silent>    <Leader>8 :BufferGoto 8<CR>
nnoremap <silent>    <Leader>9 :BufferLast<CR>
" Close buffer
nnoremap <silent>    <Leader>c :BufferClose<CR>
nnoremap <silent>    <Leader>n :new<CR>

set clipboard=unnamed
set completeopt-=preview
set completeopt=menuone,noinsert,noselect
set number
set relativenumber
set shortmess+=c
set signcolumn=yes
set smartindent
set termguicolors


let g:lightline = {}

let g:lightline.component_expand = {
      \  'linter_hints': 'lightline#lsp#hints',
      \  'linter_infos': 'lightline#lsp#infos',
      \  'linter_warnings': 'lightline#lsp#warnings',
      \  'linter_errors': 'lightline#lsp#errors',
      \  'linter_ok': 'lightline#lsp#ok',
      \ }

let g:lightline.component_type = {
      \     'linter_hints': 'right',
      \     'linter_infos': 'right',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'right',
      \ }

let g:lightline.active = { 'right': [[ 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_hints', 'linter_ok' ]] }


lua << EOF
local on_attach_vim = function(client)
  require'completion'.on_attach(client)
end
require'lspconfig'.terraformls.setup{}
require'lspconfig'.pyls.setup{on_attach = on_attach_vim;
                             settings = {
                               pyls = {
                                  plugins = {
                                       pydocstyle = {enabled = false}
                                       }
                                   }
                                 }
                              }
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c", "rust" },  -- list of language that will be disabled
  },
}

local saga = require 'lspsaga'
saga.init_lsp_saga()
EOF

