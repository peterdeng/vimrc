set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands

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
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

"========================================================================
" below is personal settings
"
" just take no backup files
set nobackup
"if you want to take some backup, valid the following lines
"set backup
"set backupdir=>c:\backup\vimbackup

"for python start
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,with,try,except,finally,def,class
set autoindent
set tabstop=4
"set expandtab
set shiftwidth=4
filetype indent on 
"for python end

syntax on
"highlight search results
set hlsearch

if has("gui_running")
    if has("gui_gtk2")
        :set guifont=Luxi\ Mono\ 9
    elseif has("x11")
        " Also for GTK 1
        :set guifont=*-lucidatypewriter-medium-r-normal-*-*-180-*-*-m-*-*
    elseif has("gui_win32")
		:set guifont=MS_Gothic:h10:cSHIFTJIS
    endif
endif

"colorscheme evening

"when input japanese or chinese, change cursor color in purple
if has('multi_byte_ime') || has('xim')
  highlight CursorIM guibg=Purple guifg=NONE
  set iminsert=0 imsearch=0
  if has('xim') && has('GUI_GTK')
  endif
endif
set nu

"set print font
if has('printer')
  if has('win32')
    set printfont=MS_Mincho:h10:cSHIFTJIS
  endif
endif

"visualize tab and tail of line spaces
set list
set listchars=tab:>-,trail:-

"highlight cursor line
set cursorline

set laststatus=2

"about mouse
set mouse=a
set nomousefocus
set mousehide

"search options
"set ic
set ic smartcase
set incsearch

"set tab and shift length
set tabstop=4
set shiftwidth=4

"set searching path
"set path=.,c:/ctry

"set notextmode
"set cindent

"list up grep results
map <F12> :copen<CR>

"map <F2> A /* <C-r>+ */<Esc>
map <F4> :s/^/\/\//<CR><Esc>:nohlsearch<CR>
map <F3> :s/^\(.*\)$/\/\*\1\*\//<CR><Esc>:nohlsearch<CR>
map <S-F3> :s/^\([	 ]*\)\/\*\(.*\)\*\/\([	 ]*\)$/\1\2\3/<CR><Esc>:nohlsearch<CR>
map <S-F4> :s/^\([	 ]*\)\/\//\1/<CR><Esc>:nohlsearch<CR>
map <F5> :s/^\([<Tab> ]*\)/\1\r\1/g<CR>k<S-A><C-R>="/* >>> mod by Peter " . strpart(strftime("%c") , 0 , 10) . " */"<CR><Esc>0<Esc>:nohlsearch<CR>
map <S-F5> :s/^\([<Tab> ]*\)\(.*\)$/\1\2\r\1/g<CR><S-a><C-R>="/* <<< mod by Peter " . strpart(strftime("%c") , 0 , 10) . " */"<CR><Esc>0<Esc>:nohlsearch<CR>

"use dictionary
"The words file is usually stored in /usr/share/dict/words, or /usr/dict/words. On the Mac OS X system, the file path is /usr/share/dict/words.
set dict+=/usr/share/dict/words
