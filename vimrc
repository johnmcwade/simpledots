" ---------------------------------------
" Simple ~/.vimrc
"
" John McWade <jmcwade@protonmail.com>
" ---------------------------------------

"vi-compatible mode...no thanks!
"   in a way, this is a little pointless if its in an individual vimrc
"   as the act of finding such a file turns compatible off, but it can
"   be good in a system-wide vimrc or gvimrc, and doesnt hurt imo to 
"   have it as the first thing in a userspace vimrc.
set nocompatible

"have terminal show what buffer you are editing, if the terminal supports it
set title

"hide buffers instead of closing them out
"    be cautious though not to lose unsaved changes in hidden buffers when quitting
set hidden

"switch buffers by hitting F5 and a buffer number.
"     From vimtips wiki, but I prefer :ls! instead of :buffer
nnoremap <F5> :ls!<CR>:buffer<Space>

"when opening a vertical split-pane, open new pane to the right
set splitright

"when opening a horizontal split-pane, open it below the current one
set splitbelow

"traverse open panes with Ctrl+arrowkey
"    intentionally similar to pane-switching mapping I use in tmux
"    basically my tmux has Alt+arrowkey and vim has Ctrl+arrowkey
nnoremap <C-Left>  <C-W><C-H>
nnoremap <C-Right> <C-W><C-L>
nnoremap <C-Down>  <C-W><C-J>
nnoremap <C-Up>    <C-W><C-K>

"allow scrolling with the mouse.
"....be warned that vim may now have 'captured' the mouse
set mouse=a

"a tab inserts spaces instead
"    i'm not here to start any controversies though. if it's not for you,
"    just comment out / delete from the file / or use 'noexpandtab' instead
set expandtab

"number of spaces that a <Tab> counts for
"    (Clearly related to expandtab above)
"    Type :help tabstop for some interesting details about tabbing strategies
set tabstop=4

"number of columns a tab is in insert mode
set softtabstop=4

"number of columns for indenting operations
set shiftwidth=4

"aligning indents at standard position.
set shiftround

"set the backspace behaviors of the backspace and delete buttons.
"    also affects CTRL-W and CTRL-U in Insert mode. As reminder...
"         (CTRL-W deletes word before cursor)
"         (CTRL-U deletes all entered characters before cursor)
"     'indent' allows backspacing over autoindent
"     'eol'    allows backspacing over line breaks
"     'start'  allows backspacing over the start of insert
set backspace=indent,eol,start

"syntax
syntax enable

"command history
set history=1000

"undo stack depth
set undolevels=500

"sequential line numbers
"    OR use 'relativenumber' instead to make numbers relative to current line
set number

"constrain document width to be polite, oh, and PEP8
set tw=79

"right margin displayed. doesnt work everywhere 
"set colorcolumn=80

"long lines all on one line
set nowrap

"turn off wrapping while typing because it is annoying
set formatoptions-=t

"highlight search results
set hlsearch

"real-time search as you type; no waiting for <CR>
set incsearch

"case-insensitive searches
set ignorecase

"case-sensitive search when search pattern contains an A-Z
set smartcase

"reload/source .vimrc each time we save it
"....as seen in bestofvim and other places
"    not guaranteed to reload all changes, in all contexts, but sometimes it works
if has('autocmd')
    augroup source_vimrc "{
        autocmd!
        autocmd BufWritePost $MYVIMRC source $MYVIMRC
    augroup END "}
endif
