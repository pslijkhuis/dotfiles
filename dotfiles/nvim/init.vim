filetype plugin on
au BufNewFile,BufRead Jenkinsfile setf groovy

call plug#begin('~/.local/share/nvim/plugged')

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'neovim/nvim-lspconfig'
"Plug 'nvim-lua/completion-nvim'
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
Plug 'Yggdroot/indentLine'
Plug 'christianchiarulli/nvcode-color-schemes.vim'
Plug 'b3nj5m1n/kommentary'
Plug 'sainnhe/gruvbox-material'
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
Plug 'kyazdani42/nvim-web-devicons' " lua
Plug 'hrsh7th/nvim-compe'
Plug 'psf/black', { 'branch': 'stable' }

call plug#end()

autocmd BufWritePre *.py execute ':Black'

let g:gruvbox_material_background = 'soft'
colorscheme gruvbox-material


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
nnoremap <silent> ff    <cmd>:Black<CR>
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
set number
set completeopt=menuone,noselect
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

"compe

let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

lua << EOF
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
require('kommentary.config').use_extended_mappings()
EOF

