" Vim syntax file
" Language: DST
" Maintainer: Calvin Rose

if exists("b:current_syntax")
    finish
endif

let s:cpo_sav = &cpo
set cpo&vim

if has("folding") && exists("g:dst_fold") && g:dst_fold > 0
    setlocal foldmethod=syntax
endif

syntax keyword DstCommentTodo contained FIXME XXX TODO FIXME: XXX: TODO:

" DST comments
syn match DstComment "#.*$" contains=DstCommentTodo,@Spell

syntax match DstStringEscape '\v\\%([ntr0zfe"\\]|h[[0-9a-fA-F]]\{2})' contained
syntax region DstString matchgroup=DstStringDelimiter start=/"/ skip=/\\\\\|\\"/ end=/"/ contains=DstStringEscape,@Spell
syntax region DstBuffer matchgroup=DstStringDelimiter start=/@"/ skip=/\\\\\|\\"/ end=/"/ contains=DstStringEscape,@Spell
syntax region DstString matchgroup=DstStringDelimiter start="\z(`\+\)" end="\z1" contains=@Spell
syntax region DstBuffer matchgroup=DstStringDelimiter start="@\z(`\+\)" end="\z1" contains=@Spell

syn keyword DstConstant nil 

syn keyword DstBoolean true 
syn keyword DstBoolean false

syn keyword DstSpecialForm if
syn keyword DstSpecialForm do
syn keyword DstSpecialForm fn
syn keyword DstSpecialForm while
syn keyword DstSpecialForm def
syn keyword DstSpecialForm var
syn keyword DstSpecialForm quote

" Dst Symbols
let s:symcharnodig = '\!\$%\&\*\+\-./:<=>?@A-Z^_a-z~|\x80-\U10FFFF'
let s:symchar = '0-9' . s:symcharnodig
execute 'syn match DstSymbol "\v<%([' . s:symcharnodig . '])%([' . s:symchar . '])*>"'
execute 'syn match DstKeyword "\v<:%([' . s:symchar . '])*>"'
unlet! s:symchar s:symcharnodig

syn match DstQuote "'"

" DST numbers
function! s:syntaxNumber(prefix, expo, digit)
  let l:digit = '[_' . a:digit . ']'
  execute 'syntax match DstNumber "\v\c<[-+]?' . a:prefix . '%(' .
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
syntax cluster DstTop contains=@Spell,DstComment,DstConstant,DstQuote,DstKeyword,DstSymbol,DstNumber,DstString,DstBuffer,DstTuple,DstArray,DstTable,DstStruct,DstSpecialForm,DstBoolean

syntax region DstTuple matchgroup=DstParen start="("  end=")" contains=@DstTop fold
syntax region DstArray matchgroup=DstParen start="@("  end=")" contains=@DstTop fold
syntax region DstTuple matchgroup=DstParen start="\[" end="]" contains=@DstTop fold
syntax region DstArray matchgroup=DstParen start="@\[" end="]" contains=@DstTop fold
syntax region DstTable matchgroup=DstParen start="{"  end="}" contains=@DstTop fold
syntax region DstStruct matchgroup=DstParen start="@{"  end="}" contains=@DstTop fold

" Highlight superfluous closing parens, brackets and braces.
syntax match DstError "]\|}\|)"

syntax sync fromstart

" Highlighting
hi def link DstComment Comment
hi def link DstSymbol Identifier
hi def link DstNumber Number
hi def link DstConstant Constant
hi def link DstKeyword Keyword
hi def link DstSpecialForm Special
hi def link DstString String
hi def link DstBuffer String
hi def link DstStringDelimiter String
hi def link DstBoolean Boolean

hi def link DstQuote SpecialChar
hi def link DstParen Delimiter

let b:current_syntax = "dst"

let &cpo = s:cpo_sav
unlet! s:cpo_sav
