set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

" tags show
Plugin 'majutsushi/tagbar'
" syntax check
Plugin 'scrooloose/syntastic'
" fuzzy file finder
Plugin 'kien/ctrlp.vim'
" status line
Plugin 'Lokaltog/vim-powerline'
" directory list
Plugin 'scrooloose/nerdtree'
map <C-E> :NERDTreeToggle<CR>
Plugin 'Xuyuanp/nerdtree-git-plugin'
" code comment
Plugin 'scrooloose/nerdcommenter'
" show/strip trailing whitespace
Plugin 'ntpeters/vim-better-whitespace'
" language syntax support
Plugin 'rust-lang/rust.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'evanmiller/nginx-vim-syntax'
Plugin 'mxw/vim-jsx.git'
Plugin 'wavded/vim-stylus'
" colorschemes
Plugin 'nanotech/jellybeans.vim'
Plugin 'noahfrederick/vim-hemisu'
" surroundings
Plugin 'tpope/vim-surround'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" make vim recognise .md file as markdown instead of modular2
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufRead *.hbs set filetype=html
autocmd FileType javascript,html,css,stylus setlocal sw=2 sts=2 et
autocmd FileType c,sh,python,rust setlocal sw=4 sts=4 et
autocmd FileType makefile setlocal sw=4 sts=4

set encoding=utf-8
set laststatus=2
set hlsearch
set incsearch
set number
set backspace=indent,eol,start
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent
set cindent

" colorscheme setting
let hour=strftime('%H')
if hour<12 && hour>5
    set background=light
else
    set background=dark
endif
set t_Co=256 " terminal 256/16

colo jellybeans
" colo hemisu

" cursorline highlight, must set after colorscheme
set cursorline
"hi CursorLine term=bold cterm=bold

" shortcut to rapidly tobble `set list` \s
map <leader>s :set list!<CR>
" set list
set listchars=tab:»·,trail:·,nbsp:%,eol:¬,extends:>,precedes:<

"""""""""""""""""""""""""
""" Plugin Specific Config
"""""""""""""""""""""""""
"" tagbar
nnoremap <silent> <F9> :TagbarToggle<CR>

"" nerdtree mapping
map <F2> :NERDTreeToggle<CR>

"" vim-better-whitespace config
hi ExtraWhitespace ctermbg=red
map <F3> :StripWhitespace<CR>
" auto strip trailing white space on file saving
" let g:strip_whitespace_on_save=1

"" tagbar
let g:tagbar_type_rust = {
 \ 'ctagstype' : 'rust',
 \ 'kinds' : [
     \'T:types,type definitions',
     \'f:functions,function definitions',
     \'g:enum,enumeration names',
     \'s:structure names',
     \'m:modules,module names',
     \'c:consts,static constants',
     \'t:traits,traits',
     \'i:impls,trait implementations',
 \ ]
 \ }

"" syntastic
set statusline+=%#warningmsg#
""set statusline+=%{SyntasticStatuslineFlag()}
let g:statline_syntastic = 0
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
