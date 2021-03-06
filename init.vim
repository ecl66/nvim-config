let mapleader=","

""" minpac
function! PackInit() abort
  packadd minpac

  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  " Aesthetics
  call minpac#add('junegunn/rainbow_parentheses.vim', {'type': 'opt'})
  call minpac#add('morhetz/gruvbox')
  call minpac#add('ryanoasis/vim-devicons')
  call minpac#add('vim-airline/vim-airline')

  " Functionality
  call minpac#add('Xuyuanp/nerdtree-git-plugin')
  call minpac#add('Yggdroot/indentLine')
  call minpac#add('chrisbra/Colorizer')
  call minpac#add('ervandew/supertab')
  call minpac#add('jiangmiao/auto-pairs')
  call minpac#add('junegunn/fzf', { 'do': { -> fzf#install() } })
  call minpac#add('junegunn/fzf.vim')
  call minpac#add('junegunn/vim-easy-align')
  call minpac#add('majutsushi/tagbar')
  call minpac#add('mbbill/undotree')
  call minpac#add('mhinz/vim-grepper')
  call minpac#add('scrooloose/nerdcommenter')
  call minpac#add('scrooloose/nerdtree')
  call minpac#add('tpope/vim-dispatch')
  call minpac#add('tpope/vim-fugitive')
  call minpac#add('tpope/vim-sensible')
  call minpac#add('tpope/vim-surround')
  " call minpac#add('metakirby5/codi.vim')

  " Programming
  call minpac#add('Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' })
  call minpac#add('fatih/vim-go', { 'do': ':GoUpdateBinaries' })
  call minpac#add('janko-m/vim-test')
  call minpac#add('sheerun/vim-polyglot')
  call minpac#add('tpope/vim-rails', {'type': 'opt'})
  call minpac#add('w0rp/ale')
  call minpac#add('zchee/deoplete-go', { 'do': 'make'})
endfunction

command! PackUpdate call PackInit() | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  call PackInit() | call minpac#clean()
command! PackStatus call PackInit() | call minpac#status()

""" Settings

" Encoding
set encoding=utf-8

" Aesthetics
if (has("termguicolors"))
  set termguicolors
endif

colorscheme gruvbox

if has("gui_vimr")
  set background=light
  let g:gruvbox_contrast_light = 'hard'
else
  set background=dark
  let g:gruvbox_contrast_dark = 'soft'
endif

highlight Pmenu guibg=white guifg=black gui=bold
highlight Comment gui=bold
highlight Normal gui=none
highlight NonText guibg=none

" Other Configurations
set fillchars+=vert:\ 
set nofoldenable foldmethod=syntax foldlevel=1 foldcolumn=1
set ignorecase smartcase
set inccommand=split
set list listchars=trail:»,tab:»-
set number relativenumber
set scrolloff=2
set showmatch
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set title
set wrap breakindent
set colorcolumn=80,100
set lazyredraw
set undofile
let &undodir=fnamemodify($MYVIMRC, ":h") . "/undo"

""" Plugin Configurations

" NERDTree
let NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable = '↠'
let g:NERDTreeDirArrowCollapsible = '↡'

" Airline
let g:airline_powerline_fonts = 1
let g:airline_section_z = ' %{strftime("%-I:%M %p")}'
let g:airline_section_warning = ''
let g:airline#extensions#tabline#enabled = 1

" Colorizer
let g:colorizer_auto_filetype = 'scss,css,html'
let g:colorizer_skip_comments = 1

" Deoplete
let g:deoplete#enable_at_startup = 1
" Disable documentation window
set completeopt-=preview

" Supertab
let g:SuperTabDefaultCompletionType = "<C-n>"

" Ultisnips
let g:UltiSnipsExpandTrigger = "<C-Space>"
let g:UltiSnipsJumpForwardTrigger = "<Tab>"
let g:UltiSnipsJumpBackwardTrigger = "<C-x>"

" EasyAlign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" indentLine
let g:indentLine_char = '▏'
let g:indentLine_setColors = 1

" TagBar
let g:tagbar_width = 30
let g:tagbar_iconchars = ['↠', '↡']

" fzf-vim
nnoremap <C-p> :<C-u>FZF<CR>
nnoremap <C-z> :Buffers<CR>

let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit' }
let g:fzf_colors = {
      \ 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'Type'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Character'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }

" ALE
nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <plug>(ale_previous)
nmap <silent> ]w <plug>(ale_next)
nmap <silent> ]W <Plug>(ale_last)

" vim-grepper
let g:grepper = {}
let g:grepper.tools = ['rg', 'grep', 'git']

nmap <leader>g :Grepper<CR>
nmap <Leader>G :Grepper -cword -noprompt<CR>

" vim-test
let test#strategy = "dispatch"

nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tg :TestVisit<CR>

""" Terminal settings
tnoremap <Esc> <C-\><C-n>
tnoremap <C-v><Esc> <Esc>

""" Custom Functions

"" Trim Whitespaces
function! TrimWhitespace()
  let l:save = winsaveview()
  %s/\\\@<!\s\+$//e
  call winrestview(l:save)
endfunction

function! ToggleBackground()
  if (&background == 'light')
    set background=dark
    echo "background -> dark"
  else
    set background=light
    echo "background -> light"
  endif
endfunction

""" Custom Mappings

" Leader mappings
nmap <leader>q :NERDTreeToggle<CR>
nmap \ <leader>q
nmap <leader>w :TagbarToggle<CR>
nmap <leader>U :UndotreeToggle<CR>
nmap <leader>f :Files<CR>
nmap <leader>v :vsplit $MYVIMRC<CR>
nmap <leader>t :call TrimWhitespace()<CR>
xmap <leader>a gaip*
nmap <leader>a gaip*
nmap <leader><Tab> :bnext<CR>
nmap <leader><S-Tab> :bprevious<CR>
nmap <leader>b :call ToggleBackground()<CR>
nmap <silent> <leader>bd :bufdo bd<CR>
nmap <leader>bf :let @+ = expand("%")<CR>
nmap <leader>bs :ls<CR>:b<space>

nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l

nnoremap H ^

inoremap jk <Esc>

cabbrev Wq wq

