# Generate real syntax file from template.

(def built-ins (filter |(not= 'built-ins $) (all-bindings)))

(def functions (filter |(not (get (dyn $) :macro)) built-ins))
(def macros (filter |(get (dyn $) :macro) built-ins))

(def template
`````
" Vim syntax file
" Language:   Janet
" Maintainer: Calvin Rose
" URL:        https://github.com/janet-lang/janet.vim
" License:    MIT License

if exists("b:current_syntax")
    finish
endif

let s:cpo_sav = &cpo
set cpo&vim

if has("folding") && exists("g:janet_fold") && g:janet_fold > 0
    setlocal foldmethod=syntax
endif

syntax keyword JanetCommentTodo contained FIXME XXX TODO FIXME: XXX: TODO:

" Janet comments
syntax match JanetComment "#.*$" contains=JanetCommentTodo,@Spell

syntax match JanetStringEscape '\v\\%([ntvr0zfe"\\]|x[[0-9a-fA-F]]\{2}|u[[0-9a-fA-F]]\{4}|U[[0-9a-fA-F]]\{6})' contained
syntax region JanetString matchgroup=JanetStringDelimiter start=/"/ skip=/\\\\\|\\"/ end=/"/ contains=JanetStringEscape,@Spell
syntax region JanetBuffer matchgroup=JanetStringDelimiter start=/@"/ skip=/\\\\\|\\"/ end=/"/ contains=JanetStringEscape,@Spell
syntax region JanetString matchgroup=JanetStringDelimiter start="\z(`\+\)" end="\z1" contains=@Spell
syntax region JanetBuffer matchgroup=JanetStringDelimiter start="@\z(`\+\)" end="\z1" contains=@Spell

let s:janet_syntax_keywords = {
    \   'JanetBoolean': ["false","true"]
    \ , 'JanetConstant': ["nil"]
    \ , 'JanetSpecialForm': ["if","do","fn","while","def","var","quote","quasiquote","unquote","splice","set","break"]
    \ , 'JanetFunction': $$FUNCTIONS$$
    \ , 'JanetMacro': $$MACROS$$
    \ }

function! s:syntax_keyword(dict)
    for key in keys(a:dict)
        execute 'syntax keyword' key join(a:dict[key], ' ')
    endfor
endfunction

call s:syntax_keyword(s:janet_syntax_keywords)

unlet! s:key
delfunction s:syntax_keyword

" Try symchars but handle old vim versions.
try
    let s:symcharnodig = '\!\$%\&\*\+\-./:<=>?@A-Z^_a-z|\x80-\U10FFFF'
    " Make sure we support large character ranges in this vim version.
    execute 'syntax match JanetSymbolDud "\v<%([' . s:symcharnodig . '])%([' . s:symchar . '])*>"'
catch
    let s:symcharnodig = '\!\$%\&\*\+\-./:<=>?@A-Z^_a-z'
endtry

" Janet special characters
syntax match JanetQuote "'"
syntax match JanetSplice ";"
syntax match JanetQuasiquote "\~"
syntax match JanetUnquote ","
syntax match JanetShortFn "|"

" Janet symbols
let s:symchar = '0-9' . s:symcharnodig
execute 'syntax match JanetSymbol "\v<%([' . s:symcharnodig . '])%([' . s:symchar . '])*>"'
execute 'syntax match JanetKeyword "\v<:%([' . s:symchar . '])*>"'
execute 'syntax match JanetQuoted "\v' . "'" . '<%([' . s:symcharnodig . '])%([' . s:symchar . '])*>"'
unlet! s:symchar s:symcharnodig

" Janet numbers
function! s:syntaxNumber(prefix, expo, digit)
  let l:digit = '[_' . a:digit . ']'
  execute 'syntax match JanetNumber "\v\c<[-+]?' . a:prefix . '%(' .
              \ l:digit . '+|' .
              \ l:digit . '+\.' . l:digit . '*|' .
              \ '\.' . l:digit . '+)%(' . a:expo . '[-+]?[' . a:digit . ']+)?>"'
endfunction
let s:radix_chars = "0123456789abcdefghijklmnopqrstuvwxyz"
for s:radix in range(2, 36)
    call s:syntaxNumber(s:radix . 'r', '\&', '[' . strpart(s:radix_chars, 0, s:radix) . ']')
endfor
call s:syntaxNumber('', '[&e]', '0123456789')
call s:syntaxNumber('0x', '\&', '0123456789abcdef')
unlet! s:radix_chars s:radix

" -*- TOP CLUSTER -*-
syntax cluster JanetTop contains=@Spell,JanetComment,JanetConstant,JanetQuoted,JanetKeyword,JanetSymbol,JanetNumber,JanetString,JanetBuffer,JanetTuple,JanetArray,JanetTable,JanetStruct,JanetSpecialForm,JanetBoolean,JanetFunction,JanetMacro

syntax region JanetTuple matchgroup=JanetParen start="("  end=")" contains=@JanetTop fold
syntax region JanetArray matchgroup=JanetParen start="@("  end=")" contains=@JanetTop fold
syntax region JanetTuple matchgroup=JanetParen start="\[" end="]" contains=@JanetTop fold
syntax region JanetArray matchgroup=JanetParen start="@\[" end="]" contains=@JanetTop fold
syntax region JanetTable matchgroup=JanetParen start="{"  end="}" contains=@JanetTop fold
syntax region JanetStruct matchgroup=JanetParen start="@{"  end="}" contains=@JanetTop fold

" Highlight superfluous closing parens, brackets and braces.
syntax match JanetError "]\|}\|)"

syntax sync fromstart

" Highlighting
hi def link JanetComment Comment
hi def link JanetSymbol Normal
hi def link JanetQuoted Identifier
hi def link JanetNumber Number
hi def link JanetConstant Constant
hi def link JanetBoolean Boolean
hi def link JanetKeyword Keyword
hi def link JanetSpecialForm Special
hi def link JanetFunction Function
hi def link JanetMacro Macro
hi def link JanetBuffer String
hi def link JanetString String
hi def link JanetStringDelimiter String
hi def link JanetStringEscape Character
hi def link JanetQuote SpecialChar
hi def link JanetSplice SpecialChar
hi def link JanetQuasiquote SpecialChar
hi def link JanetUnquote SpecialChar
hi def link JanetShortFn SpecialChar
hi def link JanetParen Delimiter
hi def link JanetError Error

let b:current_syntax = "janet"

let &cpo = s:cpo_sav
unlet! s:cpo_sav
`````)

(->> template
    (string/replace "$$FUNCTIONS$$" (string "[\"" (string/join functions "\",\"") "\"]"))
    (string/replace "$$MACROS$$" (string "[\"" (string/join macros "\",\"") "\"]"))
    (spit "syntax/janet.vim"))
