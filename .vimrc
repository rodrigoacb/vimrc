" Construindo diretório de backup que salva automaticamente a ultima versão
" do arquivo.
" --------------------------------------------------------------------------
set backup
if !isdirectory($HOME."/.vim/backupdir")
	    silent! execute "!mkdir ~/.vim/backupdir"
    endif
    set backupdir=~/.vim/backupdir
" --------------------------------------------------------------------------
" Previne a contrução do .swap
" --------------------------------------------------------------------------
set noswapfile
" --------------------------------------------------------------------------
" Diretivas para paletas de cores (descomentar de necessário"
" --------------------------------------------------------------------------
set t_Co=256
set termguicolors
" --------------------------------------------------------------------------
" Define tipo do background(light/dark)
" --------------------------------------------------------------------------
set background=dark
" --------------------------------------------------------------------------
" Define o esquema de cores
" --------------------------------------------------------------------------
"colorscheme boltzmann
"colorscheme duoduo
"colorscheme oblivion
colorscheme gruvbox
"colorscheme PaperColor
" --------------------------------------------------------------------------
" Especificações do esquema de cores
" --------------------------------------------------------------------------
let g:gruvbox_contrast_dark='soft'
" --------------------------------------------------------------------------
" Mapeando caracteres do usuário
" --------------------------------------------------------------------------
"inoremap { {}<left>
"inoremap ( ()<left>
"inoremap " ""<left>
map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>
map  <C-n> :tabnew<CR>
" --------------------------------------------------------------------------
" Comandos de personalização do ambiente
" --------------------------------------------------------------------------
set so=30 " Deixa o cursor fixo no centro ta tela
set ignorecase " Faz a procura de palavras ser case-insensitive
set history=1000 " Aumenta o limite do Undo
"set number " Mostra número da linha a direita
"set relativenumber "Mostra número relativo da linha a direita
"set expandtab
set autoindent
set ts=4 sw=4 et " Define o tab como 4 espaços
"set foldmethod=indent " faz o fold nas identações
"set foldnestmax=3: define numero máximo de fols consecutivos
"set nofoldenable: Disabilita o fold
let fortran_do_enddo=1
" --------------------------------------------------------------------------
" Inicializando o syntastic
" --------------------------------------------------------------------------
set nocompatible              " be iMproved, required
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_tex_checkers=['chktex']
" --------------------------------------------------------------------------
" Comandos do indent guide
" --------------------------------------------------------------------------
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=2
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=2
                        
" --------------------------------------------------------------------------
" Comandos necessários para o Vundle
" --------------------------------------------------------------------------
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
" --------------------------------------------------------------------------
" Plugins em uso:
" --------------------------------------------------------------------------
Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-syntastic/syntastic'

Plugin 'scrooloose/nerdtree'

Plugin 'nathanaelkane/vim-indent-guides'
" --------------------------------------------------------------------------
call vundle#end()            " required
filetype plugin indent on    " required
" --------------------------------------------------------------------------
