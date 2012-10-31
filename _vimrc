"Douwe's vimrc
"-----------------------------------------------------------------------------
" Manage plugins through Vundle
"-----------------------------------------------------------------------------
" On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
" across (heterogeneous) systems easier.
" if has('win32') || has('win64')
"   set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
" endif

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" required!
Bundle 'gmarik/vundle'

"-----------------------------------------------------------------------------
" My Bundles here:
"-----------------------------------------------------------------------------
Bundle 'msanders/snipmate.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'OmniCppComplete'
Bundle 'kien/ctrlp.vim'
Bundle 'derekwyatt/vim-protodef'
Bundle 'derekwyatt/vim-fswitch'
Bundle 'clang-complete'
" The GIT plugin
Bundle 'tpope/vim-fugitive'
" Also load some colorscheme from github
Bundle 'altercation/vim-colors-solarized'
Bundle 'jnurmine/Zenburn'
Bundle 'ciaranm/inkpot'

Bundle 'taglist.vim'
"
" Set filetype stuff to on
filetype on
filetype plugin on
filetype indent on
set nocp

" Maximize the window on startup
if has("gui_running")
  autocmd GUIEnter * simalt ~x
endif
set colorcolumn=80 " set a colored column on this position

" Tabstops are 4 spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

" set the search scan to wrap lines
set wrapscan

" set visual bell -- i hate that damned beeping
set vb

" Set show command (easier to learn vim)
set sc " short for showcommand

" Make sure that unsaved buffers that are to be put in the background are
" allowed to go in there (ie. the "must save first" error doesn't come up)
set hidden

" Do not store backup or temporary files
set nobackup
set nowritebackup
set noswapfile

" Set the status line the way i like it
" set stl=%f\ %m\ %r%{fugitive#statusline()}\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B]
" set stl=%f\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B]
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" tell VIM to always put a status line in, even if there is only one window
set laststatus=2

" Show the current mode
set showmode

" Switch on syntax highlighting.
syntax on

" Hide the mouse pointer while typing
set mousehide

" set the gui options the way I like
set guioptions=acg
"
" Set virtual edit so the cursor can go anywhere
set virtualedit=all

" This is the timeout used while waiting for user input on a multi-keyed macro
" or while just sitting and waiting for another key to be pressed measured
" in milliseconds.
"
" i.e. for the ",d" command, there is a "timeoutlen" wait period between the
" "," key and the "d" key. If the "d" key isn't pressed before the
" timeout expires, one of two things happens: The "," command is executed
" if there is one (which there isn't) or the command aborts.
set timeoutlen=300

" Keep some stuff in the history
set history=100

" These commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

" When the page starts to scroll, keep the cursor 8 lines from the top and 8
" lines from the bottom
set scrolloff=8

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

" reload the vimrc once it's saved
au! BufWritePost $MYVIMRC source $MYVIMRC

" map escape to ;;
map! ;; <Esc> " map ;; to Esc
vmap ;; <Esc> " map ;; to Esc in visual

" System default for mappings is now the "," character
let mapleader = ","

" Wipe out all buffers
nmap <silent> ,wa :1,9000bwipeout<cr>

" Toggle paste mode
nmap <silent> ,p :set invpaste<CR>:set paste?<CR>

" cd to the directory containing the file in the buffer
nmap <silent> ,cd :lcd %:h<CR>
nmap <silent> ,md :!mkdir -p %:p:h<CR>

" Turn off that stupid highlight search
nmap <silent> ,n :nohls<CR>

" Toggle the NERDTree
map <leader>t :NERDTreeToggle<cr>
"-----------------------------------------------------------------------------
" => Colors and Fonts
"-----------------------------------------------------------------------------
" Set font according to system
" set guifont=AnonymousRegular:h9
" set guifont=Lucida\ Console:h9
" set guifont=DejaVu\ Sans\ Mono:h9
set guifont=Consolas:h11

" Set a nice colorscheme
set background=dark
" colorscheme solarized
" colorscheme koehler
" colorscheme zenburn
colorscheme inkpot

" Use the arrows to something usefull
" Right for the next buffer, left for the previous buffer
map <right> :bn<cr>
map <left> :bp<cr>

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>

set backspace=indent,eol,start
" Set the backup properties
" The default is backup off and writebackup on
set nobackup
set nowritebackup
set diffexpr=MyDiff()
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
" set number

" Set the invisible characters
set list
set lcs+=tab:>-
set lcs+=eol:¬
set lcs+=trail:¬
set lcs+=nbsp:·

" Move through the windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 50
map <F4> :TlistToggle<cr>
" load the vimrc file
map <F11> :e $home/vim/_vimrc<cr>
"" reload the vimrc once it's saved
au! BufWritePost $home/vim/_vimrc source $home/vim/_vimrc 
" filetype specific stuff
" C / C++
" au FileType python map <buffer> <leader>1 /class

" OmniCppComplete needs a ctags database
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
" 
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap ( ()<Esc>i


" commit the vimrc to github
map <C-F11> :Git commit -a<cr>

