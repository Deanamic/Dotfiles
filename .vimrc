"vim-plug {{{
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" }}}
" LEADER {{{
nnoremap <space> <Nop>
let mapleader=" "
" }}}
" PLUGS {{{
call plug#begin('~/.vim/plugged')

Plug 'mhartington/oceanic-next'
Plug 'simnalamburt/vim-mundo'
" FZF {{{{{{
Plug '/usr/bin/fzf'
Plug 'junegunn/fzf.vim'
nnoremap <leader>ff :Files<CR>
nnoremap <leader>bb :Buffers<CR>
nnoremap <leader>ss :Lines<CR>
" }}}}}}
" POLYGLOT {{{{{{
Plug 'sheerun/vim-polyglot'
" }}}}}}
" VIM FUGITIVE {{{{{{
Plug 'tpope/vim-fugitive'
" }}}}}}
" COC nvim {{{{{{
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" }}}}}}
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'editorconfig/editorconfig-vim'
" AIRLINE {{{{{{
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='fruit_punch'
" }}}}}}

" indent line {{{{{{
Plug 'Yggdroot/indentLine'
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
" }}}}}}
"
" COMMENTING {{{{{{
Plug 'scrooloose/nerdcommenter'
" }}}}}}
"
Plug 'tpope/vim-surround'
Plug 'matze/vim-move'
Plug 'tpope/vim-repeat'

call plug#end()
" }}}

filetype plugin indent on
syntax enable

runtime macros/matchit.vim

set autoindent
set backspace=indent,eol,start
set hidden
set ruler
"TABS {{{
set tabstop=4
set softtabstop=4
set expandtab
" }}}
"UI {{{
set number relativenumber
set showcmd
set cursorline
filetype indent on
set wildmenu
set lazyredraw
set showmatch
" }}}
"SEARCH {{{
set incsearch
set hlsearch
nnoremap <space>sc :nohlsearch<CR>
" }}}
"FOLD {{{
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent
" }}}
"MOVEMENT {{{
nnoremap j gj
nnoremap k gk
" }}}
"LEADER {{{
inoremap fd <esc>
"}}}
"UNDO {{{
nnoremap <leader>au :MundoToggle<CR>
"}}}
"EDIT {{{
nnoremap gV `[v`]
"}}}
"SAVE {{{
nnoremap <space>fS :mksession!<CR>
nnoremap <space>fs :w<CR>
"}}}
"BACKUP {{{
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
"}}}
"COLORS {{{
if (has("termguicolors"))
  set termguicolors
endif
colorscheme OceanicNext
"}}}
" WHITESPACE {{{
"nnoremap <space>wd :%s/\s\+$//e<CR>
nnoremap <space>wd :let _save_pos=getpos(".") <Bar>
    \ :let _s=@/ <Bar>
    \ :%s/\s\+$//e <Bar>
    \ :let @/=_s <Bar>
    \ :nohl <Bar>
    \ :unlet _s<Bar>
    \ :call setpos('.', _save_pos)<Bar>
    \ :unlet _save_pos<CR><CR>
" }}}
set modelines=1
" vim:foldmethod=marker:foldlevel=0
