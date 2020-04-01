let mapleader=","

""" minpac
packadd minpac

call minpac#init()
call minpac#add('k-takata/minpac', {'type': 'opt'})

" Aesthetics
call minpac#add('KeitaNakamura/neodark.vim')
call minpac#add('junegunn/rainbow_parentheses.vim')
call minpac#add('ryanoasis/vim-devicons')
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')

" Functionalities
call minpac#add('alvan/vim-closetag')
call minpac#add('chrisbra/Colorizer')
call minpac#add('ervandew/supertab')
call minpac#add('honza/vim-snippets')
call minpac#add('jiangmiao/auto-pairs')
call minpac#add('junegunn/fzf', { 'do': { -> fzf#install() } })
call minpac#add('junegunn/fzf.vim')
call minpac#add('junegunn/vim-easy-align')
call minpac#add('majutsushi/tagbar')
call minpac#add('scrooloose/nerdcommenter')
call minpac#add('scrooloose/nerdtree')
call minpac#add('Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' })
call minpac#add('SirVer/ultisnips')
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-sensible')
call minpac#add('tpope/vim-surround')
call minpac#add('Xuyuanp/nerdtree-git-plugin')
call minpac#add('Yggdroot/indentLine')
" call minpac#add('metakirby5/codi.vim')

" Programming languages
call minpac#add('sheerun/vim-polyglot')

call minpac#add('fatih/vim-go', { 'do': ':GoUpdateBinaries' })
call minpac#add('zchee/deoplete-go', { 'do': 'make'})

packloadall

command! PackUpdate call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  call minpac#clean()
command! PackStatus call minpac#status()

""" Settings

" Encoding
set encoding=utf-8

" Aesthetics
if (has("termguicolors"))
  set termguicolors
endif

set background=dark
colorscheme neodark
let g:neodark#solid_vertsplit = 1

highlight Pmenu guibg=white guifg=black gui=bold
highlight Comment gui=bold
highlight Normal gui=none
highlight NonText guibg=none

" Other Configurations
set fillchars+=vert:\ 
set foldenable foldmethod=indent foldlevel=1 foldcolumn=1
set ignorecase smartcase
set inccommand=split
set list listchars=trail:»,tab:»-
set number relativenumber
set scrolloff=2
set showmatch
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab
set title
set wrap breakindent

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

" Deoplete
let g:deoplete#enable_at_startup = 1
" Disable documentation window
" set completeopt-=preview

" Supertab
let g:SuperTabDefaultCompletionType = "<C-n>"

" Ultisnips
let g:UltiSnipsExpandTrigger="<C-Space>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<C-x>"

" EasyAlign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" indentLine
let g:indentLine_char = '▏'
let g:indentLine_setColors = 0

" TagBar
let g:tagbar_width = 30
let g:tagbar_iconchars = ['↠', '↡']

" fzf-vim
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
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

""" Custom Functions

"" Trim Whitespaces
function! TrimWhitespace()
  let l:save = winsaveview()
  %s/\\\@<!\s\+$//e
  call winrestview(l:save)
endfunction

""" Custom Mappings

nmap <leader>q :NERDTreeToggle<CR>
nmap \ <leader>q
nmap <leader>w :TagbarToggle<CR>
nmap <leader>f :Files<CR>
nmap <leader>r :so ~/.config/nvim/init.vim<CR>
nmap <leader>t :call TrimWhitespace()<CR>   
xmap <leader>a gaip*
nmap <leader>a gaip*
nmap <leader>h :RainbowParentheses!!<CR>
nmap <leader><Tab> :bnext<CR>
nmap <leader><S-Tab> :bprevious<CR>

cabbrev Wq wq

