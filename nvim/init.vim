" =================================================
" Functions
" =================================================

" Use git-stripspace
function! StripWhitespace()
  let l = line(".")
  let c = col(".")
  %!git stripspace
  call cursor(l, c)
endfunction

" =================================================
" Plugins
" =================================================

call plug#begin('~/.local/share/nvim/plugged')

" `ctrl + d` open Nerdtree
Plug 'scrooloose/nerdtree'

" `ctrl + p` quick file opening
Plug 'junegunn/fzf'

" `:Ack [options] {pattern} [{directories}]` Search everywhere
Plug 'mileszs/ack.vim'

" `'` Quick comment
Plug 'tpope/vim-commentary'

" Git status in gutter
Plug 'airblade/vim-gitgutter'

" TESTING better language support?
Plug 'sheerun/vim-polyglot'

" one dark theme
Plug 'joshdick/onedark.vim'

" multi cursor
Plug 'terryma/vim-multiple-cursors'

call plug#end()

" Use rg instead of ack
let g:ackprg = 'rg --vimgrep'

" NERDTree
nnoremap <C-d> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" vim-json
let g:vim_json_syntax_conceal = 0

" vim-ruby
let g:ruby_indent_access_modifier_style = 'normal'
let g:ruby_indent_assignment_style = 'variable'
let g:ruby_indent_block_style = 'do'

" =================================================
" Configs
" =================================================

" Colors
syntax on
colorscheme onedark

" Leader stuff
let mapleader=","
nnoremap <Leader>c :nohl<CR>
nnoremap <Leader>w :call StripWhitespace()<CR>:w<CR>

" Copy current file path
" nnoremap <silent> <leader>y :let @+=expand("%")<CR>
nnoremap <leader>y :let @+=expand("%")<CR>

" Relative line number hybrid mode
set rnu
set nu

" Convenience
set nobackup noswapfile

" Splits
set splitright
set splitbelow
set fillchars=""

nnoremap <silent> <Leader>= :exe "vertical resize +30"<CR>
nnoremap <silent> <Leader>- :exe "vertical resize -30"<CR>

" / Search
set ic

" text editing
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set textwidth=0
set nowrap
set formatoptions-=t " Auto-wrap text
set formatoptions-=c " Auto-wrap comments
set formatoptions-=l " Auto-wrap in insert mode
set scrolloff=2 " 2 line of padding when scrolling

" Remap

" FZF
nnoremap <C-p> :FZF<CR>

" Quick comment toggling
noremap \ :Commentary<CR>

" =================================================
" Clipboard
" =================================================

" https://github.com/spf13/spf13-vim/blob/7d48f769d1c991f82beee18a7f644b4ed351e5ce/.vimrc#L73-L79
if has('clipboard')
  if has('unnamedplus') " When possible use + register for copy-paste
    set clipboard=unnamedplus
  else " On mac and Windows, use * register for copy-paste
    set clipboard=unnamed
  endif
end
