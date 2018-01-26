set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-sensible'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'christoomey/vim-tmux-runner'
Plugin 'vim-ruby/vim-ruby'
Plugin 'thoughtbot/vim-rspec'
Plugin 'nanotech/jellybeans.vim'
Plugin 'mileszs/ack.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'edkolev/tmuxline.vim'
Plugin 'ngmy/vim-rubocop'
Plugin 'tpope/vim-surround'
call vundle#end()
filetype plugin indent on

syntax on

augroup myfiletypes
  " Clear old autocmds in group
  autocmd!
  " autoindent with two spaces, always expand tabs
  autocmd FileType ruby,eruby,yaml setlocal ai sw=2 sts=2 et
  autocmd FileType ruby,eruby,yaml setlocal path+=lib
  autocmd FileType ruby,eruby,yaml setlocal colorcolumn=80
  " Make ?s part of words
  autocmd FileType ruby,eruby,yaml setlocal iskeyword+=?
augroup END

colorscheme jellybeans

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =
" zoom a vim pane, <C-w>= to re-balance
nnoremap <Leader>- :wincmd _<CR>:wincmd \|<CR>
nnoremap <Leader>= :wincmd =<CR>

"nnoremap h <NOP>
"nnoremap j <NOP>
"nnoremap k <NOP>
"nnoremap l <NOP>
nnoremap <Up> <NOP>
nnoremap <Down> <NOP>
nnoremap <Left> <NOP>
nnoremap <Right> <NOP>

let mapleader = "\<Space>"

" Split edit your vimrc. Type space, v, r in sequence to trigger
nmap <Leader>vr :vsp $MYVIMRC<CR>

" Source (reload) your vimrc. Type space, s, o in sequence to trigger
nmap <Leader>so :source $MYVIMRC<CR>
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
imap jj <ESC>
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>
map K <Nop>
nmap k gk
nmap j gj


set number
set nowrap
set backupdir=~/.tmp
set directory=~/.tmp
set grepprg=ag
set nofoldenable
set shiftround
set list listchars=tab:»·,trail:·

let g:ackprg = 'ag --nogroup --nocolor --column -p ~/.agignore'
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0
let g:ctrlp_working_path_mode = 0
let g:rspec_command = "call VtrSendCommand('rspec {spec}')"
let g:airline_powerline_fonts = 1
if &term =~ '256color'
    " Disable Background Color Erase (BCE) so that color schemes
    " work properly when Vim is used inside tmux and GNU screen.
    set t_ut=
endif
