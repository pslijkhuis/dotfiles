set nocompatible               " be improved, required
filetype plugin on
au BufNewFile,BufRead Jenkinsfile setf groovy

"set cursorline

call plug#begin('~/.local/share/nvim/plugged')
Plug 'takac/vim-hardtime'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'arcticicestudio/nord-vim'
Plug 'morhetz/gruvbox'
Plug 'martinda/Jenkinsfile-vim-syntax'

Plug 'ervandew/supertab'
Plug 'stephpy/vim-yaml'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'vimwiki/vimwiki'

Plug 'fatih/vim-go', { 'branch': 'master' }

Plug 'zchee/deoplete-jedi'

Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

Plug 'dense-analysis/ale'

Plug 'psliwka/vim-smoothie'
Plug 'majutsushi/tagbar'
call plug#end()


" Line numbers
set relativenumber
set number
"highlight LineNr ctermfg=brown
"highlight CursorLineNr ctermfg=yellow

" Vim hard-time
let g:hardtime_default_on = 1
let g:list_of_disabled_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]

" Colors and themes
colorscheme gruvbox
let g:airline_theme='gruvbox'
"highlight Normal ctermbg=NONE

" Deoplete
set completeopt-=preview
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('omni_patterns', {
\ 'go': '[^. *\t]\.\w*',
\})

" Indentation
filetype indent on
set smartindent

" Neosnippets
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" Ale
:hi ALEError cterm=underline ctermfg=red ctermbg=NONE
:hi ALEWarning cterm=underline ctermfg=yellow ctermbg=NONE
let g:ale_virtualtext_cursor = 1
let g:ale_set_balloons = 1 
let g:ale_hover_to_preview = 1
let g:ale_fix_on_save = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'always'

let g:ale_linters = {
      \ 'python': ['flake8'],
      \ 'go': ['gofmt','golangci-lint'],
      \ 'yaml': ['yamllint']
      \ }
let g:ale_fixers = {
      \ 'python': ['autopep8'],
      \ 'go': ['gofmt','goimports']
      \ }
"set background=dark
"highlight Normal ctermbg=NONE
"set termguicolors

" Clipboard
set clipboard=unnamed
set termguicolors

" Tagbar
au BufNewFile,BufRead Jenkinsfile* setf groovy
