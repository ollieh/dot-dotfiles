" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
" Initialize plugin system
call plug#begin('~/.local/share/nvim/plugged')
" Colourschemes
Plug 'romainl/Apprentice'
"Plug 'arcticicestudio/nord-vim'
"" BASE64
Plug 'christianrondeau/vim-base64'
"" LANGUAGE SERVER
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
"" LINTING
Plug 'w0rp/ale'
"" FUZZY FILE SEARCH
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"" SEARCH IN FILES
"Plug 'eugen0329/vim-esearch'
Plug 'mhinz/vim-grepper'
"" TABS (buffers)
Plug 'ap/vim-buftabline'
call plug#end()

set grepprg=rg\ --vimgrep
set grepformat^=%f:%l:%c:%m

"Support 24-bit colour
colorscheme apprentice

nnoremap <c-p> :FZF<cr>
augroup fzf
  autocmd!
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
augroup END

nnoremap <leader>g :Grepper -tool rg<cr>
nnoremap <leader>G :Grepper -tool rg -buffers<cr>

set hidden
nnoremap <M-k> :bnext<CR>
nnoremap <M-j> :bprev<CR>
nnoremap <M-n> :enew<CR>
nnoremap <M-q> :bdelete<CR>

set wildmode=longest,list 
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Spaces & Tabs {{{
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " number of spaces to use for autoindent
set expandtab       " tabs are space
set autoindent
set copyindent      " copy indent from the previous line
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType haskell setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType python setlocal ts=2 sts=2 sw=2 expandtab
" }}} Spaces & Tabs
