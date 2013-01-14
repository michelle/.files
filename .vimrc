set nocompatible
set encoding=utf-8
"Basic options.
set wrap "Enable line wrapping.
set magic "Use the default mode for regexes.
set number "Display line numbers.
set showmatch "Quickly highlight matching brackets when inserted.
set autoindent "Enable automatic indentation.
set copyindent "Use the same indentation convention as the last line.
set showcmd "Show partial commands at the bottom of the screen.
set noerrorbells "Disable annoying screen flashes.
set showmode "Display the current mode.
set ttyfast "Let vim know it's ok to redraw more often.
set ruler "Display the current line and column number.
"set rnu "Relative numbers!
set hidden "Hide buffers instead of closing them.
set cursorline
set autoread "Auto read from external changes.

"Tab completion
set wildmode=list:longest,list:full  " Tab completion
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*.swp,*~,._*

"Search
set hlsearch "Highlight search results.
set incsearch "Use incremental (Firefox-style) searching.
set ignorecase "Ignore case in searches.
set smartcase "Interpret case in searches intelligently.
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap <silent> g# g#zz

"Dragging lines
noremap <A-j> :m+<CR>
noremap <A-k> :m-2<CR>
inoremap <A-j> <Esc>:m+<CR>
inoremap <A-k> <Esc>:m-2<CR>
vnoremap <A-j> :m'>+<CR>gv
vnoremap <A-k> :m-2<CR>gv

"Sundry settings.
set modelines=0 "Disable modelines.
set scrolloff=2 "View lines past the scroll target.
set history=1000 "Remember past commands.
set undolevels=1000 "We all make mistakes sometimes.
set pastetoggle=<F2> "Jump into raw input mode.
set wildignore=*.swp,*.pyc,*.class,*.o,*.so "Ignore these files.
set wildmode=list:longest "Preferred completion mode.
set backspace=indent,eol,start "Sane backspacing.
" Set tab options
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set tw=80
" 80 lines, where you be?
set colorcolumn=80
" Where am I columnwise?
set list listchars=tab:»·,trail:·,extends:#

"Maintaining appearances.
syntax on
colorscheme default
let g:lisp_rainbow = 1

"Set language-specific indentation preferences.
set shiftround
filetype plugin indent on
autocmd BufRead,BufNewFile *.rs setfiletype rust
autocmd FileType c setlocal tabstop=4 shiftwidth=4
autocmd FileType scheme setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
autocmd FileType haskell setlocal expandtab shiftwidth=4 softtabstop=4
autocmd FileType rust setlocal tabstop=4 shiftwidth=4
autocmd FileType erlang setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType java setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType html setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType ejs setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType feature setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2

" Modes for line numbers
"autocmd InsertEnter * :set nu
"autocmd InsertLeave * :set rnu

" Reselect visual block after indentation
vnoremap < <gv
vnoremap > >gv
vnoremap = =gv

"Save a keystroke every time you enter command mode.
nnoremap ; :

"Make the default vertical navigation keys do something sane.
nnoremap j gj
nnoremap k gk

"Write changes to protected read-only files.
cmap w!! %!sudo tee > /dev/null %

"Recursively search upwards for a tagfile.
set tags+=./tags;/

"Open the current tag in a new tab, or a vertical split.
map <C-\> ;tab split<CR>;exec("tag ".expand("<cword>"))<CR>
map <A-]> ;vsplit <CR>;exec("tag ".expand("<cword>"))<CR>

"Manage your tabs with ease.
map tt ;tabedit<Space>
map tm ;tabmove<Space>
map tf ;tabfind<Space>
map tn ;tabnew<CR>
map th ;tabprev<CR>
map tl ;tabnext<CR>
map tj ;tabfirst<CR>
map tk ;tablast<CR>
map <C-h> ;tabprev<CR>
map <C-l> ;tabnext<CR>
map <C-j> ;tabfirst<CR>
map <C-k> ;tablast<CR>

"Manage region folding.
set foldmethod=syntax
set foldlevelstart=5
inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf

"Status line
set laststatus=2                             " always show the status line
set statusline=                              " reset statusline
set statusline+=%<\                          " cut at start
set statusline+=[%n%1*%H%M%R%W%*]\           " flags and buf no
set statusline+=%2*\ %-.50f\ %*              " path
set statusline+=\ [%{strlen(&ft)?&ft:'none'},  " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
set statusline+=%{&fileformat}]\             " file format
set statusline+=%4*\ %((%l,%c)%)\            " line and column
set statusline+=%P\ %*\                      " percentage of file
set statusline+=%k\ %*\                      " keymap
set statusline+=%=                           " right align
set statusline+=%3*\ %{synIDattr(synID(line('.'),col('.'),1),'name')}\ %*\  " highlight
set statusline+=%b,0x%B\                   " current char

"Resize splits when the window is resized.
autocmd VimResized * exe "normal! \<c-w>="

"Bold highlighting for vim error messages. 
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

"F7 to remove trailing WS
function! StripTrailingWhitespace()
  normal mZ
  %s/\s\+$//e
  if line("'Z") != line(".")
    echo "Stripped whitespace\n"
  endif
  normal `Z
endfunction
nmap <F7> :call StripTrailingWhitespace()<CR>


"Reload vimrc when saved.
augroup AutoReloadVimRC
  au!
  au BufWritePost .vimrc so ~/.vimrc
augroup END

"Change this on unreliable machines.
set nobackup
set noswapfile
