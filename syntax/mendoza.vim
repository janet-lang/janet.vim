" Mdz syntax file
" Language: MENDOZA
" Maintainer: Calvin Rose

if exists("b:current_syntax")
    finish
endif

syn include @janetTop syntax/janet.vim

syn match mendozaHead start="" end="---" contains=@janetTop

let s:cpo_sav = &cpo
set cpo&vim

let b:current_syntax = "mendoza"

let &cpo = s:cpo_sav
unlet! s:cpo_sav
