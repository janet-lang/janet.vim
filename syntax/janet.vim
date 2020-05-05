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
    \ , 'JanetFunction': ["%","*","+","-","/","<","<=","=",">",">=","abstract?","accumulate","accumulate2","all","all-bindings","all-dynamics","apply","array","array/concat","array/ensure","array/fill","array/insert","array/new","array/new-filled","array/peek","array/pop","array/push","array/remove","array/slice","array?","asm","assert","bad-compile","bad-parse","band","blshift","bnot","boolean?","bor","brshift","brushift","buffer","buffer/bit","buffer/bit-clear","buffer/bit-set","buffer/bit-toggle","buffer/blit","buffer/clear","buffer/fill","buffer/format","buffer/new","buffer/new-filled","buffer/popn","buffer/push-byte","buffer/push-string","buffer/push-word","buffer/slice","buffer?","bxor","bytes?","cfunction?","cli-main","comp","compile","complement","count","debug","debug/arg-stack","debug/break","debug/fbreak","debug/lineage","debug/stack","debug/stacktrace","debug/step","debug/unbreak","debug/unfbreak","debugger-env","dec","deep-not=","deep=","default-peg-grammar","defglobal","describe","dictionary?","disasm","distinct","doc*","doc-format","dofile","drop","drop-until","drop-while","dyn","eflush","empty?","env-lookup","eprin","eprinf","eprint","eprintf","error","eval","eval-string","even?","every?","extreme","false?","fiber/can-resume?","fiber/current","fiber/getenv","fiber/maxstack","fiber/new","fiber/root","fiber/setenv","fiber/setmaxstack","fiber/status","fiber?","file/close","file/flush","file/open","file/popen","file/read","file/seek","file/temp","file/write","filter","find","find-index","first","flatten","flatten-into","flush","freeze","frequencies","function?","gccollect","gcinterval","gcsetinterval","gensym","get","get-in","getline","hash","idempotent?","identity","import*","in","inc","indexed?","int/s64","int/u64","int?","interleave","interpose","invert","janet/build","janet/config-bits","janet/version","juxt*","keep","keys","keyword","keyword?","kvs","last","length","load-image","load-image-dict","macex","macex1","make-env","make-image","make-image-dict","map","mapcat","marshal","math/-inf","math/abs","math/acos","math/acosh","math/asin","math/asinh","math/atan","math/atan2","math/atanh","math/cbrt","math/ceil","math/cos","math/cosh","math/e","math/erf","math/erfc","math/exp","math/exp2","math/expm1","math/floor","math/gamma","math/hypot","math/inf","math/log","math/log10","math/log1p","math/log2","math/next","math/pi","math/pow","math/random","math/rng","math/rng-buffer","math/rng-int","math/rng-uniform","math/round","math/seedrandom","math/sin","math/sinh","math/sqrt","math/tan","math/tanh","math/trunc","max","mean","merge","merge-into","min","mod","module/add-paths","module/cache","module/expand-path","module/find","module/loaders","module/loading","module/paths","nan?","nat?","native","neg?","net/chunk","net/close","net/connect","net/read","net/server","net/write","next","nil?","not","not=","number?","odd?","one?","os/arch","os/cd","os/chmod","os/clock","os/cryptorand","os/cwd","os/date","os/dir","os/environ","os/execute","os/exit","os/getenv","os/link","os/lstat","os/mkdir","os/mktime","os/perm-int","os/perm-string","os/readlink","os/realpath","os/rename","os/rm","os/rmdir","os/setenv","os/shell","os/sleep","os/stat","os/symlink","os/time","os/touch","os/umask","os/which","pairs","parse","parser/byte","parser/clone","parser/consume","parser/eof","parser/error","parser/flush","parser/has-more","parser/insert","parser/new","parser/produce","parser/state","parser/status","parser/where","partial","partition","peg/compile","peg/match","pos?","postwalk","pp","prewalk","prin","prinf","print","printf","product","propagate","put","put-in","quit","range","reduce","reduce2","repl","require","resume","return","reverse","root-env","run-context","scan-number","setdyn","signal","slice","slurp","some","sort","sort-by","sorted","sorted-by","spit","stderr","stdin","stdout","string","string/ascii-lower","string/ascii-upper","string/bytes","string/check-set","string/find","string/find-all","string/format","string/from-bytes","string/has-prefix?","string/has-suffix?","string/join","string/repeat","string/replace","string/replace-all","string/reverse","string/slice","string/split","string/trim","string/triml","string/trimr","string?","struct","struct?","sum","symbol","symbol?","table","table/clone","table/getproto","table/new","table/rawget","table/setproto","table/to-struct","table?","take","take-until","take-while","tarray/buffer","tarray/copy-bytes","tarray/length","tarray/new","tarray/properties","tarray/slice","tarray/swap-bytes","thread/close","thread/current","thread/new","thread/receive","thread/send","trace","true?","truthy?","tuple","tuple/brackets","tuple/setmap","tuple/slice","tuple/sourcemap","tuple/type","tuple?","type","unmarshal","untrace","update","update-in","values","varglobal","walk","yield","zero?","zipcoll"]
    \ , 'JanetMacro': ["%=","*=","++","+=","--","-=","->","->>","-?>","-?>>","/=","and","as->","as?->","case","chr","comment","comptime","cond","coro","def-","default","defer","defmacro","defmacro-","defn","defn-","doc","each","eachk","eachp","edefer","for","generate","if-let","if-not","if-with","import","juxt","label","let","loop","match","or","prompt","protect","seq","short-fn","try","unless","use","var-","varfn","when","when-let","when-with","with","with-dyns","with-syms","with-vars"]
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

let b:current_syntax = "janet"

let &cpo = s:cpo_sav
unlet! s:cpo_sav