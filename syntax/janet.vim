" Vim syntax file
" Language: JANET
" Maintainer: Calvin Rose

if exists("b:current_syntax")
    finish
endif

let s:cpo_sav = &cpo
set cpo&vim

if has("folding") && exists("g:janet_fold") && g:janet_fold > 0
    setlocal foldmethod=syntax
endif

syntax keyword JanetCommentTodo contained FIXME XXX TODO FIXME: XXX: TODO:

" JANET comments
syn match JanetComment "#.*$" contains=JanetCommentTodo,@Spell

syntax match JanetStringEscape '\v\\%([ntr0zfe"\\]|h[[0-9a-fA-F]]\{2})' contained
syntax region JanetString matchgroup=JanetStringDelimiter start=/"/ skip=/\\\\\|\\"/ end=/"/ contains=JanetStringEscape,@Spell
syntax region JanetBuffer matchgroup=JanetStringDelimiter start=/@"/ skip=/\\\\\|\\"/ end=/"/ contains=JanetStringEscape,@Spell
syntax region JanetString matchgroup=JanetStringDelimiter start="\z(`\+\)" end="\z1" contains=@Spell
syntax region JanetBuffer matchgroup=JanetStringDelimiter start="@\z(`\+\)" end="\z1" contains=@Spell

syn keyword JanetConstant nil 

syn keyword JanetBoolean true 
syn keyword JanetBoolean false

" Janet special forms
syn keyword JanetSpecialForm if
syn keyword JanetSpecialForm do
syn keyword JanetSpecialForm fn
syn keyword JanetSpecialForm while
syn keyword JanetSpecialForm def
syn keyword JanetSpecialForm var
syn keyword JanetSpecialForm quote

" Not really special forms, but useful to highlight
" All symbols from janet core.
syn keyword JanetCoreValue %
syn keyword JanetCoreValue %=
syn keyword JanetCoreValue &
syn keyword JanetCoreValue &=
syn keyword JanetCoreValue *
syn keyword JanetCoreValue *=
syn keyword JanetCoreValue *doc-width*
syn keyword JanetCoreValue *env*
syn keyword JanetCoreValue +
syn keyword JanetCoreValue ++
syn keyword JanetCoreValue +=
syn keyword JanetCoreValue -
syn keyword JanetCoreValue --
syn keyword JanetCoreValue -=
syn keyword JanetCoreValue ->
syn keyword JanetCoreValue ->>
syn keyword JanetCoreValue /
syn keyword JanetCoreValue /=
syn keyword JanetCoreValue <
syn keyword JanetCoreValue <<
syn keyword JanetCoreValue <<=
syn keyword JanetCoreValue <=
syn keyword JanetCoreValue =
syn keyword JanetCoreValue ==
syn keyword JanetCoreValue >
syn keyword JanetCoreValue >=
syn keyword JanetCoreValue >>
syn keyword JanetCoreValue >>=
syn keyword JanetCoreValue >>>
syn keyword JanetCoreValue >>>=
syn keyword JanetCoreValue ^
syn keyword JanetCoreValue ^=
syn keyword JanetCoreValue _env
syn keyword JanetCoreValue abstract?
syn keyword JanetCoreValue all
syn keyword JanetCoreValue all-symbols
syn keyword JanetCoreValue and
syn keyword JanetCoreValue apply
syn keyword JanetCoreValue array
syn keyword JanetCoreValue array.concat
syn keyword JanetCoreValue array.ensure
syn keyword JanetCoreValue array.insert
syn keyword JanetCoreValue array.new
syn keyword JanetCoreValue array.peek
syn keyword JanetCoreValue array.pop
syn keyword JanetCoreValue array.push
syn keyword JanetCoreValue array.slice
syn keyword JanetCoreValue array?
syn keyword JanetCoreValue asm
syn keyword JanetCoreValue atomic?
syn keyword JanetCoreValue boolean?
syn keyword JanetCoreValue buffer
syn keyword JanetCoreValue buffer.clear
syn keyword JanetCoreValue buffer.new
syn keyword JanetCoreValue buffer.popn
syn keyword JanetCoreValue buffer.push-byte
syn keyword JanetCoreValue buffer.push-integer
syn keyword JanetCoreValue buffer.push-string
syn keyword JanetCoreValue buffer.slice
syn keyword JanetCoreValue buffer?
syn keyword JanetCoreValue bytes?
syn keyword JanetCoreValue callable?
syn keyword JanetCoreValue case
syn keyword JanetCoreValue cfunction?
syn keyword JanetCoreValue comment
syn keyword JanetCoreValue comp
syn keyword JanetCoreValue compile
syn keyword JanetCoreValue complement
syn keyword JanetCoreValue cond
syn keyword JanetCoreValue coro
syn keyword JanetCoreValue debug
syn keyword JanetCoreValue dec
syn keyword JanetCoreValue deep-not=
syn keyword JanetCoreValue deep=
syn keyword JanetCoreValue def-
syn keyword JanetCoreValue default
syn keyword JanetCoreValue default-error-handler
syn keyword JanetCoreValue defglobal
syn keyword JanetCoreValue defmacro
syn keyword JanetCoreValue defmacro-
syn keyword JanetCoreValue defn
syn keyword JanetCoreValue defn-
syn keyword JanetCoreValue describe
syn keyword JanetCoreValue dictionary?
syn keyword JanetCoreValue disasm
syn keyword JanetCoreValue distinct
syn keyword JanetCoreValue doc
syn keyword JanetCoreValue doc*
syn keyword JanetCoreValue doc-format
syn keyword JanetCoreValue drop-until
syn keyword JanetCoreValue drop-while
syn keyword JanetCoreValue each
syn keyword JanetCoreValue empty?
syn keyword JanetCoreValue env-lookup
syn keyword JanetCoreValue error
syn keyword JanetCoreValue eval
syn keyword JanetCoreValue even?
syn keyword JanetCoreValue every?
syn keyword JanetCoreValue extreme
syn keyword JanetCoreValue false?
syn keyword JanetCoreValue fiber.current
syn keyword JanetCoreValue fiber.lineage
syn keyword JanetCoreValue fiber.maxstack
syn keyword JanetCoreValue fiber.new
syn keyword JanetCoreValue fiber.setmaxstack
syn keyword JanetCoreValue fiber.stack
syn keyword JanetCoreValue fiber.status
syn keyword JanetCoreValue fiber?
syn keyword JanetCoreValue file.close
syn keyword JanetCoreValue file.flush
syn keyword JanetCoreValue file.open
syn keyword JanetCoreValue file.popen
syn keyword JanetCoreValue file.read
syn keyword JanetCoreValue file.seek
syn keyword JanetCoreValue file.write
syn keyword JanetCoreValue filter
syn keyword JanetCoreValue find
syn keyword JanetCoreValue find-index
syn keyword JanetCoreValue first
syn keyword JanetCoreValue flatten
syn keyword JanetCoreValue flatten-into
syn keyword JanetCoreValue for
syn keyword JanetCoreValue frequencies
syn keyword JanetCoreValue function?
syn keyword JanetCoreValue gccollect
syn keyword JanetCoreValue gcinterval
syn keyword JanetCoreValue gcsetinterval
syn keyword JanetCoreValue generate
syn keyword JanetCoreValue gensym
syn keyword JanetCoreValue get
syn keyword JanetCoreValue getline
syn keyword JanetCoreValue hash
syn keyword JanetCoreValue identity
syn keyword JanetCoreValue if-let
syn keyword JanetCoreValue if-not
syn keyword JanetCoreValue import
syn keyword JanetCoreValue import*
syn keyword JanetCoreValue inc
syn keyword JanetCoreValue indexed?
syn keyword JanetCoreValue int
syn keyword JanetCoreValue integer?
syn keyword JanetCoreValue interleave
syn keyword JanetCoreValue interpose
syn keyword JanetCoreValue invert
syn keyword JanetCoreValue janet.version
syn keyword JanetCoreValue juxt
syn keyword JanetCoreValue juxt*
syn keyword JanetCoreValue keep
syn keyword JanetCoreValue keys
syn keyword JanetCoreValue keyword?
syn keyword JanetCoreValue kvs
syn keyword JanetCoreValue last
syn keyword JanetCoreValue length
syn keyword JanetCoreValue let
syn keyword JanetCoreValue loop
syn keyword JanetCoreValue macex
syn keyword JanetCoreValue macex1
syn keyword JanetCoreValue make-env
syn keyword JanetCoreValue map
syn keyword JanetCoreValue mapcat
syn keyword JanetCoreValue marshal
syn keyword JanetCoreValue math.acos
syn keyword JanetCoreValue math.asin
syn keyword JanetCoreValue math.atan
syn keyword JanetCoreValue math.ceil
syn keyword JanetCoreValue math.cos
syn keyword JanetCoreValue math.e
syn keyword JanetCoreValue math.exp
syn keyword JanetCoreValue math.floor
syn keyword JanetCoreValue math.inf
syn keyword JanetCoreValue math.log
syn keyword JanetCoreValue math.log10
syn keyword JanetCoreValue math.pi
syn keyword JanetCoreValue math.pow
syn keyword JanetCoreValue math.random
syn keyword JanetCoreValue math.seedrandom
syn keyword JanetCoreValue math.sin
syn keyword JanetCoreValue math.sqrt
syn keyword JanetCoreValue math.tan
syn keyword JanetCoreValue max
syn keyword JanetCoreValue max-order
syn keyword JanetCoreValue merge
syn keyword JanetCoreValue merge-into
syn keyword JanetCoreValue min
syn keyword JanetCoreValue min-order
syn keyword JanetCoreValue module.find
syn keyword JanetCoreValue module.native-paths
syn keyword JanetCoreValue module.paths
syn keyword JanetCoreValue native
syn keyword JanetCoreValue neg?
syn keyword JanetCoreValue next
syn keyword JanetCoreValue nil?
syn keyword JanetCoreValue not
syn keyword JanetCoreValue not=
syn keyword JanetCoreValue not==
syn keyword JanetCoreValue number?
syn keyword JanetCoreValue odd?
syn keyword JanetCoreValue one?
syn keyword JanetCoreValue or
syn keyword JanetCoreValue order<
syn keyword JanetCoreValue order<=
syn keyword JanetCoreValue order>
syn keyword JanetCoreValue order>=
syn keyword JanetCoreValue os.clock
syn keyword JanetCoreValue os.cwd
syn keyword JanetCoreValue os.execute
syn keyword JanetCoreValue os.exit
syn keyword JanetCoreValue os.getenv
syn keyword JanetCoreValue os.setenv
syn keyword JanetCoreValue os.shell
syn keyword JanetCoreValue os.sleep
syn keyword JanetCoreValue os.time
syn keyword JanetCoreValue os.which
syn keyword JanetCoreValue pairs
syn keyword JanetCoreValue parser.byte
syn keyword JanetCoreValue parser.consume
syn keyword JanetCoreValue parser.error
syn keyword JanetCoreValue parser.flush
syn keyword JanetCoreValue parser.new
syn keyword JanetCoreValue parser.produce
syn keyword JanetCoreValue parser.state
syn keyword JanetCoreValue parser.status
syn keyword JanetCoreValue parser.where
syn keyword JanetCoreValue partial
syn keyword JanetCoreValue pos?
syn keyword JanetCoreValue print
syn keyword JanetCoreValue process.args
syn keyword JanetCoreValue product
syn keyword JanetCoreValue put
syn keyword JanetCoreValue qq
syn keyword JanetCoreValue range
syn keyword JanetCoreValue real
syn keyword JanetCoreValue real?
syn keyword JanetCoreValue reduce
syn keyword JanetCoreValue repl
syn keyword JanetCoreValue require
syn keyword JanetCoreValue resume
syn keyword JanetCoreValue reverse
syn keyword JanetCoreValue run-context
syn keyword JanetCoreValue scan-integer
syn keyword JanetCoreValue scan-number
syn keyword JanetCoreValue scan-real
syn keyword JanetCoreValue seq
syn keyword JanetCoreValue some
syn keyword JanetCoreValue sort
syn keyword JanetCoreValue sorted
syn keyword JanetCoreValue stderr
syn keyword JanetCoreValue stdin
syn keyword JanetCoreValue stdout
syn keyword JanetCoreValue string
syn keyword JanetCoreValue string.ascii-lower
syn keyword JanetCoreValue string.ascii-upper
syn keyword JanetCoreValue string.bytes
syn keyword JanetCoreValue string.check-set
syn keyword JanetCoreValue string.find
syn keyword JanetCoreValue string.find-all
syn keyword JanetCoreValue string.from-bytes
syn keyword JanetCoreValue string.join
syn keyword JanetCoreValue string.number
syn keyword JanetCoreValue string.pretty
syn keyword JanetCoreValue string.repeat
syn keyword JanetCoreValue string.replace
syn keyword JanetCoreValue string.replace-all
syn keyword JanetCoreValue string.reverse
syn keyword JanetCoreValue string.slice
syn keyword JanetCoreValue string.split
syn keyword JanetCoreValue string?
syn keyword JanetCoreValue struct
syn keyword JanetCoreValue struct?
syn keyword JanetCoreValue sum
syn keyword JanetCoreValue symbol
syn keyword JanetCoreValue symbol?
syn keyword JanetCoreValue table
syn keyword JanetCoreValue table.getproto
syn keyword JanetCoreValue table.new
syn keyword JanetCoreValue table.rawget
syn keyword JanetCoreValue table.setproto
syn keyword JanetCoreValue table.to-struct
syn keyword JanetCoreValue table?
syn keyword JanetCoreValue take-until
syn keyword JanetCoreValue take-while
syn keyword JanetCoreValue true?
syn keyword JanetCoreValue tuple
syn keyword JanetCoreValue tuple.append
syn keyword JanetCoreValue tuple.prepend
syn keyword JanetCoreValue tuple.slice
syn keyword JanetCoreValue tuple?
syn keyword JanetCoreValue type
syn keyword JanetCoreValue unless
syn keyword JanetCoreValue unmarshal
syn keyword JanetCoreValue update
syn keyword JanetCoreValue values
syn keyword JanetCoreValue varglobal
syn keyword JanetCoreValue when
syn keyword JanetCoreValue when-let
syn keyword JanetCoreValue yield
syn keyword JanetCoreValue zero?
syn keyword JanetCoreValue zipcoll
syn keyword JanetCoreValue \|
syn keyword JanetCoreValue \|=
syn keyword JanetCoreValue ~

" Janet Symbols
let s:symcharnodig = '\!\$%\&\*\+\-./:<=>?@A-Z^_a-z~|\x80-\U10FFFF'
let s:symchar = '0-9' . s:symcharnodig
execute 'syn match JanetSymbol "\v<%([' . s:symcharnodig . '])%([' . s:symchar . '])*>"'
execute 'syn match JanetKeyword "\v<:%([' . s:symchar . '])*>"'
unlet! s:symchar s:symcharnodig

syn match JanetQuote "'"

" JANET numbers
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
syntax cluster JanetTop contains=@Spell,JanetComment,JanetConstant,JanetQuote,JanetKeyword,JanetSymbol,JanetNumber,JanetString,JanetBuffer,JanetTuple,JanetArray,JanetTable,JanetStruct,JanetSpecialForm,JanetBoolean,JanetCoreValue

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
hi def link JanetSymbol Identifier
hi def link JanetNumber Number
hi def link JanetConstant Constant
hi def link JanetKeyword Keyword
hi def link JanetSpecialForm Special
hi def link JanetCoreValue Special
hi def link JanetString String
hi def link JanetBuffer String
hi def link JanetStringDelimiter String
hi def link JanetBoolean Boolean

hi def link JanetQuote SpecialChar
hi def link JanetParen Delimiter

let b:current_syntax = "janet"

let &cpo = s:cpo_sav
unlet! s:cpo_sav
