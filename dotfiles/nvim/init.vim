set nocompatible               " be improved, required
filetype plugin on
au BufNewFile,BufRead Jenkinsfile setf groovy

"set cursorline

call plug#begin('~/.local/share/nvim/plugged')

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'morhetz/gruvbox'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/diagnostic-nvim'
Plug 'psliwka/vim-smoothie'
Plug 'psliwka/vim-smoothie'
Plug 'stephpy/vim-yaml'
Plug 'takac/vim-hardtime'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 1000)
colorscheme gruvbox
filetype indent on

inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"

let g:airline_theme='gruvbox'
let g:diagnostic_enable_virtual_text = 1
let g:hardtime_default_on = 1
let g:list_of_disabled_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]

nnoremap <leader><leader> :Files<CR>
nnoremap <leader>C       :Commits<CR>
nnoremap <leader>L       :Lines<CR>
nnoremap <leader>b       :Buffers<CR>
nnoremap <silent> ff    <cmd>lua vim.lsp.buf.formatting()<CR>

set clipboard=unnamed
set completeopt-=preview
set completeopt=menuone,noinsert,noselect
set number
set relativenumber
set shortmess+=c
set signcolumn=yes
set smartindent
set termguicolors

lua << EOF
local on_attach_vim = function(client)
  require'completion'.on_attach(client)
  require'diagnostic'.on_attach(client)
end
require'nvim_lsp'.pyls.setup{on_attach=on_attach_vim}
EOF


