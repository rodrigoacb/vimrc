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
set t_Co=256"
"set termguicolors
if has('termguicolors')
    set termguicolors
endif
" --------------------------------------------------------------------------
" Define tipo do background(light/dark)
" --------------------------------------------------------------------------
set background=dark
" --------------------------------------------------------------------------
"" Especificações do esquema de cores
" --------------------------------------------------------------------------
"let g:gruvbox_contrast_dark='soft'
"let g:demerara_contrast_dark='medium'
"let g:demerara_contrast_light='light'
let g:gruvbox_material_background = 'medium'
"let g:everforest_background = 'hard'
" For better performance
let g:gruvbox_material_better_performance = 1
"let g:everforest_better_performance = 1

set laststatus=2
let g:lightline = {'colorscheme' : 'gruvbox_material'}
"let g:lightline = {'colorscheme' : 'everforest'}
" --------------------------------------------------------------------------
" Mapeando caracteres do usuário
" --------------------------------------------------------------------------
"inoremap { {}<left>
"inoremap ( ()<left>
"inoremap " ""<left>

function! ToggleQuickFix()
    if empty(filter(getwininfo(), 'v:val.loclist'))
        lopen
    else
        lclose
    endif
endfunction

nnoremap <silent> <F2> :call ToggleQuickFix()<cr>
nnoremap <F3> :set hlsearch!<CR>
nmap <F6> :NERDTreeToggle<CR>
map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>
map  <C-n> :tabnew<CR>
" --------------------------------------------------------------------------
" Comandos de personalização do ambiente
" --------------------------------------------------------------------------
set so=30 " Deixa o cursor fixo no centro da tela
set ignorecase " Faz a procura de palavras ser case-insensitive
set history=200 " Aumenta o limite do Undo
set number " Mostra número da linha a direita
set relativenumber "Mostra número relativo da linha a direita
"set expandtab
set encoding=UTF-8
set autoindent
set ts=4 sw=4 et " Define o tab como 4 espaços
"set foldmethod=indent " faz o fold nas identações
"set foldnestmax=3: define numero máximo de folds consecutivos
set nofoldenable " Disabilita o fold
set colorcolumn=80
"let Tex_FoldedSections=""
"let Tex_FoldedEnvironments=""
"let Tex_FoldedMisc=""
let fortran_do_enddo=1
"let g:languagetool_jar='/home/koch/Programs/LanguageTool/LanguageTool-5.3/languagetool-commandline.jar'
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
"
let g:NERDTreeWinPos = "right"
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

"Plugin 'vim-latex/vim-latex'
Plugin 'lervag/vimtex'

Plugin 'ryanoasis/vim-devicons'

"Plugin 'morhetz/gruvbox'

Plugin 'sainnhe/gruvbox-material'

Plugin 'sainnhe/everforest'

Plugin 'itchyny/lightline.vim'

Plugin 'neoclide/coc.nvim', {'branch': 'release'}

Plugin 'tommason14/lammps.vim'

" --------------------------------------------------------------------------
call vundle#end()            " required
filetype plugin indent on    " required
" --------------------------------------------------------------------------

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Define o esquema de cores
" --------------------------------------------------------------------------
"colorscheme demerara
colorscheme gruvbox-material
"colorscheme everforest

highlight ColorColumn ctermbg=142 guibg=#424a3e
set mouse=a
" Transparent background
" hi Normal guibg=NONE ctermbg=NONE   
au BufRead * normal zR
" --------------------------------------------------------------------------
