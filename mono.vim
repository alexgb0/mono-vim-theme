" Mono theme
" By Alex G. B.
" inspired by:
"   - CRT themes: krueger71
"   - Mono: Stepan Vanzuriak
"   (both for VSCode)


if (get(g:, "colors_name", "") ==# "mono")
    runtime! colors/mono.vim
    finish
endif

highlight clear

if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "mono"

let s:palette = {}

let s:palette.border =      [250, "#bcbcbc"]
let s:palette.foreground =  [249, "#b2b2b2"]
let s:palette.background =  [233, "#111111"]
let s:palette.33 =          [238, "#444444"]
let s:palette.88 =          [242, "#6c6c6c"]


let s:palette.purple = [98, '#875fd7']
let s:palette.brown = [130, '#af5f00']
let s:palette.blue = [67, '#5f87af']
let s:palette.darkblue = [27, '#005fff']
let s:palette.green = [65, '#5f875f']
let s:palette.red = [88, '#870000']
let s:palette.magenta = [125, '#af005f']

function! s:hi(group, fg_color, bg_color, style)
    let highlight_command = ['hi', a:group]
    if !empty(a:fg_color)
        let [ctermfg, guifg] = a:fg_color
        call add(highlight_command, printf('ctermfg=%d guifg=%s', ctermfg, guifg))
    endif
    if !empty(a:bg_color)
        let [ctermbg, guibg] = a:bg_color
        call add(highlight_command, printf('ctermbg=%d guibg=%s', ctermbg, guibg))
    endif
    if !empty(a:style)
        call add(highlight_command, printf('cterm=%s gui=%s', a:style, a:style))
    endif
    execute join(highlight_command, ' ')
endfunction


call s:hi('Normal', s:palette.foreground, s:palette.background, '')
set background=dark

call s:hi('Constant', s:palette.foreground, [], '')
"call s:hi('String', s:palette.foreground, [], '')
"call s:hi('Number', s:palette.foreground, [], '')

call s:hi('Identifier', s:palette.foreground, [], 'none')
call s:hi('Function', s:palette.foreground, [], 'italic')

call s:hi('Statement', s:palette.88, [], 'none')
"call s:hi('Operator', s:palette.gray03, [], 'none')
"call s:hi('Keyword', s:palette.gray10, [], '')

call s:hi('PreProc', s:palette.88, [], 'none')
call s:hi('Macro', s:palette.88, [], 'bold')

call s:hi('Type', s:palette.88, [], 'bold')

call s:hi('Special', s:palette.88, [], '')
call s:hi('SpecialComment', s:palette.88, [], 'bold')

call s:hi('Title', s:palette.foreground, [], 'bold')
call s:hi('Todo', s:palette.88, [], 'bold')

if has("nvim") || has("gui_running")
    call s:hi('Comment', s:palette.33, [], '')
else
    call s:hi('Comment', s:palette.33, [], '')
endif

" call s:hi('LineNr', s:palette.33, s:palette.gray15, 'none')
" call s:hi('FoldColumn', s:palette.gray08, s:palette.gray15, 'none')
" call s:hi('CursorLine', [], s:palette.gray15, 'none')
" call s:hi('CursorLineNr', s:palette.gray06, s:palette.gray15, 'none')
" 
" call s:hi('Visual', s:palette.white, s:palette.gray06, '')
" call s:hi('Search', s:palette.gray15, s:palette.gray03, 'none')
" call s:hi('IncSearch', s:palette.white, s:palette.gray11, 'bold')
" 
" call s:hi('SpellBad', s:palette.red, s:palette.white, 'undercurl')
" call s:hi('SpellCap', s:palette.red, s:palette.white, 'undercurl')
" call s:hi('SpellLocal', s:palette.red, s:palette.white, 'undercurl')
" call s:hi('SpellRare', s:palette.brown, s:palette.white, 'undercurl')
" 
" call s:hi('Error', s:palette.red, s:palette.white, 'bold')
" call s:hi('ErrorMsg', s:palette.red, s:palette.white, '')
" call s:hi('WarningMsg', s:palette.brown, s:palette.white, '')
" call s:hi('ModeMsg', s:palette.gray10, [], '')
" call s:hi('MoreMsg', s:palette.gray10, [], '')
" 
" call s:hi('MatchParen', s:palette.magenta, s:palette.white, '')
" 
" call s:hi('Cursor', [], s:palette.gray12, '')
" call s:hi('Underlined', s:palette.gray08, [], 'underline')
" call s:hi('SpecialKey', s:palette.gray13, [], '')
" call s:hi('NonText', s:palette.gray13, [], '')
" call s:hi('Directory', s:palette.gray08, [], '')
" 
" call s:hi('Pmenu', s:palette.gray05, s:palette.gray14, 'none')
" call s:hi('PmenuSbar', s:palette.white, s:palette.gray01, 'none')
" call s:hi('PmenuSel', s:palette.gray14, s:palette.gray05, '')
" call s:hi('PmenuThumb', s:palette.gray14, s:palette.gray03, 'none')
" 
" call s:hi('StatusLine', s:palette.gray03, s:palette.gray13, 'none')
" call s:hi('StatusLineNC', s:palette.gray13, s:palette.gray15, 'none')
" call s:hi('WildMenu', s:palette.gray08, [], '')
" call s:hi('VertSplit', s:palette.gray13, s:palette.gray13, 'none')
" 
" call s:hi('DiffAdd', s:palette.white, s:palette.green, '')
" call s:hi('DiffChange', s:palette.white, s:palette.blue, '')
" call s:hi('DiffDelete', s:palette.white, s:palette.red, '')
" call s:hi('DiffText', s:palette.white, s:palette.darkblue, '')
" call s:hi('DiffAdded', s:palette.green, s:palette.white, '')
" call s:hi('DiffChanged', s:palette.blue, s:palette.white, '')
" call s:hi('DiffRemoved', s:palette.red, s:palette.white, '')


highlight! link Character Constant
highlight! link Float Number
highlight! link Boolean Number

highlight! link SignColumn FoldColumn
highlight! link ColorColumn FoldColumn
highlight! link CursorColumn CursorLine

highlight! link Folded LineNr
highlight! link Conceal Normal
highlight! link ErrorMsg Error

highlight! link Conditional Statement
highlight! link Repeat Statement
highlight! link Label Statement
highlight! link Exception Statement

highlight! link Include PreProc
highlight! link Define PreProc
highlight! link Macro PreProc
highlight! link PreCondit PreProc

highlight! link StorageClass Type
highlight! link Structure Type
highlight! link Typedef Type

highlight! link SpecialChar Special
highlight! link Tag Special
highlight! link Delimiter Special
highlight! link Debug Special
highlight! link Question Special

highlight! link VisualNOS Visual
highlight! link TabLine StatusLineNC
highlight! link TabLineFill StatusLineNC
highlight! link TabLineSel StatusLine
