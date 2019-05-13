" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
" Initialize plugin system
call plug#begin('~/.local/share/nvim/plugged')
" Colourschemes
Plug 'romainl/Apprentice'
"Plug 'arcticicestudio/nord-vim'
"" BASE64
" <leader>btoa: convert to base64
" <leader>atob: convert from base64
Plug 'christianrondeau/vim-base64'
" VIM + TMUX SPLIT NAVIGATION
" ctrl+j: down
" ctrl+k: up
" ctrl+h: left
" ctrl+l: right
Plug 'christoomey/vim-tmux-navigator'
"" LANGUAGE SERVER
" gd: go to definition
" gr: go to references / usages
" gy: go to type definition
" gi: go to implementation
" <leader>rn: rename
" K: documentation
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
"" LINTING
Plug 'w0rp/ale'
"" FUZZY FILE SEARCH
" ctrl+p: search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"" SEARCH
" <leader>g: search files
" <leader>g: search buffers
Plug 'mhinz/vim-grepper'
"" TABS (buffers)
" alt+j: previous buffer
" alt+k: next buffer
Plug 'ap/vim-buftabline'
"" NEXT ] PREV [ BINDINGS
" ]l: next in location list
" [l: previous in location list
Plug 'tpope/vim-unimpaired'
"" SURROUND
Plug 'tpope/vim-surround'
"" COMMENTARY
" gc: toggle comments
Plug 'tpope/vim-commentary'
"" SNEAK (two character find)
" s: sneak instantly
" z: sneak as motion
Plug 'justinmk/vim-sneak'
call plug#end()

nnoremap <leader>g :Grepper -tool rg<cr>
nnoremap <leader>G :Grepper -tool rg -buffers<cr>

nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

" Optional. The default behaviour should work for most users.
let g:grepper               = {}
let g:grepper.tools         = ['git', 'ag', 'rg']
let g:grepper.jump          = 1
let g:grepper.next_tool     = '<leader>g'
let g:grepper.simple_prompt = 1
let g:grepper.quickfix      = 0

"Support 24-bit colour
colorscheme apprentice

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

nnoremap <c-p> :FZF<cr>
augroup fzf
  autocmd!
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
augroup END

set hidden
nnoremap <M-k> :bnext<CR>
nnoremap <M-j> :bprev<CR>
nnoremap <M-n> :enew<CR>
nnoremap <M-q> :bdelete<CR>

set wildmode=longest,list 
"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>

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
