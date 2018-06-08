set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Yggdroot/indentLine'
Plugin 'itchyny/lightline.vim'
Plugin 'ervandew/supertab'
Plugin 'YorickPeterse/happy_hacking.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'scrooloose/nerdcommenter'
Plugin 'jiangmiao/auto-pairs'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'mhinz/vim-startify'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" General
syntax on
set laststatus=2
set cc=80
set noshowmode
set ttimeoutlen=1
set scrolloff=9999
set number
set showcmd
set tabstop=4
set shiftwidth=4
set expandtab
set incsearch
set ignorecase
colo happy_hacking

" Mapping
autocmd FileType c,cpp map <F3> <esc>:w <CR> :!g++ % -W -Woverflow -Wall -Werror -o ~/git/euler-cpp/a.out<CR>
autocmd FileType c,cpp imap <F3> <esc>:w <CR> :!g++ % -W -Woverflow -Wall -Werror -o ~/git/euler-cpp/a.out<CR>
autocmd FileType c,cpp map <C-K><C-F> :py3f /usr/share/clang/clang-format-6.0/clang-format.py<cr>
autocmd FileType c,cpp vmap <C-K><C-F> :py3f /usr/share/clang/clang-format-6.0/clang-format.py<cr>
autocmd FileType c,cpp nmap <C-C> i//<esc>
map <F5> <esc>:so %<CR>
map <C-y> "+y
map <C-p> <esc>"+p
map <space><space> /<++><CR>"_c4l
imap <C-p> <esc>"+p
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
map <C-Z> <C-R>
map <F9> <esc><c-W>}


" NERDtree
let g:NERDTreeWinPos="left"
let g:NERDTreeDirArrows=0
map <C-t> :NERDTreeToggle<CR>
" NERDtree

" Tmux
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
"nnoremap <silent> <C-m> :TmuxNavigatePrevious<cr>

" Supertab
let g:SuperTabDefaultCompletionType = "context"

" Ctags
set tags+=~/.vim/tags/cpp

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview
map <F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" Snippets
nnoremap ,c :-1read ~/.vim/.skeleton.cpp<CR>
