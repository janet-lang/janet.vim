" Vim syntax file
" Language: Janet
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

" Janet comments
syntax match JanetComment "#.*$" contains=JanetCommentTodo,@Spell

syntax match JanetStringEscape '\v\\%([ntvr0zfe"\\]|x[[0-9a-fA-F]]\{2}|u[[0-9a-fA-F]]\{4}|U[[0-9a-fA-F]]\{6})' contained
syntax region JanetString matchgroup=JanetStringDelimiter start=/"/ skip=/\\\\\|\\"/ end=/"/ contains=JanetStringEscape,@Spell
syntax region JanetBuffer matchgroup=JanetStringDelimiter start=/@"/ skip=/\\\\\|\\"/ end=/"/ contains=JanetStringEscape,@Spell
syntax region JanetString matchgroup=JanetStringDelimiter start="\z(`\+\)" end="\z1" contains=@Spell
syntax region JanetBuffer matchgroup=JanetStringDelimiter start="@\z(`\+\)" end="\z1" contains=@Spell

syntax keyword JanetConstant nil

syntax keyword JanetBoolean true
syntax keyword JanetBoolean false

" Janet special forms
syntax keyword JanetSpecialForm if
syntax keyword JanetSpecialForm do
syntax keyword JanetSpecialForm fn
syntax keyword JanetSpecialForm while
syntax keyword JanetSpecialForm def
syntax keyword JanetSpecialForm var
syntax keyword JanetSpecialForm quote
syntax keyword JanetSpecialForm quasiquote
syntax keyword JanetSpecialForm unquote
syntax keyword JanetSpecialForm splice
syntax keyword JanetSpecialForm set
syntax keyword JanetSpecialForm break

" Not really special forms, but useful to highlight
" All symbols from janet core.
syntax keyword JanetCoreValue %
syntax keyword JanetCoreValue %=
syntax keyword JanetCoreValue *
syntax keyword JanetCoreValue *=
syntax keyword JanetCoreValue +
syntax keyword JanetCoreValue ++
syntax keyword JanetCoreValue +=
syntax keyword JanetCoreValue -
syntax keyword JanetCoreValue --
syntax keyword JanetCoreValue -=
syntax keyword JanetCoreValue ->
syntax keyword JanetCoreValue ->>
syntax keyword JanetCoreValue -?>
syntax keyword JanetCoreValue -?>>
syntax keyword JanetCoreValue /
syntax keyword JanetCoreValue /=
syntax keyword JanetCoreValue <
syntax keyword JanetCoreValue <=
syntax keyword JanetCoreValue =
syntax keyword JanetCoreValue >
syntax keyword JanetCoreValue >=
syntax keyword JanetCoreValue abstract?
syntax keyword JanetCoreValue accumulate
syntax keyword JanetCoreValue accumulate2
syntax keyword JanetCoreValue all
syntax keyword JanetCoreValue all-bindings
syntax keyword JanetCoreValue all-dynamics
syntax keyword JanetCoreValue and
syntax keyword JanetCoreValue apply
syntax keyword JanetCoreValue array
syntax keyword JanetCoreValue array/concat
syntax keyword JanetCoreValue array/ensure
syntax keyword JanetCoreValue array/fill
syntax keyword JanetCoreValue array/insert
syntax keyword JanetCoreValue array/new
syntax keyword JanetCoreValue array/new-filled
syntax keyword JanetCoreValue array/peek
syntax keyword JanetCoreValue array/pop
syntax keyword JanetCoreValue array/push
syntax keyword JanetCoreValue array/remove
syntax keyword JanetCoreValue array/slice
syntax keyword JanetCoreValue array?
syntax keyword JanetCoreValue as->
syntax keyword JanetCoreValue as?->
syntax keyword JanetCoreValue asm
syntax keyword JanetCoreValue assert
syntax keyword JanetCoreValue bad-compile
syntax keyword JanetCoreValue bad-parse
syntax keyword JanetCoreValue band
syntax keyword JanetCoreValue blshift
syntax keyword JanetCoreValue bnot
syntax keyword JanetCoreValue boolean?
syntax keyword JanetCoreValue bor
syntax keyword JanetCoreValue brshift
syntax keyword JanetCoreValue brushift
syntax keyword JanetCoreValue buffer
syntax keyword JanetCoreValue buffer/bit
syntax keyword JanetCoreValue buffer/bit-clear
syntax keyword JanetCoreValue buffer/bit-set
syntax keyword JanetCoreValue buffer/bit-toggle
syntax keyword JanetCoreValue buffer/blit
syntax keyword JanetCoreValue buffer/clear
syntax keyword JanetCoreValue buffer/fill
syntax keyword JanetCoreValue buffer/format
syntax keyword JanetCoreValue buffer/new
syntax keyword JanetCoreValue buffer/new-filled
syntax keyword JanetCoreValue buffer/popn
syntax keyword JanetCoreValue buffer/push-byte
syntax keyword JanetCoreValue buffer/push-string
syntax keyword JanetCoreValue buffer/push-word
syntax keyword JanetCoreValue buffer/slice
syntax keyword JanetCoreValue buffer?
syntax keyword JanetCoreValue bxor
syntax keyword JanetCoreValue bytes?
syntax keyword JanetCoreValue case
syntax keyword JanetCoreValue cfunction?
syntax keyword JanetCoreValue chr
syntax keyword JanetCoreValue cli-main
syntax keyword JanetCoreValue comment
syntax keyword JanetCoreValue comp
syntax keyword JanetCoreValue compile
syntax keyword JanetCoreValue complement
syntax keyword JanetCoreValue comptime
syntax keyword JanetCoreValue cond
syntax keyword JanetCoreValue coro
syntax keyword JanetCoreValue count
syntax keyword JanetCoreValue debug
syntax keyword JanetCoreValue debug/arg-stack
syntax keyword JanetCoreValue debug/break
syntax keyword JanetCoreValue debug/fbreak
syntax keyword JanetCoreValue debug/lineage
syntax keyword JanetCoreValue debug/stack
syntax keyword JanetCoreValue debug/stacktrace
syntax keyword JanetCoreValue debug/step
syntax keyword JanetCoreValue debug/unbreak
syntax keyword JanetCoreValue debug/unfbreak
syntax keyword JanetCoreValue dec
syntax keyword JanetCoreValue deep-not=
syntax keyword JanetCoreValue deep=
syntax keyword JanetCoreValue def-
syntax keyword JanetCoreValue default
syntax keyword JanetCoreValue default-peg-grammar
syntax keyword JanetCoreValue defer
syntax keyword JanetCoreValue defglobal
syntax keyword JanetCoreValue defmacro
syntax keyword JanetCoreValue defmacro-
syntax keyword JanetCoreValue defn
syntax keyword JanetCoreValue defn-
syntax keyword JanetCoreValue describe
syntax keyword JanetCoreValue dictionary?
syntax keyword JanetCoreValue disasm
syntax keyword JanetCoreValue distinct
syntax keyword JanetCoreValue doc
syntax keyword JanetCoreValue doc*
syntax keyword JanetCoreValue doc-format
syntax keyword JanetCoreValue dofile
syntax keyword JanetCoreValue drop
syntax keyword JanetCoreValue drop-until
syntax keyword JanetCoreValue drop-while
syntax keyword JanetCoreValue dyn
syntax keyword JanetCoreValue each
syntax keyword JanetCoreValue eachk
syntax keyword JanetCoreValue eachp
syntax keyword JanetCoreValue eflush
syntax keyword JanetCoreValue empty?
syntax keyword JanetCoreValue env-lookup
syntax keyword JanetCoreValue eprin
syntax keyword JanetCoreValue eprinf
syntax keyword JanetCoreValue eprint
syntax keyword JanetCoreValue eprintf
syntax keyword JanetCoreValue error
syntax keyword JanetCoreValue eval
syntax keyword JanetCoreValue eval-string
syntax keyword JanetCoreValue even?
syntax keyword JanetCoreValue every?
syntax keyword JanetCoreValue extreme
syntax keyword JanetCoreValue false?
syntax keyword JanetCoreValue fiber/can-resume?
syntax keyword JanetCoreValue fiber/current
syntax keyword JanetCoreValue fiber/getenv
syntax keyword JanetCoreValue fiber/maxstack
syntax keyword JanetCoreValue fiber/new
syntax keyword JanetCoreValue fiber/setenv
syntax keyword JanetCoreValue fiber/setmaxstack
syntax keyword JanetCoreValue fiber/status
syntax keyword JanetCoreValue fiber?
syntax keyword JanetCoreValue file/close
syntax keyword JanetCoreValue file/flush
syntax keyword JanetCoreValue file/open
syntax keyword JanetCoreValue file/popen
syntax keyword JanetCoreValue file/read
syntax keyword JanetCoreValue file/seek
syntax keyword JanetCoreValue file/temp
syntax keyword JanetCoreValue file/write
syntax keyword JanetCoreValue filter
syntax keyword JanetCoreValue find
syntax keyword JanetCoreValue find-index
syntax keyword JanetCoreValue first
syntax keyword JanetCoreValue flatten
syntax keyword JanetCoreValue flatten-into
syntax keyword JanetCoreValue flush
syntax keyword JanetCoreValue for
syntax keyword JanetCoreValue freeze
syntax keyword JanetCoreValue frequencies
syntax keyword JanetCoreValue function?
syntax keyword JanetCoreValue gccollect
syntax keyword JanetCoreValue gcinterval
syntax keyword JanetCoreValue gcsetinterval
syntax keyword JanetCoreValue generate
syntax keyword JanetCoreValue gensym
syntax keyword JanetCoreValue get
syntax keyword JanetCoreValue get-in
syntax keyword JanetCoreValue getline
syntax keyword JanetCoreValue hash
syntax keyword JanetCoreValue idempotent?
syntax keyword JanetCoreValue identity
syntax keyword JanetCoreValue if-let
syntax keyword JanetCoreValue if-not
syntax keyword JanetCoreValue if-with
syntax keyword JanetCoreValue import
syntax keyword JanetCoreValue import*
syntax keyword JanetCoreValue in
syntax keyword JanetCoreValue inc
syntax keyword JanetCoreValue indexed?
syntax keyword JanetCoreValue int/s64
syntax keyword JanetCoreValue int/u64
syntax keyword JanetCoreValue int?
syntax keyword JanetCoreValue interleave
syntax keyword JanetCoreValue interpose
syntax keyword JanetCoreValue invert
syntax keyword JanetCoreValue janet/build
syntax keyword JanetCoreValue janet/config-bits
syntax keyword JanetCoreValue janet/version
syntax keyword JanetCoreValue juxt
syntax keyword JanetCoreValue juxt*
syntax keyword JanetCoreValue keep
syntax keyword JanetCoreValue keys
syntax keyword JanetCoreValue keyword
syntax keyword JanetCoreValue keyword?
syntax keyword JanetCoreValue kvs
syntax keyword JanetCoreValue label
syntax keyword JanetCoreValue last
syntax keyword JanetCoreValue length
syntax keyword JanetCoreValue let
syntax keyword JanetCoreValue load-image
syntax keyword JanetCoreValue load-image-dict
syntax keyword JanetCoreValue loop
syntax keyword JanetCoreValue macex
syntax keyword JanetCoreValue macex1
syntax keyword JanetCoreValue make-env
syntax keyword JanetCoreValue make-image
syntax keyword JanetCoreValue make-image-dict
syntax keyword JanetCoreValue map
syntax keyword JanetCoreValue mapcat
syntax keyword JanetCoreValue marshal
syntax keyword JanetCoreValue match
syntax keyword JanetCoreValue math/-inf
syntax keyword JanetCoreValue math/abs
syntax keyword JanetCoreValue math/acos
syntax keyword JanetCoreValue math/acosh
syntax keyword JanetCoreValue math/asin
syntax keyword JanetCoreValue math/asinh
syntax keyword JanetCoreValue math/atan
syntax keyword JanetCoreValue math/atan2
syntax keyword JanetCoreValue math/atanh
syntax keyword JanetCoreValue math/cbrt
syntax keyword JanetCoreValue math/ceil
syntax keyword JanetCoreValue math/cos
syntax keyword JanetCoreValue math/cosh
syntax keyword JanetCoreValue math/e
syntax keyword JanetCoreValue math/exp
syntax keyword JanetCoreValue math/exp2
syntax keyword JanetCoreValue math/expm1
syntax keyword JanetCoreValue math/floor
syntax keyword JanetCoreValue math/hypot
syntax keyword JanetCoreValue math/inf
syntax keyword JanetCoreValue math/log
syntax keyword JanetCoreValue math/log10
syntax keyword JanetCoreValue math/log2
syntax keyword JanetCoreValue math/pi
syntax keyword JanetCoreValue math/pow
syntax keyword JanetCoreValue math/random
syntax keyword JanetCoreValue math/rng
syntax keyword JanetCoreValue math/rng-buffer
syntax keyword JanetCoreValue math/rng-int
syntax keyword JanetCoreValue math/rng-uniform
syntax keyword JanetCoreValue math/round
syntax keyword JanetCoreValue math/seedrandom
syntax keyword JanetCoreValue math/sin
syntax keyword JanetCoreValue math/sinh
syntax keyword JanetCoreValue math/sqrt
syntax keyword JanetCoreValue math/tan
syntax keyword JanetCoreValue math/tanh
syntax keyword JanetCoreValue math/trunc
syntax keyword JanetCoreValue max
syntax keyword JanetCoreValue mean
syntax keyword JanetCoreValue merge
syntax keyword JanetCoreValue merge-into
syntax keyword JanetCoreValue min
syntax keyword JanetCoreValue mod
syntax keyword JanetCoreValue module/add-paths
syntax keyword JanetCoreValue module/cache
syntax keyword JanetCoreValue module/expand-path
syntax keyword JanetCoreValue module/find
syntax keyword JanetCoreValue module/loaders
syntax keyword JanetCoreValue module/loading
syntax keyword JanetCoreValue module/paths
syntax keyword JanetCoreValue nan?
syntax keyword JanetCoreValue nat?
syntax keyword JanetCoreValue native
syntax keyword JanetCoreValue neg?
syntax keyword JanetCoreValue next
syntax keyword JanetCoreValue nil?
syntax keyword JanetCoreValue not
syntax keyword JanetCoreValue not=
syntax keyword JanetCoreValue number?
syntax keyword JanetCoreValue odd?
syntax keyword JanetCoreValue one?
syntax keyword JanetCoreValue or
syntax keyword JanetCoreValue os/arch
syntax keyword JanetCoreValue os/cd
syntax keyword JanetCoreValue os/chmod
syntax keyword JanetCoreValue os/clock
syntax keyword JanetCoreValue os/cryptorand
syntax keyword JanetCoreValue os/cwd
syntax keyword JanetCoreValue os/date
syntax keyword JanetCoreValue os/dir
syntax keyword JanetCoreValue os/environ
syntax keyword JanetCoreValue os/execute
syntax keyword JanetCoreValue os/exit
syntax keyword JanetCoreValue os/getenv
syntax keyword JanetCoreValue os/link
syntax keyword JanetCoreValue os/lstat
syntax keyword JanetCoreValue os/mkdir
syntax keyword JanetCoreValue os/mktime
syntax keyword JanetCoreValue os/readlink
syntax keyword JanetCoreValue os/realpath
syntax keyword JanetCoreValue os/rename
syntax keyword JanetCoreValue os/rm
syntax keyword JanetCoreValue os/rmdir
syntax keyword JanetCoreValue os/setenv
syntax keyword JanetCoreValue os/shell
syntax keyword JanetCoreValue os/sleep
syntax keyword JanetCoreValue os/stat
syntax keyword JanetCoreValue os/symlink
syntax keyword JanetCoreValue os/time
syntax keyword JanetCoreValue os/touch
syntax keyword JanetCoreValue os/which
syntax keyword JanetCoreValue pairs
syntax keyword JanetCoreValue parser/byte
syntax keyword JanetCoreValue parser/clone
syntax keyword JanetCoreValue parser/consume
syntax keyword JanetCoreValue parser/eof
syntax keyword JanetCoreValue parser/error
syntax keyword JanetCoreValue parser/flush
syntax keyword JanetCoreValue parser/has-more
syntax keyword JanetCoreValue parser/insert
syntax keyword JanetCoreValue parser/new
syntax keyword JanetCoreValue parser/produce
syntax keyword JanetCoreValue parser/state
syntax keyword JanetCoreValue parser/status
syntax keyword JanetCoreValue parser/where
syntax keyword JanetCoreValue partial
syntax keyword JanetCoreValue partition
syntax keyword JanetCoreValue peg/compile
syntax keyword JanetCoreValue peg/match
syntax keyword JanetCoreValue pos?
syntax keyword JanetCoreValue postwalk
syntax keyword JanetCoreValue pp
syntax keyword JanetCoreValue prewalk
syntax keyword JanetCoreValue prin
syntax keyword JanetCoreValue prinf
syntax keyword JanetCoreValue print
syntax keyword JanetCoreValue printf
syntax keyword JanetCoreValue product
syntax keyword JanetCoreValue prompt
syntax keyword JanetCoreValue propagate
syntax keyword JanetCoreValue protect
syntax keyword JanetCoreValue put
syntax keyword JanetCoreValue put-in
syntax keyword JanetCoreValue quit
syntax keyword JanetCoreValue range
syntax keyword JanetCoreValue reduce
syntax keyword JanetCoreValue reduce2
syntax keyword JanetCoreValue repl
syntax keyword JanetCoreValue require
syntax keyword JanetCoreValue resume
syntax keyword JanetCoreValue return
syntax keyword JanetCoreValue reverse
syntax keyword JanetCoreValue root-env
syntax keyword JanetCoreValue run-context
syntax keyword JanetCoreValue scan-number
syntax keyword JanetCoreValue seq
syntax keyword JanetCoreValue setdyn
syntax keyword JanetCoreValue short-fn
syntax keyword JanetCoreValue signal
syntax keyword JanetCoreValue slice
syntax keyword JanetCoreValue slurp
syntax keyword JanetCoreValue some
syntax keyword JanetCoreValue sort
syntax keyword JanetCoreValue sorted
syntax keyword JanetCoreValue spit
syntax keyword JanetCoreValue stderr
syntax keyword JanetCoreValue stdin
syntax keyword JanetCoreValue stdout
syntax keyword JanetCoreValue string
syntax keyword JanetCoreValue string/ascii-lower
syntax keyword JanetCoreValue string/ascii-upper
syntax keyword JanetCoreValue string/bytes
syntax keyword JanetCoreValue string/check-set
syntax keyword JanetCoreValue string/find
syntax keyword JanetCoreValue string/find-all
syntax keyword JanetCoreValue string/format
syntax keyword JanetCoreValue string/from-bytes
syntax keyword JanetCoreValue string/has-prefix?
syntax keyword JanetCoreValue string/has-suffix?
syntax keyword JanetCoreValue string/join
syntax keyword JanetCoreValue string/repeat
syntax keyword JanetCoreValue string/replace
syntax keyword JanetCoreValue string/replace-all
syntax keyword JanetCoreValue string/reverse
syntax keyword JanetCoreValue string/slice
syntax keyword JanetCoreValue string/split
syntax keyword JanetCoreValue string/trim
syntax keyword JanetCoreValue string/triml
syntax keyword JanetCoreValue string/trimr
syntax keyword JanetCoreValue string?
syntax keyword JanetCoreValue struct
syntax keyword JanetCoreValue struct?
syntax keyword JanetCoreValue sum
syntax keyword JanetCoreValue symbol
syntax keyword JanetCoreValue symbol?
syntax keyword JanetCoreValue table
syntax keyword JanetCoreValue table/clone
syntax keyword JanetCoreValue table/getproto
syntax keyword JanetCoreValue table/new
syntax keyword JanetCoreValue table/rawget
syntax keyword JanetCoreValue table/setproto
syntax keyword JanetCoreValue table/to-struct
syntax keyword JanetCoreValue table?
syntax keyword JanetCoreValue take
syntax keyword JanetCoreValue take-until
syntax keyword JanetCoreValue take-while
syntax keyword JanetCoreValue tarray/buffer
syntax keyword JanetCoreValue tarray/copy-bytes
syntax keyword JanetCoreValue tarray/length
syntax keyword JanetCoreValue tarray/new
syntax keyword JanetCoreValue tarray/properties
syntax keyword JanetCoreValue tarray/slice
syntax keyword JanetCoreValue tarray/swap-bytes
syntax keyword JanetCoreValue thread/close
syntax keyword JanetCoreValue thread/current
syntax keyword JanetCoreValue thread/new
syntax keyword JanetCoreValue thread/receive
syntax keyword JanetCoreValue thread/send
syntax keyword JanetCoreValue trace
syntax keyword JanetCoreValue true?
syntax keyword JanetCoreValue truthy?
syntax keyword JanetCoreValue try
syntax keyword JanetCoreValue tuple
syntax keyword JanetCoreValue tuple/brackets
syntax keyword JanetCoreValue tuple/setmap
syntax keyword JanetCoreValue tuple/slice
syntax keyword JanetCoreValue tuple/sourcemap
syntax keyword JanetCoreValue tuple/type
syntax keyword JanetCoreValue tuple?
syntax keyword JanetCoreValue type
syntax keyword JanetCoreValue unless
syntax keyword JanetCoreValue unmarshal
syntax keyword JanetCoreValue untrace
syntax keyword JanetCoreValue update
syntax keyword JanetCoreValue update-in
syntax keyword JanetCoreValue use
syntax keyword JanetCoreValue values
syntax keyword JanetCoreValue var-
syntax keyword JanetCoreValue varfn
syntax keyword JanetCoreValue varglobal
syntax keyword JanetCoreValue walk
syntax keyword JanetCoreValue when
syntax keyword JanetCoreValue when-let
syntax keyword JanetCoreValue when-with
syntax keyword JanetCoreValue with
syntax keyword JanetCoreValue with-dyns
syntax keyword JanetCoreValue with-syms
syntax keyword JanetCoreValue with-vars
syntax keyword JanetCoreValue yield
syntax keyword JanetCoreValue zero?
syntax keyword JanetCoreValue zipcoll

" Try symchars but handle old vim versions.
try
    let s:symcharnodig = '\!\$%\&\*\+\-./:<=>?@A-Z^_a-z|\x80-\U10FFFF'
    " Make sure we support large character ranges in this vim version.
    execute 'syntax match JanetSymbolDud "\v<%([' . s:symcharnodig . '])%([' . s:symchar . '])*>"'
catch
    let s:symcharnodig = '\!\$%\&\*\+\-./:<=>?@A-Z^_a-z'
endtry

" Janet Symbols
let s:symchar = '0-9' . s:symcharnodig
execute 'syntax match JanetSymbol "\v<%([' . s:symcharnodig . '])%([' . s:symchar . '])*>"'
execute 'syntax match JanetKeyword "\v<:%([' . s:symchar . '])*>"'
unlet! s:symchar s:symcharnodig

syntax match JanetQuote "'"

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
