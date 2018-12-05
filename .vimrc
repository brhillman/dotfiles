""""""""""""""""
" Plugin stuff
""""""""""""""""
set nocompatible            " be iMproved, required
filetype off                " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/.vim/bundle/Vundle.vim')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins for better writting support
Plugin 'reedes/vim-pencil'
Plugin 'junegunn/goyo.vim'
 
" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" support for NCL syntax highlighting
au BufRead,BufNewFile *.ncl set filetype=ncl
au! Syntax newlang source $VIM/ncl.vim 

" Configuration for the vim-pencil plugin
let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'
au BufRead,BufNewFile *.md set filetype=mkd
augroup pencil
    autocmd!
    autocmd FileType markdown,mkd call pencil#init()
    autocmd FileType text,tex     call pencil#init()
augroup END

" Local configuration
syntax enable
set expandtab
set tabstop=4
set shiftwidth=4

autocmd FileType fortran setlocal shiftwidth=3 tabstop=3
autocmd FileType c setlocal shiftwidth=8 tabstop=8

" Tell vim that *.pf files should be read as FORTRAN
au BufRead *.pf set syntax=fortran

set mouse=a
