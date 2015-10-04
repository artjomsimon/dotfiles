
" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.
set nocp
call pathogen#infect()
syntax on
filetype plugin indent on
call pathogen#infect()

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

if &term =~ '256color'
 set t_ut=
endif

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim73/vimrc_example.vim or the vim manual
" and configure vim to your own liking!
set mouse=a
set ttymouse=xterm2
set hlsearch
set incsearch
set showmatch
set ignorecase
set smartcase
set splitright
set splitbelow
set number
set relativenumber
set undofile
"set paste
set cin
set sw=4
set tabstop=4
set display=lastline
"set tw=80
set t_Co=256
colo inkpot
syntax on
"setlocal spell spelllang=de_de
"set spell spelllang=hun-de-DE-frami

" Wann geladen wird              # Maske   # Aktivieren      # Zu verwendende Sprache
au BufNewFile,BufRead,BufEnter   *.wiki    setlocal spell    spelllang=de_de
au BufNewFile,BufRead,BufEnter   *.md      setlocal spell    spelllang=de_de
au BufNewFile,BufRead,BufEnter   *.txt     setlocal spell    spelllang=de_de

" Save when losing focus
au FocusLost * :wa

" Saving when opening a read-only file
cmap w!! %!sudo tee > /dev/null %

" Keep backup and temp files in one place
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

" from docwhat from github.com:
" save your backups to a less annoying place than the current directory.
" If you have .vim-backup in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/backup or . if all else fails.
if isdirectory($HOME . '/.vim/backup') == 0
  :silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/.vim/backup/
set backupdir^=./.vim-backup/
set backup

" Save your swp files to a less annoying place than the current directory.
" If you have .vim-swap in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory($HOME . '/.vim/swap') == 0
  :silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.

" viminfo stores the the state of your previous editing session
set viminfo+=n~/.vim/viminfo

if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile
endif

set sessionoptions-=options


" navigate in soft lines
map <silent> <Up> gk
imap <silent> <Up> <C-o>gk
map <silent> <Down> gj
imap <silent> <Down> <C-o>gj
map <silent> <home> g<home>
imap <silent> <home> <C-o>g<home>
map <silent> <End> g<End>
imap <silent> <End> <C-o>g<End>

au BufRead,BufNewFile *.txt,*.tex set wrap linebreak nolist textwidth=0 wrapmargin=0
