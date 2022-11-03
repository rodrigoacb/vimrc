" -----------------------------------------------------------------------------
" File: demerara.vim
" Description: A new funky color scheme ispired on gruvbox
" Author: rodrigoacb <rodrigoamaralcb@gmail.com>
" Source: https://github.com/rodrigoacb/.vimrc
" Last Modified: 21 Apr 2022
" -----------------------------------------------------------------------------

" Supporting code -------------------------------------------------------------
" Initialisation: {{{

if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

let g:colors_name='demerara'

if !(has('termguicolors') && &termguicolors) && !has('gui_running') && &t_Co != 256
  finish
endif

" }}}
" Global Settings: {{{

if !exists('g:demerara_bold')
  let g:demerara_bold=1
endif
if !exists('g:demerara_italic')
  if has('gui_running') || $TERM_ITALICS == 'true'
    let g:demerara_italic=1
  else
    let g:demerara_italic=0
  endif
endif
if !exists('g:demerara_undercurl')
  let g:demerara_undercurl=1
endif
if !exists('g:demerara_underline')
  let g:demerara_underline=1
endif
if !exists('g:demerara_inverse')
  let g:demerara_inverse=1
endif

if !exists('g:demerara_guisp_fallback') || index(['fg', 'bg'], g:demerara_guisp_fallback) == -1
  let g:demerara_guisp_fallback='NONE'
endif

if !exists('g:demerara_improved_strings')
  let g:demerara_improved_strings=0
endif

if !exists('g:demerara_improved_warnings')
  let g:demerara_improved_warnings=0
endif

if !exists('g:demerara_termcolors')
  let g:demerara_termcolors=256
endif

if !exists('g:demerara_invert_indent_guides')
  let g:demerara_invert_indent_guides=0
endif

if exists('g:demerara_contrast')
  echo 'g:demerara_contrast is deprecated; use g:demerara_contrast_light and g:demerara_contrast_dark instead'
endif

if !exists('g:demerara_contrast_dark')
  let g:demerara_contrast_dark='medium'
endif

if !exists('g:demerara_contrast_light')
  let g:demerara_contrast_light='medium'
endif

let s:is_dark=(&background == 'dark')

" }}}
" Palette: {{{

" setup palette dictionary
let s:dm = {}

" fill it with absolute colors
let s:dm.dark0_hard  = ['#262626', 234]     " 29-32-33
let s:dm.dark0       = ['#2c2c2c', 235]     " 40-40-40
let s:dm.dark0_soft  = ['#413f3b', 236]     " 50-48-47
let s:dm.dark1       = ['#58524b', 237]     " 60-56-54
let s:dm.dark2       = ['#6f665b', 239]     " 80-73-69
let s:dm.dark3       = ['#877b6c', 241]     " 102-92-84
let s:dm.dark4       = ['#a0917d', 243]     " 124-111-100
let s:dm.dark4_256   = ['#a0917d', 243]     " 124-111-100

let s:dm.gray_245    = ['#c3b299', 245]     " 146-131-116
let s:dm.gray_244    = ['#a0917d', 244]     " 146-131-116

let s:dm.light0_hard = ['#f5f7f2', 230]     " 249-245-215
let s:dm.light0      = ['#edf0e9', 229]     " 253-244-193
let s:dm.light0_soft = ['#e5e9e0', 228]     " 242-229-188
let s:dm.light1      = ['#cbd4c2', 223]     " 235-219-178
let s:dm.light2      = ['#adb4a6', 250]     " 213-196-161
let s:dm.light3      = ['#90958b', 248]     " 189-174-147
let s:dm.light4      = ['#595b58', 246]     " 168-153-132
let s:dm.light4_256  = ['#595b58', 246]     " 168-153-132

let s:dm.bright_red     = ['#f25757', 167]     " 251-73-52
let s:dm.bright_green   = ['#65c29d', 142]     " 184-187-38
let s:dm.bright_yellow  = ['#eaed82', 214]     " 250-189-47
let s:dm.bright_blue    = ['#89bbfe', 109]     " 131-165-152
let s:dm.bright_purple  = ['#ce6a85', 175]     " 211-134-155
let s:dm.bright_aqua    = ['#73d782', 108]     " 142-192-124
let s:dm.bright_orange  = ['#f5976e', 208]     " 254-128-25

let s:dm.neutral_red    = ['#e63c3c', 124]     " 204-36-29
let s:dm.neutral_green  = ['#21825c', 106]     " 152-151-26
let s:dm.neutral_yellow = ['#b28d2e', 172]     " 215-153-33
let s:dm.neutral_blue   = ['#3f88c5', 66]      " 69-133-136
let s:dm.neutral_purple = ['#c94277', 132]     " 177-98-134
let s:dm.neutral_aqua   = ['#31d843', 72]      " 104-157-106
let s:dm.neutral_orange = ['#ef8354', 166]     " 214-93-14

let s:dm.faded_red      = ['#e63c3c', 88]      " 157-0-6
let s:dm.faded_green    = ['#21825c', 100]     " 121-116-14
let s:dm.faded_yellow   = ['#b28d2e', 136]     " 181-118-20
let s:dm.faded_blue     = ['#3f88c5', 24]      " 7-102-120
let s:dm.faded_purple   = ['#c94277', 96]      " 143-63-113
let s:dm.faded_aqua     = ['#31d843', 66]      " 66-123-88
let s:dm.faded_orange   = ['#ef8354', 130]     " 175-58-3

" }}}
" Setup Emphasis: {{{

let s:bold = 'bold,'
if g:demerara_bold == 0
  let s:bold = ''
endif

let s:italic = 'italic,'
if g:demerara_italic == 0
  let s:italic = ''
endif

let s:underline = 'underline,'
if g:demerara_underline == 0
  let s:underline = ''
endif

let s:undercurl = 'undercurl,'
if g:demerara_undercurl == 0
  let s:undercurl = ''
endif

let s:inverse = 'inverse,'
if g:demerara_inverse == 0
  let s:inverse = ''
endif

" }}}
" Setup Colors: {{{

let s:vim_bg = ['bg', 'bg']
let s:vim_fg = ['fg', 'fg']
let s:none = ['NONE', 'NONE']

" determine relative colors
if s:is_dark
  let s:bg0  = s:dm.dark0
  if g:demerara_contrast_dark == 'soft'
    let s:bg0  = s:dm.dark0_soft
  elseif g:demerara_contrast_dark == 'hard'
    let s:bg0  = s:dm.dark0_hard
  endif

  let s:bg1  = s:dm.dark1
  let s:bg2  = s:dm.dark2
  let s:bg3  = s:dm.dark3
  let s:bg4  = s:dm.dark4

  let s:gray = s:dm.gray_245

  let s:fg0 = s:dm.light0
  let s:fg1 = s:dm.light1
  let s:fg2 = s:dm.light2
  let s:fg3 = s:dm.light3
  let s:fg4 = s:dm.light4

  let s:fg4_256 = s:dm.light4_256

  let s:red    = s:dm.bright_red
  let s:green  = s:dm.bright_green
  let s:yellow = s:dm.bright_yellow
  let s:blue   = s:dm.bright_blue
  let s:purple = s:dm.bright_purple
  let s:aqua   = s:dm.bright_aqua
  let s:orange = s:dm.bright_orange
else
  let s:bg0  = s:dm.light0
  if g:demerara_contrast_light == 'soft'
    let s:bg0  = s:dm.light0_soft
  elseif g:demerara_contrast_light == 'hard'
    let s:bg0  = s:dm.light0_hard
  endif

  let s:bg1  = s:dm.light1
  let s:bg2  = s:dm.light2
  let s:bg3  = s:dm.light3
  let s:bg4  = s:dm.light4

  let s:gray = s:dm.gray_244

  let s:fg0 = s:dm.dark0
  let s:fg1 = s:dm.dark1
  let s:fg2 = s:dm.dark2
  let s:fg3 = s:dm.dark3
  let s:fg4 = s:dm.dark4

  let s:fg4_256 = s:dm.dark4_256

  let s:red    = s:dm.faded_red
  let s:green  = s:dm.faded_green
  let s:yellow = s:dm.faded_yellow
  let s:blue   = s:dm.faded_blue
  let s:purple = s:dm.faded_purple
  let s:aqua   = s:dm.faded_aqua
  let s:orange = s:dm.faded_orange
endif

" reset to 16 colors fallback
if g:demerara_termcolors == 16
  let s:bg0[1]    = 0
  let s:fg4[1]    = 7
  let s:gray[1]   = 8
  let s:red[1]    = 9
  let s:green[1]  = 10
  let s:yellow[1] = 11
  let s:blue[1]   = 12
  let s:purple[1] = 13
  let s:aqua[1]   = 14
  let s:fg1[1]    = 15
endif

" save current relative colors back to palette dictionary
let s:dm.bg0 = s:bg0
let s:dm.bg1 = s:bg1
let s:dm.bg2 = s:bg2
let s:dm.bg3 = s:bg3
let s:dm.bg4 = s:bg4

let s:dm.gray = s:gray

let s:dm.fg0 = s:fg0
let s:dm.fg1 = s:fg1
let s:dm.fg2 = s:fg2
let s:dm.fg3 = s:fg3
let s:dm.fg4 = s:fg4

let s:dm.fg4_256 = s:fg4_256

let s:dm.red    = s:red
let s:dm.green  = s:green
let s:dm.yellow = s:yellow
let s:dm.blue   = s:blue
let s:dm.purple = s:purple
let s:dm.aqua   = s:aqua
let s:dm.orange = s:orange

" }}}
" Setup Terminal Colors For Neovim: {{{

if has('nvim')
  let g:terminal_color_0 = s:bg0[0]
  let g:terminal_color_8 = s:gray[0]

  let g:terminal_color_1 = s:dm.neutral_red[0]
  let g:terminal_color_9 = s:red[0]

  let g:terminal_color_2 = s:dm.neutral_green[0]
  let g:terminal_color_10 = s:green[0]

  let g:terminal_color_3 = s:dm.neutral_yellow[0]
  let g:terminal_color_11 = s:yellow[0]

  let g:terminal_color_4 = s:dm.neutral_blue[0]
  let g:terminal_color_12 = s:blue[0]

  let g:terminal_color_5 = s:dm.neutral_purple[0]
  let g:terminal_color_13 = s:purple[0]

  let g:terminal_color_6 = s:dm.neutral_aqua[0]
  let g:terminal_color_14 = s:aqua[0]

  let g:terminal_color_7 = s:fg4[0]
  let g:terminal_color_15 = s:fg1[0]
endif

" }}}
" Overload Setting: {{{

let s:hls_cursor = s:orange
if exists('g:demerara_hls_cursor')
  let s:hls_cursor = get(s:dm, g:demerara_hls_cursor)
endif

let s:number_column = s:none
if exists('g:demerara_number_column')
  let s:number_column = get(s:dm, g:demerara_number_column)
endif

let s:sign_column = s:bg1

if exists('g:gitgutter_override_sign_column_highlight') &&
      \ g:gitgutter_override_sign_column_highlight == 1
  let s:sign_column = s:number_column
else
  let g:gitgutter_override_sign_column_highlight = 0

  if exists('g:demerara_sign_column')
    let s:sign_column = get(s:dm, g:demerara_sign_column)
  endif
endif

let s:color_column = s:bg1
if exists('g:demerara_color_column')
  let s:color_column = get(s:dm, g:demerara_color_column)
endif

let s:vert_split = s:bg0
if exists('g:demerara_vert_split')
  let s:vert_split = get(s:dm, g:demerara_vert_split)
endif

let s:invert_signs = ''
if exists('g:demerara_invert_signs')
  if g:demerara_invert_signs == 1
    let s:invert_signs = s:inverse
  endif
endif

let s:invert_selection = s:inverse
if exists('g:demerara_invert_selection')
  if g:demerara_invert_selection == 0
    let s:invert_selection = ''
  endif
endif

let s:invert_tabline = ''
if exists('g:demerara_invert_tabline')
  if g:demerara_invert_tabline == 1
    let s:invert_tabline = s:inverse
  endif
endif

let s:italicize_comments = s:italic
if exists('g:demerara_italicize_comments')
  if g:demerara_italicize_comments == 0
    let s:italicize_comments = ''
  endif
endif

let s:italicize_strings = ''
if exists('g:demerara_italicize_strings')
  if g:demerara_italicize_strings == 1
    let s:italicize_strings = s:italic
  endif
endif

" }}}
" Highlighting Function: {{{

function! s:HL(group, fg, ...)
  " Arguments: group, guifg, guibg, gui, guisp

  " foreground
  let fg = a:fg

  " background
  if a:0 >= 1
    let bg = a:1
  else
    let bg = s:none
  endif

  " emphasis
  if a:0 >= 2 && strlen(a:2)
    let emstr = a:2
  else
    let emstr = 'NONE,'
  endif

  " special fallback
  if a:0 >= 3
    if g:demerara_guisp_fallback != 'NONE'
      let fg = a:3
    endif

    " bg fallback mode should invert higlighting
    if g:demerara_guisp_fallback == 'bg'
      let emstr .= 'inverse,'
    endif
  endif

  let histring = [ 'hi', a:group,
        \ 'guifg=' . fg[0], 'ctermfg=' . fg[1],
        \ 'guibg=' . bg[0], 'ctermbg=' . bg[1],
        \ 'gui=' . emstr[:-2], 'cterm=' . emstr[:-2]
        \ ]

  " special
  if a:0 >= 3
    call add(histring, 'guisp=' . a:3[0])
  endif

  execute join(histring, ' ')
endfunction

" }}}
" demerara Hi Groups: {{{

" memoize common hi groups
call s:HL('demeraraFg0', s:fg0)
call s:HL('demeraraFg1', s:fg1)
call s:HL('demeraraFg2', s:fg2)
call s:HL('demeraraFg3', s:fg3)
call s:HL('demeraraFg4', s:fg4)
call s:HL('demeraraGray', s:gray)
call s:HL('demeraraBg0', s:bg0)
call s:HL('demeraraBg1', s:bg1)
call s:HL('demeraraBg2', s:bg2)
call s:HL('demeraraBg3', s:bg3)
call s:HL('demeraraBg4', s:bg4)

call s:HL('demeraraRed', s:red)
call s:HL('demeraraRedBold', s:red, s:none, s:bold)
call s:HL('demeraraGreen', s:green)
call s:HL('demeraraGreenBold', s:green, s:none, s:bold)
call s:HL('demeraraYellow', s:yellow)
call s:HL('demeraraYellowBold', s:yellow, s:none, s:bold)
call s:HL('demeraraBlue', s:blue)
call s:HL('demeraraBlueBold', s:blue, s:none, s:bold)
call s:HL('demeraraPurple', s:purple)
call s:HL('demeraraPurpleBold', s:purple, s:none, s:bold)
call s:HL('demeraraAqua', s:aqua)
call s:HL('demeraraAquaBold', s:aqua, s:none, s:bold)
call s:HL('demeraraOrange', s:orange)
call s:HL('demeraraOrangeBold', s:orange, s:none, s:bold)

call s:HL('demeraraRedSign', s:red, s:sign_column, s:invert_signs)
call s:HL('demeraraGreenSign', s:green, s:sign_column, s:invert_signs)
call s:HL('demeraraYellowSign', s:yellow, s:sign_column, s:invert_signs)
call s:HL('demeraraBlueSign', s:blue, s:sign_column, s:invert_signs)
call s:HL('demeraraPurpleSign', s:purple, s:sign_column, s:invert_signs)
call s:HL('demeraraAquaSign', s:aqua, s:sign_column, s:invert_signs)

" }}}

" Vanilla colorscheme ---------------------------------------------------------
" General UI: {{{

" Normal text
call s:HL('Normal', s:fg1, s:bg0)

" Correct background (see issue #7):
" --- Problem with changing between dark and light on 256 color terminal
" --- https://github.com/morhetz/demerara/issues/7
if s:is_dark
  set background=dark
else
  set background=light
endif

if version >= 700
  " Screen line that the cursor is
  call s:HL('CursorLine',   s:none, s:bg1)
  " Screen column that the cursor is
  hi! link CursorColumn CursorLine

  " Tab pages line filler
  call s:HL('TabLineFill', s:bg4, s:bg1, s:invert_tabline)
  " Active tab page label
  call s:HL('TabLineSel', s:green, s:bg1, s:invert_tabline)
  " Not active tab page label
  hi! link TabLine TabLineFill

  " Match paired bracket under the cursor
  call s:HL('MatchParen', s:none, s:bg3, s:bold)
endif

if version >= 703
  " Highlighted screen columns
  call s:HL('ColorColumn',  s:none, s:color_column)

  " Concealed element: \lambda → λ
  call s:HL('Conceal', s:blue, s:none)

  " Line number of CursorLine
  call s:HL('CursorLineNr', s:yellow, s:bg1)
endif

hi! link NonText demeraraBg2
hi! link SpecialKey demeraraBg2

call s:HL('Visual',    s:none,  s:bg3, s:invert_selection)
hi! link VisualNOS Visual

call s:HL('Search',    s:yellow, s:bg0, s:inverse)
call s:HL('IncSearch', s:hls_cursor, s:bg0, s:inverse)

call s:HL('Underlined', s:blue, s:none, s:underline)

call s:HL('StatusLine',   s:bg2, s:fg1, s:inverse)
call s:HL('StatusLineNC', s:bg1, s:fg4, s:inverse)

" The column separating vertically split windows
call s:HL('VertSplit', s:bg3, s:vert_split)

" Current match in wildmenu completion
call s:HL('WildMenu', s:blue, s:bg2, s:bold)

" Directory names, special names in listing
hi! link Directory demeraraGreenBold

" Titles for output from :set all, :autocmd, etc.
hi! link Title demeraraGreenBold

" Error messages on the command line
call s:HL('ErrorMsg',   s:bg0, s:red, s:bold)
" More prompt: -- More --
hi! link MoreMsg demeraraYellowBold
" Current mode message: -- INSERT --
hi! link ModeMsg demeraraYellowBold
" 'Press enter' prompt and yes/no questions
hi! link Question demeraraOrangeBold
" Warning messages
hi! link WarningMsg demeraraRedBold

" }}}
" Gutter: {{{

" Line number for :number and :# commands
call s:HL('LineNr', s:bg4, s:number_column)

" Column where signs are displayed
call s:HL('SignColumn', s:none, s:sign_column)

" Line used for closed folds
call s:HL('Folded', s:gray, s:bg1, s:italic)
" Column where folds are displayed
call s:HL('FoldColumn', s:gray, s:bg1)

" }}}
" Cursor: {{{

" Character under cursor
call s:HL('Cursor', s:none, s:none, s:inverse)
" Visual mode cursor, selection
hi! link vCursor Cursor
" Input moder cursor
hi! link iCursor Cursor
" Language mapping cursor
hi! link lCursor Cursor

" }}}
" Syntax Highlighting: {{{

if g:demerara_improved_strings == 0
  hi! link Special demeraraOrange
else
  call s:HL('Special', s:orange, s:bg1, s:italicize_strings)
endif

call s:HL('Comment', s:gray, s:none, s:italicize_comments)
call s:HL('Todo', s:vim_fg, s:vim_bg, s:bold . s:italic)
call s:HL('Error', s:red, s:vim_bg, s:bold . s:inverse)

" Generic statement
hi! link Statement demeraraRed
" if, then, else, endif, swicth, etc.
hi! link Conditional demeraraRed
" for, do, while, etc.
hi! link Repeat demeraraRed
" case, default, etc.
hi! link Label demeraraRed
" try, catch, throw
hi! link Exception demeraraRed
" sizeof, "+", "*", etc.
hi! link Operator Normal
" Any other keyword
hi! link Keyword demeraraRed

" Variable name
hi! link Identifier demeraraBlue
" Function name
hi! link Function demeraraGreenBold

" Generic preprocessor
hi! link PreProc demeraraAqua
" Preprocessor #include
hi! link Include demeraraAqua
" Preprocessor #define
hi! link Define demeraraAqua
" Same as Define
hi! link Macro demeraraAqua
" Preprocessor #if, #else, #endif, etc.
hi! link PreCondit demeraraAqua

" Generic constant
hi! link Constant demeraraPurple
" Character constant: 'c', '/n'
hi! link Character demeraraPurple
" String constant: "this is a string"
if g:demerara_improved_strings == 0
  call s:HL('String',  s:green, s:none, s:italicize_strings)
else
  call s:HL('String',  s:fg1, s:bg1, s:italicize_strings)
endif
" Boolean constant: TRUE, false
hi! link Boolean demeraraPurple
" Number constant: 234, 0xff
hi! link Number demeraraPurple
" Floating point constant: 2.3e10
hi! link Float demeraraPurple

" Generic type
hi! link Type demeraraYellow
" static, register, volatile, etc
hi! link StorageClass demeraraOrange
" struct, union, enum, etc.
hi! link Structure demeraraAqua
" typedef
hi! link Typedef demeraraYellow

" }}}
" Completion Menu: {{{

if version >= 700
  " Popup menu: normal item
  call s:HL('Pmenu', s:fg1, s:bg2)
  " Popup menu: selected item
  call s:HL('PmenuSel', s:bg2, s:blue, s:bold)
  " Popup menu: scrollbar
  call s:HL('PmenuSbar', s:none, s:bg2)
  " Popup menu: scrollbar thumb
  call s:HL('PmenuThumb', s:none, s:bg4)
endif

" }}}
" Diffs: {{{

call s:HL('DiffDelete', s:red, s:bg0, s:inverse)
call s:HL('DiffAdd',    s:green, s:bg0, s:inverse)
"call s:HL('DiffChange', s:bg0, s:blue)
"call s:HL('DiffText',   s:bg0, s:yellow)

" Alternative setting
call s:HL('DiffChange', s:aqua, s:bg0, s:inverse)
call s:HL('DiffText',   s:yellow, s:bg0, s:inverse)

" }}}
" Spelling: {{{

if has("spell")
  " Not capitalised word, or compile warnings
  if g:demerara_improved_warnings == 0
    call s:HL('SpellCap',   s:none, s:none, s:undercurl, s:red)
  else
    call s:HL('SpellCap',   s:green, s:none, s:bold . s:italic)
  endif
  " Not recognized word
  call s:HL('SpellBad',   s:none, s:none, s:undercurl, s:blue)
  " Wrong spelling for selected region
  call s:HL('SpellLocal', s:none, s:none, s:undercurl, s:aqua)
  " Rare word
  call s:HL('SpellRare',  s:none, s:none, s:undercurl, s:purple)
endif

" }}}

" Plugin specific -------------------------------------------------------------
" EasyMotion: {{{

hi! link EasyMotionTarget Search
hi! link EasyMotionShade Comment

" }}}
" Sneak: {{{

hi! link Sneak Search
hi! link SneakLabel Search

" }}}
" Indent Guides: {{{

if !exists('g:indent_guides_auto_colors')
  let g:indent_guides_auto_colors = 0
endif

if g:indent_guides_auto_colors == 0
  if g:demerara_invert_indent_guides == 0
    call s:HL('IndentGuidesOdd', s:vim_bg, s:bg2)
    call s:HL('IndentGuidesEven', s:vim_bg, s:bg1)
  else
    call s:HL('IndentGuidesOdd', s:vim_bg, s:bg2, s:inverse)
    call s:HL('IndentGuidesEven', s:vim_bg, s:bg3, s:inverse)
  endif
endif

" }}}
" IndentLine: {{{

if !exists('g:indentLine_color_term')
  let g:indentLine_color_term = s:bg2[1]
endif
if !exists('g:indentLine_color_gui')
  let g:indentLine_color_gui = s:bg2[0]
endif

" }}}
" Rainbow Parentheses: {{{

if !exists('g:rbpt_colorpairs')
  let g:rbpt_colorpairs =
    \ [
      \ ['blue', '#458588'], ['magenta', '#b16286'],
      \ ['red',  '#cc241d'], ['166',     '#d65d0e']
    \ ]
endif

let g:rainbow_guifgs = [ '#d65d0e', '#cc241d', '#b16286', '#458588' ]
let g:rainbow_ctermfgs = [ '166', 'red', 'magenta', 'blue' ]

if !exists('g:rainbow_conf')
   let g:rainbow_conf = {}
endif
if !has_key(g:rainbow_conf, 'guifgs')
   let g:rainbow_conf['guifgs'] = g:rainbow_guifgs
endif
if !has_key(g:rainbow_conf, 'ctermfgs')
   let g:rainbow_conf['ctermfgs'] = g:rainbow_ctermfgs
endif

let g:niji_dark_colours = g:rbpt_colorpairs
let g:niji_light_colours = g:rbpt_colorpairs

"}}}
" GitGutter: {{{

hi! link GitGutterAdd demeraraGreenSign
hi! link GitGutterChange demeraraAquaSign
hi! link GitGutterDelete demeraraRedSign
hi! link GitGutterChangeDelete demeraraAquaSign

" }}}
" GitCommit: "{{{

hi! link gitcommitSelectedFile demeraraGreen
hi! link gitcommitDiscardedFile demeraraRed

" }}}
" Signify: {{{

hi! link SignifySignAdd demeraraGreenSign
hi! link SignifySignChange demeraraAquaSign
hi! link SignifySignDelete demeraraRedSign

" }}}
" Syntastic: {{{

call s:HL('SyntasticError', s:none, s:none, s:undercurl, s:red)
call s:HL('SyntasticWarning', s:none, s:none, s:undercurl, s:yellow)

hi! link SyntasticErrorSign demeraraRedSign
hi! link SyntasticWarningSign demeraraYellowSign

" }}}
" Signature: {{{
hi! link SignatureMarkText   demeraraBlueSign
hi! link SignatureMarkerText demeraraPurpleSign

" }}}
" ShowMarks: {{{

hi! link ShowMarksHLl demeraraBlueSign
hi! link ShowMarksHLu demeraraBlueSign
hi! link ShowMarksHLo demeraraBlueSign
hi! link ShowMarksHLm demeraraBlueSign

" }}}
" CtrlP: {{{

hi! link CtrlPMatch demeraraYellow
hi! link CtrlPNoEntries demeraraRed
hi! link CtrlPPrtBase demeraraBg2
hi! link CtrlPPrtCursor demeraraBlue
hi! link CtrlPLinePre demeraraBg2

call s:HL('CtrlPMode1', s:blue, s:bg2, s:bold)
call s:HL('CtrlPMode2', s:bg0, s:blue, s:bold)
call s:HL('CtrlPStats', s:fg4, s:bg2, s:bold)

" }}}
" Startify: {{{

hi! link StartifyBracket demeraraFg3
hi! link StartifyFile demeraraFg1
hi! link StartifyNumber demeraraBlue
hi! link StartifyPath demeraraGray
hi! link StartifySlash demeraraGray
hi! link StartifySection demeraraYellow
hi! link StartifySpecial demeraraBg2
hi! link StartifyHeader demeraraOrange
hi! link StartifyFooter demeraraBg2

" }}}
" Vimshell: {{{

let g:vimshell_escape_colors = [
  \ s:bg4[0], s:red[0], s:green[0], s:yellow[0],
  \ s:blue[0], s:purple[0], s:aqua[0], s:fg4[0],
  \ s:bg0[0], s:red[0], s:green[0], s:orange[0],
  \ s:blue[0], s:purple[0], s:aqua[0], s:fg0[0]
  \ ]

" }}}
" BufTabLine: {{{

call s:HL('BufTabLineCurrent', s:bg0, s:fg4)
call s:HL('BufTabLineActive', s:fg4, s:bg2)
call s:HL('BufTabLineHidden', s:bg4, s:bg1)
call s:HL('BufTabLineFill', s:bg0, s:bg0)

" }}}
" Asynchronous Lint Engine: {{{

call s:HL('ALEError', s:none, s:none, s:undercurl, s:red)
call s:HL('ALEWarning', s:none, s:none, s:undercurl, s:yellow)
call s:HL('ALEInfo', s:none, s:none, s:undercurl, s:blue)

hi! link ALEErrorSign demeraraRedSign
hi! link ALEWarningSign demeraraYellowSign
hi! link ALEInfoSign demeraraBlueSign

" }}}
" Dirvish: {{{

hi! link DirvishPathTail demeraraAqua
hi! link DirvishArg demeraraYellow

" }}}
" Netrw: {{{

hi! link netrwDir demeraraAqua
hi! link netrwClassify demeraraAqua
hi! link netrwLink demeraraGray
hi! link netrwSymLink demeraraFg1
hi! link netrwExe demeraraYellow
hi! link netrwComment demeraraGray
hi! link netrwList demeraraBlue
hi! link netrwHelpCmd demeraraAqua
hi! link netrwCmdSep demeraraFg3
hi! link netrwVersion demeraraGreen

" }}}
" NERDTree: {{{

hi! link NERDTreeDir demeraraAqua
hi! link NERDTreeDirSlash demeraraAqua

hi! link NERDTreeOpenable demeraraOrange
hi! link NERDTreeClosable demeraraOrange

hi! link NERDTreeFile demeraraFg1
hi! link NERDTreeExecFile demeraraYellow

hi! link NERDTreeUp demeraraGray
hi! link NERDTreeCWD demeraraGreen
hi! link NERDTreeHelp demeraraFg1

hi! link NERDTreeToggleOn demeraraGreen
hi! link NERDTreeToggleOff demeraraRed

" }}}
" Vim Multiple Cursors: {{{

call s:HL('multiple_cursors_cursor', s:none, s:none, s:inverse)
call s:HL('multiple_cursors_visual', s:none, s:bg2)

" }}}

" Filetype specific -----------------------------------------------------------
" Diff: {{{

hi! link diffAdded demeraraGreen
hi! link diffRemoved demeraraRed
hi! link diffChanged demeraraAqua

hi! link diffFile demeraraOrange
hi! link diffNewFile demeraraYellow

hi! link diffLine demeraraBlue

" }}}
" Html: {{{

hi! link htmlTag demeraraBlue
hi! link htmlEndTag demeraraBlue

hi! link htmlTagName demeraraAquaBold
hi! link htmlArg demeraraAqua

hi! link htmlScriptTag demeraraPurple
hi! link htmlTagN demeraraFg1
hi! link htmlSpecialTagName demeraraAquaBold

call s:HL('htmlLink', s:fg4, s:none, s:underline)

hi! link htmlSpecialChar demeraraOrange

call s:HL('htmlBold', s:vim_fg, s:vim_bg, s:bold)
call s:HL('htmlBoldUnderline', s:vim_fg, s:vim_bg, s:bold . s:underline)
call s:HL('htmlBoldItalic', s:vim_fg, s:vim_bg, s:bold . s:italic)
call s:HL('htmlBoldUnderlineItalic', s:vim_fg, s:vim_bg, s:bold . s:underline . s:italic)

call s:HL('htmlUnderline', s:vim_fg, s:vim_bg, s:underline)
call s:HL('htmlUnderlineItalic', s:vim_fg, s:vim_bg, s:underline . s:italic)
call s:HL('htmlItalic', s:vim_fg, s:vim_bg, s:italic)

" }}}
" Xml: {{{

hi! link xmlTag demeraraBlue
hi! link xmlEndTag demeraraBlue
hi! link xmlTagName demeraraBlue
hi! link xmlEqual demeraraBlue
hi! link docbkKeyword demeraraAquaBold

hi! link xmlDocTypeDecl demeraraGray
hi! link xmlDocTypeKeyword demeraraPurple
hi! link xmlCdataStart demeraraGray
hi! link xmlCdataCdata demeraraPurple
hi! link dtdFunction demeraraGray
hi! link dtdTagName demeraraPurple

hi! link xmlAttrib demeraraAqua
hi! link xmlProcessingDelim demeraraGray
hi! link dtdParamEntityPunct demeraraGray
hi! link dtdParamEntityDPunct demeraraGray
hi! link xmlAttribPunct demeraraGray

hi! link xmlEntity demeraraOrange
hi! link xmlEntityPunct demeraraOrange
" }}}
" Vim: {{{

call s:HL('vimCommentTitle', s:fg4_256, s:none, s:bold . s:italicize_comments)

hi! link vimNotation demeraraOrange
hi! link vimBracket demeraraOrange
hi! link vimMapModKey demeraraOrange
hi! link vimFuncSID demeraraFg3
hi! link vimSetSep demeraraFg3
hi! link vimSep demeraraFg3
hi! link vimContinue demeraraFg3

" }}}
" Clojure: {{{

hi! link clojureKeyword demeraraBlue
hi! link clojureCond demeraraOrange
hi! link clojureSpecial demeraraOrange
hi! link clojureDefine demeraraOrange

hi! link clojureFunc demeraraYellow
hi! link clojureRepeat demeraraYellow
hi! link clojureCharacter demeraraAqua
hi! link clojureStringEscape demeraraAqua
hi! link clojureException demeraraRed

hi! link clojureRegexp demeraraAqua
hi! link clojureRegexpEscape demeraraAqua
call s:HL('clojureRegexpCharClass', s:fg3, s:none, s:bold)
hi! link clojureRegexpMod clojureRegexpCharClass
hi! link clojureRegexpQuantifier clojureRegexpCharClass

hi! link clojureParen demeraraFg3
hi! link clojureAnonArg demeraraYellow
hi! link clojureVariable demeraraBlue
hi! link clojureMacro demeraraOrange

hi! link clojureMeta demeraraYellow
hi! link clojureDeref demeraraYellow
hi! link clojureQuote demeraraYellow
hi! link clojureUnquote demeraraYellow

" }}}
" C: {{{

hi! link cOperator demeraraPurple
hi! link cStructure demeraraOrange

" }}}
" Python: {{{

hi! link pythonBuiltin demeraraOrange
hi! link pythonBuiltinObj demeraraOrange
hi! link pythonBuiltinFunc demeraraOrange
hi! link pythonFunction demeraraAqua
hi! link pythonDecorator demeraraRed
hi! link pythonInclude demeraraBlue
hi! link pythonImport demeraraBlue
hi! link pythonRun demeraraBlue
hi! link pythonCoding demeraraBlue
hi! link pythonOperator demeraraRed
hi! link pythonException demeraraRed
hi! link pythonExceptions demeraraPurple
hi! link pythonBoolean demeraraPurple
hi! link pythonDot demeraraFg3
hi! link pythonConditional demeraraRed
hi! link pythonRepeat demeraraRed
hi! link pythonDottedName demeraraGreenBold

" }}}
" CSS: {{{

hi! link cssBraces demeraraBlue
hi! link cssFunctionName demeraraYellow
hi! link cssIdentifier demeraraOrange
hi! link cssClassName demeraraGreen
hi! link cssColor demeraraBlue
hi! link cssSelectorOp demeraraBlue
hi! link cssSelectorOp2 demeraraBlue
hi! link cssImportant demeraraGreen
hi! link cssVendor demeraraFg1

hi! link cssTextProp demeraraAqua
hi! link cssAnimationProp demeraraAqua
hi! link cssUIProp demeraraYellow
hi! link cssTransformProp demeraraAqua
hi! link cssTransitionProp demeraraAqua
hi! link cssPrintProp demeraraAqua
hi! link cssPositioningProp demeraraYellow
hi! link cssBoxProp demeraraAqua
hi! link cssFontDescriptorProp demeraraAqua
hi! link cssFlexibleBoxProp demeraraAqua
hi! link cssBorderOutlineProp demeraraAqua
hi! link cssBackgroundProp demeraraAqua
hi! link cssMarginProp demeraraAqua
hi! link cssListProp demeraraAqua
hi! link cssTableProp demeraraAqua
hi! link cssFontProp demeraraAqua
hi! link cssPaddingProp demeraraAqua
hi! link cssDimensionProp demeraraAqua
hi! link cssRenderProp demeraraAqua
hi! link cssColorProp demeraraAqua
hi! link cssGeneratedContentProp demeraraAqua

" }}}
" JavaScript: {{{

hi! link javaScriptBraces demeraraFg1
hi! link javaScriptFunction demeraraAqua
hi! link javaScriptIdentifier demeraraRed
hi! link javaScriptMember demeraraBlue
hi! link javaScriptNumber demeraraPurple
hi! link javaScriptNull demeraraPurple
hi! link javaScriptParens demeraraFg3

" }}}
" YAJS: {{{

hi! link javascriptImport demeraraAqua
hi! link javascriptExport demeraraAqua
hi! link javascriptClassKeyword demeraraAqua
hi! link javascriptClassExtends demeraraAqua
hi! link javascriptDefault demeraraAqua

hi! link javascriptClassName demeraraYellow
hi! link javascriptClassSuperName demeraraYellow
hi! link javascriptGlobal demeraraYellow

hi! link javascriptEndColons demeraraFg1
hi! link javascriptFuncArg demeraraFg1
hi! link javascriptGlobalMethod demeraraFg1
hi! link javascriptNodeGlobal demeraraFg1
hi! link javascriptBOMWindowProp demeraraFg1
hi! link javascriptArrayMethod demeraraFg1
hi! link javascriptArrayStaticMethod demeraraFg1
hi! link javascriptCacheMethod demeraraFg1
hi! link javascriptDateMethod demeraraFg1
hi! link javascriptMathStaticMethod demeraraFg1

" hi! link javascriptProp demeraraFg1
hi! link javascriptURLUtilsProp demeraraFg1
hi! link javascriptBOMNavigatorProp demeraraFg1
hi! link javascriptDOMDocMethod demeraraFg1
hi! link javascriptDOMDocProp demeraraFg1
hi! link javascriptBOMLocationMethod demeraraFg1
hi! link javascriptBOMWindowMethod demeraraFg1
hi! link javascriptStringMethod demeraraFg1

hi! link javascriptVariable demeraraOrange
" hi! link javascriptVariable demeraraRed
" hi! link javascriptIdentifier demeraraOrange
" hi! link javascriptClassSuper demeraraOrange
hi! link javascriptIdentifier demeraraOrange
hi! link javascriptClassSuper demeraraOrange

" hi! link javascriptFuncKeyword demeraraOrange
" hi! link javascriptAsyncFunc demeraraOrange
hi! link javascriptFuncKeyword demeraraAqua
hi! link javascriptAsyncFunc demeraraAqua
hi! link javascriptClassStatic demeraraOrange

hi! link javascriptOperator demeraraRed
hi! link javascriptForOperator demeraraRed
hi! link javascriptYield demeraraRed
hi! link javascriptExceptions demeraraRed
hi! link javascriptMessage demeraraRed

hi! link javascriptTemplateSB demeraraAqua
hi! link javascriptTemplateSubstitution demeraraFg1

" hi! link javascriptLabel demeraraBlue
" hi! link javascriptObjectLabel demeraraBlue
" hi! link javascriptPropertyName demeraraBlue
hi! link javascriptLabel demeraraFg1
hi! link javascriptObjectLabel demeraraFg1
hi! link javascriptPropertyName demeraraFg1

hi! link javascriptLogicSymbols demeraraFg1
hi! link javascriptArrowFunc demeraraYellow

hi! link javascriptDocParamName demeraraFg4
hi! link javascriptDocTags demeraraFg4
hi! link javascriptDocNotation demeraraFg4
hi! link javascriptDocParamType demeraraFg4
hi! link javascriptDocNamedParamType demeraraFg4

hi! link javascriptBrackets demeraraFg1
hi! link javascriptDOMElemAttrs demeraraFg1
hi! link javascriptDOMEventMethod demeraraFg1
hi! link javascriptDOMNodeMethod demeraraFg1
hi! link javascriptDOMStorageMethod demeraraFg1
hi! link javascriptHeadersMethod demeraraFg1

hi! link javascriptAsyncFuncKeyword demeraraRed
hi! link javascriptAwaitFuncKeyword demeraraRed

" }}}
" PanglossJS: {{{

hi! link jsClassKeyword demeraraAqua
hi! link jsExtendsKeyword demeraraAqua
hi! link jsExportDefault demeraraAqua
hi! link jsTemplateBraces demeraraAqua
hi! link jsGlobalNodeObjects demeraraFg1
hi! link jsGlobalObjects demeraraFg1
hi! link jsFunction demeraraAqua
hi! link jsFuncParens demeraraFg3
hi! link jsParens demeraraFg3
hi! link jsNull demeraraPurple
hi! link jsUndefined demeraraPurple
hi! link jsClassDefinition demeraraYellow

" }}}
" TypeScript: {{{

hi! link typeScriptReserved demeraraAqua
hi! link typeScriptLabel demeraraAqua
hi! link typeScriptFuncKeyword demeraraAqua
hi! link typeScriptIdentifier demeraraOrange
hi! link typeScriptBraces demeraraFg1
hi! link typeScriptEndColons demeraraFg1
hi! link typeScriptDOMObjects demeraraFg1
hi! link typeScriptAjaxMethods demeraraFg1
hi! link typeScriptLogicSymbols demeraraFg1
hi! link typeScriptDocSeeTag Comment
hi! link typeScriptDocParam Comment
hi! link typeScriptDocTags vimCommentTitle
hi! link typeScriptGlobalObjects demeraraFg1
hi! link typeScriptParens demeraraFg3
hi! link typeScriptOpSymbols demeraraFg3
hi! link typeScriptHtmlElemProperties demeraraFg1
hi! link typeScriptNull demeraraPurple
hi! link typeScriptInterpolationDelimiter demeraraAqua

" }}}
" PureScript: {{{

hi! link purescriptModuleKeyword demeraraAqua
hi! link purescriptModuleName demeraraFg1
hi! link purescriptWhere demeraraAqua
hi! link purescriptDelimiter demeraraFg4
hi! link purescriptType demeraraFg1
hi! link purescriptImportKeyword demeraraAqua
hi! link purescriptHidingKeyword demeraraAqua
hi! link purescriptAsKeyword demeraraAqua
hi! link purescriptStructure demeraraAqua
hi! link purescriptOperator demeraraBlue

hi! link purescriptTypeVar demeraraFg1
hi! link purescriptConstructor demeraraFg1
hi! link purescriptFunction demeraraFg1
hi! link purescriptConditional demeraraOrange
hi! link purescriptBacktick demeraraOrange

" }}}
" CoffeeScript: {{{

hi! link coffeeExtendedOp demeraraFg3
hi! link coffeeSpecialOp demeraraFg3
hi! link coffeeCurly demeraraOrange
hi! link coffeeParen demeraraFg3
hi! link coffeeBracket demeraraOrange

" }}}
" Ruby: {{{

hi! link rubyStringDelimiter demeraraGreen
hi! link rubyInterpolationDelimiter demeraraAqua

" }}}
" ObjectiveC: {{{

hi! link objcTypeModifier demeraraRed
hi! link objcDirective demeraraBlue

" }}}
" Go: {{{

hi! link goDirective demeraraAqua
hi! link goConstants demeraraPurple
hi! link goDeclaration demeraraRed
hi! link goDeclType demeraraBlue
hi! link goBuiltins demeraraOrange

" }}}
" Lua: {{{

hi! link luaIn demeraraRed
hi! link luaFunction demeraraAqua
hi! link luaTable demeraraOrange

" }}}
" MoonScript: {{{

hi! link moonSpecialOp demeraraFg3
hi! link moonExtendedOp demeraraFg3
hi! link moonFunction demeraraFg3
hi! link moonObject demeraraYellow

" }}}
" Java: {{{

hi! link javaAnnotation demeraraBlue
hi! link javaDocTags demeraraAqua
hi! link javaCommentTitle vimCommentTitle
hi! link javaParen demeraraFg3
hi! link javaParen1 demeraraFg3
hi! link javaParen2 demeraraFg3
hi! link javaParen3 demeraraFg3
hi! link javaParen4 demeraraFg3
hi! link javaParen5 demeraraFg3
hi! link javaOperator demeraraOrange

hi! link javaVarArg demeraraGreen

" }}}
" Elixir: {{{

hi! link elixirDocString Comment

hi! link elixirStringDelimiter demeraraGreen
hi! link elixirInterpolationDelimiter demeraraAqua

hi! link elixirModuleDeclaration demeraraYellow

" }}}
" Scala: {{{

" NB: scala vim syntax file is kinda horrible
hi! link scalaNameDefinition demeraraFg1
hi! link scalaCaseFollowing demeraraFg1
hi! link scalaCapitalWord demeraraFg1
hi! link scalaTypeExtension demeraraFg1

hi! link scalaKeyword demeraraRed
hi! link scalaKeywordModifier demeraraRed

hi! link scalaSpecial demeraraAqua
hi! link scalaOperator demeraraFg1

hi! link scalaTypeDeclaration demeraraYellow
hi! link scalaTypeTypePostDeclaration demeraraYellow

hi! link scalaInstanceDeclaration demeraraFg1
hi! link scalaInterpolation demeraraAqua

" }}}
" Markdown: {{{

call s:HL('markdownItalic', s:fg3, s:none, s:italic)

hi! link markdownH1 demeraraGreenBold
hi! link markdownH2 demeraraGreenBold
hi! link markdownH3 demeraraYellowBold
hi! link markdownH4 demeraraYellowBold
hi! link markdownH5 demeraraYellow
hi! link markdownH6 demeraraYellow

hi! link markdownCode demeraraAqua
hi! link markdownCodeBlock demeraraAqua
hi! link markdownCodeDelimiter demeraraAqua

hi! link markdownBlockquote demeraraGray
hi! link markdownListMarker demeraraGray
hi! link markdownOrderedListMarker demeraraGray
hi! link markdownRule demeraraGray
hi! link markdownHeadingRule demeraraGray

hi! link markdownUrlDelimiter demeraraFg3
hi! link markdownLinkDelimiter demeraraFg3
hi! link markdownLinkTextDelimiter demeraraFg3

hi! link markdownHeadingDelimiter demeraraOrange
hi! link markdownUrl demeraraPurple
hi! link markdownUrlTitleDelimiter demeraraGreen

call s:HL('markdownLinkText', s:gray, s:none, s:underline)
hi! link markdownIdDeclaration markdownLinkText

" }}}
" Haskell: {{{

" hi! link haskellType demeraraYellow
" hi! link haskellOperators demeraraOrange
" hi! link haskellConditional demeraraAqua
" hi! link haskellLet demeraraOrange
"
hi! link haskellType demeraraFg1
hi! link haskellIdentifier demeraraFg1
hi! link haskellSeparator demeraraFg1
hi! link haskellDelimiter demeraraFg4
hi! link haskellOperators demeraraBlue
"
hi! link haskellBacktick demeraraOrange
hi! link haskellStatement demeraraOrange
hi! link haskellConditional demeraraOrange

hi! link haskellLet demeraraAqua
hi! link haskellDefault demeraraAqua
hi! link haskellWhere demeraraAqua
hi! link haskellBottom demeraraAqua
hi! link haskellBlockKeywords demeraraAqua
hi! link haskellImportKeywords demeraraAqua
hi! link haskellDeclKeyword demeraraAqua
hi! link haskellDeriving demeraraAqua
hi! link haskellAssocType demeraraAqua

hi! link haskellNumber demeraraPurple
hi! link haskellPragma demeraraPurple

hi! link haskellString demeraraGreen
hi! link haskellChar demeraraGreen

" }}}
" Json: {{{

hi! link jsonKeyword demeraraGreen
hi! link jsonQuote demeraraGreen
hi! link jsonBraces demeraraFg1
hi! link jsonString demeraraFg1

" }}}


" Functions -------------------------------------------------------------------
" Search Highlighting Cursor {{{

function! DemeraraHlsShowCursor()
  call s:HL('Cursor', s:bg0, s:hls_cursor)
endfunction

function! DemeraraHlsHideCursor()
  call s:HL('Cursor', s:none, s:none, s:inverse)
endfunction

" }}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker:
