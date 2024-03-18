" Basic settings
set number
set nowrap
set laststatus=0
set autoindent

" Filetype specific settings
augroup indentation
	autocmd FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2
	autocmd FileType python,bash,zsh,fish,markdown,html,css setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4
augroup END

augroup lineNumber
	autocmd FileType markdown setlocal nonumber
augroup END

" Ensure thin separator during vertical splits
hi VertSplit cterm=NONE

" Install vim-plug if not available 
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  quit
endif

" Load plugins
call plug#begin("~/.config/nvim/autoload/plugged")
	Plug 'junegunn/fzf'
	Plug 'scrooloose/NERDTree'
call plug#end()

" Setup shortcuts for plugins
nmap <C-P> :FZF<CR>
nmap <C-E> :NERDTree<CR>

