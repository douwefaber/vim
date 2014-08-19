"Douwe's vimrc
"load the vimrc once it's saved
"-----------------------------------------------------------------------------
" Manage plugins through Vundle
"-----------------------------------------------------------------------------

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" required!

Bundle 'gmarik/vundle'

"-----------------------------------------------------------------------------
" My Bundles here:
"-----------------------------------------------------------------------------
" Autocompletion for the D language
Bundle "Hackerpilot/DCD", {'rtp': 'editors/vim'}

" AutoCompletion popup
Bundle 'AutoComplPop'

" Change word in multiple places <C-n>
Bundle 'terryma/vim-multiple-cursors'

" File browser
Bundle 'scrooloose/nerdtree'

" Switch between implementation and header files
Bundle 'vim-scripts/a.vim'

" The GIT plugin
Bundle 'tpope/vim-fugitive'

" Commenting out code gcc for one line gcap for a paragraph
Bundle 'tpope/vim-commentary'

" Visualizing markdown documents
Bundle 'tpope/vim-markdown'

" Syntax check for python
Bundle 'scrooloose/syntastic'

" Bundle 'msanders/snipmate.vim'
" Bundle 'drmingdrmer/xptemplate'
" Bundle 'xolox/vim-misc'
" Bundle 'xolox/vim-shell'
" Bundle 'OmniCppComplete'
Bundle 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'

" Bundle 'klen/python-mode'
" Bundle 'Lokaltog/vim-powerline'
" Bundle 'derekwyatt/vim-protodef'
" Bundle 'derekwyatt/vim-fswitch'
" Bundle 'clang-complete'

" Also load some colorscheme from github
Bundle 'altercation/vim-colors-solarized'
Bundle 'jnurmine/Zenburn'
Bundle 'ciaranm/inkpot'
Bundle 'taglist.vim'
Bundle 'flazz/vim-colorschemes'

" Set filetype stuff to on
filetype on
filetype plugin on
filetype indent on
set nocp " Not compatible with the old vi

" Maximize the window on startup
if has("gui_running")
  autocmd GUIEnter * set lines=500 columns=500
endif
set colorcolumn=80 " set a colored column on this position

" Tabstops are 3 spaces
set tabstop=3
set shiftwidth=3
set softtabstop=3
set expandtab
set autoindent

set wrapscan       " set the search scan to wrap lines
set vb             " set visual bell -- i hate that damned beeping
set sc             " set show command (easier to learn vim)

" Make sure that unsaved buffers that are to be put in the background are
" allowed to go in there (ie. the "must save first" error doesn't come up)
set hidden
set nobackup       " do not store backup or temporary files
set nowritebackup
set noswapfile

" Set the status line the way i like it
if has("statusline")
 set statusline=%<%f\ %h%m%r%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-18.(ln:%l/%L,col:%v%)\ [%b][0x%B]\ %P]
endif

" tell VIM to always put a status line in, even if there is only one window
set laststatus=2
set showmode       " show the current mode
syntax on          " switch on syntax highlighting.
set mousehide      " hide the mouse pointer while typing
set guioptions=acg " set the gui options the way I like
set virtualedit=all " set virtual edit so the cursor can go anywhere

" This is the timeout used while waiting for user input on a multi-keyed macro
" or while just sitting and waiting for another key to be pressed measured
" in milliseconds.
"
" i.e. for the ",d" command, there is a "timeoutlen" wait period between the
" "," key and the "d" key. If the "d" key isn't pressed before the
" timeout expires, one of two things happens: The "," command is executed
" if there is one (which there isn't) or the command aborts.
set timeoutlen=400
set history=100    " keep some stuff in the history

"------------------------------------------------------------------------------
" Fold global settings
"------------------------------------------------------------------------------
set foldmethod=syntax
set nofoldenable
" space toggles fold
nnoremap <space> za<cr>

" These commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo



" When the page starts to scroll, keep the cursor n lines from the top and n
" lines from the bottom
set scrolloff=2

" Disable encryption (:X)
set key=

" Make the command-line completion better
set wildmenu

" Same as default except that I remove the 'u' option
set complete=.,w,b,t

" When completing by tag, show the whole tag, not just the function name
set showfulltag

" Set the textwidth to be 80 chars
set textwidth=80

" get rid of the silly characters in separators
set fillchars = ""

" Add ignorance of whitespace to diff
set diffopt+=iwhite

" Enable search highlighting
set hlsearch

" Incrementally match the search
" shows the matched patterns while typing
set incsearch

" Add the unnamed register to the clipboard
set clipboard+=unnamed

" Automatically read a file that has changed on disk
set autoread

" map escape to ;;
inoremap ;; <Esc>
vnoremap ;; <Esc>

" System default for mappings is now the "," character
let mapleader = ","

" Toggle paste mode
" nmap <silent> ,p :set invpaste<CR>:set paste?<CR>

" cd to the directory containing the file in the buffer
nnoremap <silent> <leader>cd :lcd %:h<CR>
nnoremap <silent> <leader>md :!mkdir -p %:p:h<CR>

" Turn off that stupid highlight search
nnoremap <silent> ,n :nohls<CR>
set cpoptions+=$
" Toggle the NERDTree
nnoremap <leader>t :NERDTreeToggle<cr>
" toggle nowrap
nnoremap <leader>w :set invwrap<cr>
"Set fileencoding to latin1
nnoremap <leader>l :set fileencoding=latin1<cr>

"-----------------------------------------------------------------------------
" => Colors and Fonts
"-----------------------------------------------------------------------------
" Set font according to system
" set guifont=AnonymousRegular:h9
" set guifont=Lucida\ Console:h9
" set guifont=DejaVu\ Sans\ Mono:h9
set guifont=Consolas:h11
" Increase and decrease font size
nnoremap <silent> ,s :let &guifont = substitute(&guifont, ':h\(\d\+\)', '\=":h" . (submatch(1) - 1)', '')<CR>
nnoremap <silent> ,b :let &guifont = substitute(&guifont, ':h\(\d\+\)', '\=":h" . (submatch(1) + 1)', '')<CR>

" Set a nice colorscheme
set background=dark
colorscheme koehler
" colorscheme solarized
" colorscheme zenburn
" colorscheme inkpot

" Use the arrows to something usefull
" Right for the next buffer, left for the previous buffer
nnoremap <right> :bn<cr>
nnoremap <left> :bp<cr>

" Set bubble up / down
nnoremap <leader>u ddkP
nnoremap <leader>d ddjP

" map the capital H and L to go to the begin / end of the line
" nnoremap H 0
" nnoremap L $

" Convert word to uppercase while in insert mode
inoremap <c-u> <esc> bviwUea
inoremap <c-d> <esc> bviwuea

" When pressing <leader>cd switch to the directory of the open buffer
nnoremap <leader>cd :cd %:p:h<cr>

set backspace=indent,eol,start
" Set the backup properties
" The default is backup off and writebackup on
set nobackup
set nowritebackup
:set diffexpr=
" set diffexpr=MyDiff()
set helplang=nl
set ignorecase
set keymodel=startsel,stopsel
set ruler
set selection=exclusive
set selectmode=key
" No idea what the next line does. No help available?
" set whichwrap=b,s,<,>,[,]
set window=48
" Show the line numbers
set number

" Set the invisible characters
set list
set lcs+=tab:>-
set lcs+=eol:¬
set lcs+=trail:¬
set lcs+=nbsp:·

" Move through the windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <leader>m :A<CR>

" let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 40
nnoremap <F4> :TlistToggle<cr>
"
" Reload the vimrc file
" Load the vimrc once it's saved
au! BufWritePost $home/vim/_vimrc source $home/vim/_vimrc 
" fetch my latest vimrc
nnoremap <leader>ev :e $home/vim/_vimrc<cr>
nnoremap <C-F10> :Git pull --all<cr>"" reload the vimrc once it's saved
" commit the vimrc local
nnoremap <C-F11> :Git commit --all -m"commit"<cr>:Git push<cr>

" OmniCppComplete needs a ctags database
nnoremap <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" filetype specific stuff
" ----------------------------------------------------------------------------
" C / C++
" ----------------------------------------------------------------------------
nnoremap <F5> :!build.cmd<CR>
nnoremap <F6> :!unittest.cmd<CR>

autocmd BufNewFile,BufRead,BufEnter *.cpp,*.hpp,*.h set omnifunc=omni#cpp#complete#Main
" Load all CPP files in current directory
nnoremap <leader>ef :args **/{*.c*,*.h*}<cr>
" Use msbuild as our make tool
autocmd FileType *.cpp,*.hpp,*.h nnoremap <buffer> <C-F5> :!./build.cmd<CR>
" make the msbuild output readable for vim quickfix
set errorformat=\ %#%f(%l\\\,%c):\ %m

" ----------------------------------------------------------------------------
" XML
" ----------------------------------------------------------------------------
" if file is one line the indentation will no work
nnoremap <leader>xml :s/>/>\r/g<cr>

" ----------------------------------------------------------------------------
" Python 
" ----------------------------------------------------------------------------
autocmd FileType python nnoremap <buffer> <localleader>c I#

" ----------------------------------------------------------------------------
" D
" ----------------------------------------------------------------------------
autocmd BufNewFile,BufRead,BufEnter *.d set omnifunc=dcomplete#Complete
let g:dcd_importPath=['C:\D\dmd2\src\phobos\std', 'C:\D\dmd2\src\druntime\import']

" ----------------------------------------------------------------------------
" Abbreviations
" ----------------------------------------------------------------------------
iabbrev @@ douwe.faber@xyleminc.com


