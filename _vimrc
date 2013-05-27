"eouwe's vimrc
"ad the vimrc once it's saved
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
Bundle 'msanders/snipmate.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'OmniCppComplete'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-scripts/a.vim'
" Bundle 'klen/python-mode'
" Bundle 'Lokaltog/vim-powerline'
Bundle 'derekwyatt/vim-protodef'
Bundle 'derekwyatt/vim-fswitch'
Bundle 'clang-complete'
" The GIT plugin
Bundle 'tpope/vim-fugitive'
" Syntastic
Bundle 'scrooloose/syntastic'

" " Also load some colorscheme from github
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
  autocmd GUIEnter * set lines=500 columns=500
endif
set colorcolumn=80 " set a colored column on this position

" Tabstops are 3 spaces
set tabstop=3
set shiftwidth=3
set softtabstop=3
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
" set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

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

" Foldmethods
"set foldmethod=syntax
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
" colorscheme solarized
colorscheme koehler
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
"eload the vimrc file
"ad the vimrc once it's saved
nnoremap <leader>ev :e $home/vim/_vimrc<cr>
" fetch my latest vimrc
nnoremap <C-F10> :Git pull --all<cr>"" reload the vimrc once it's saved
au! BufWritePost $home/vim/_vimrc source $home/vim/_vimrc 
" commit the vimrc local
nnoremap <C-F11> :Git commit --all -m"commit"<cr>:Git push<cr>

" OmniCppComplete needs a ctags database
nnoremap <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" filetype specific stuff
" C / C++
autocmd FileType cpp nnoremap <buffer> <localleader>c I//
nnoremap <leader>ef :args **/{*.c*,*.h*}<cr>

" xml
" if file is one line the indentation will no work
nnoremap <leader>xml :s/>/>\r/g<cr>

" Use msbuild as our make tool
set makeprg=msbuild\ /nologo\ /v:q\ /property:GenerateFullPaths=true
" make the msbuild output readable for vim quickfix
set errorformat=\ %#%f(%l\\\,%c):\ %m
 
" Python 
autocmd FileType python nnoremap <buffer> <localleader>c I#

" Abbreviations
iabbrev @@ douwe.faber@xyleminc.com


