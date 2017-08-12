" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim' " plugin manager
Plugin 'vim-airline/vim-airline' " bottom status bar
Plugin 'vim-airline/vim-airline-themes' " botom status themes
Plugin 'dracula/vim' " vim color scheme
Plugin 'scrooloose/nerdtree' " left <C-n> tree repo
Plugin 'majutsushi/tagbar' " right <F8> module artifacts observer
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'L9' " extra vim functions
Plugin 'SuperTab' " auto complete on tab
Plugin 'snipMate' " template snippets
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'valloric/youcompleteme' " code complition engine
Plugin 'airblade/vim-gitgutter' " vim git client
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'scrooloose/syntastic' " syntax checker
Plugin 'VimOutliner' " outline view of a doc, mainly for todos, ideas and objectives

" All of your Plugins must be added before the following line
call vundle#end()            " required

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
syntax on
color dracula

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set backupcopy=yes

if has("vms")
  set nobackup" do not keep a backup file, use versions instead
else
  set backup" keep a backup file (restore to previous version)
  set undofile" keep an undo file (undo changes after closing)
endif
set history=50" keep 50 lines of command line history
set ruler" show the cursor position all the time
set showcmd" display incomplete commands
set incsearch" do incremental searching

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on when the terminal has colors or when using the
" GUI (which always has colors).
 if &t_Co > 2 || has("gui_running")
  " Also switch on highlighting the last used search pattern.
  set hlsearch
  " I like highlighting strings inside C comments.
let c_comment_strings=1
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")
" Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on
  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent " always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
\ | wincmd p | diffthis
endif

if has('langmap') && exists('+langnoremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If unset (default), this may break plugins (but it's backward
  " compatible).
  set langnoremap
endif
set number
" Tab prefs
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set cursorline
set noswapfile
set noundofile
set nobackup

" KEY MAPPING

" Switch between buffers
map <C-Right> :bnext<CR>
map <C-Left> :bprevious<CR>
" Tagbar
map <F8> :TagbarToggle<CR>
" NerdTree
map <C-n> :NERDTreeToggle<CR>
" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" UI PREFERENCES
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=1

set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
" Always show statusline
set laststatus=2

let NERDTreeShowHidden=1

" Airline prefs
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod=':t'
let g:airline_powerline_fonts=1

" Fonts prefs
let g:Powerline_symbols='fancy'

set encoding=utf-8

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8

set colorcolumn=80

