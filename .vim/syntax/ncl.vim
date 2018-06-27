" Vim syntax file
" Language: NCL
" Author: Kevin Mueller

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case ignore

" ncl keywords
syn keyword nclStatement    begin end break continue stop
syn keyword nclStatement    return load
syn keyword nclStatement    defaultapp external graphic local 
syn keyword nclStatement    load create new noparent quit Quit QUIT
syn keyword nclRepeat       do while
syn keyword nclConditional  if else then
syn keyword nclStatement    procedure function getvalues setvalues nextgroup=nclFunction skipwhite
syn match   nclFunction "[a-zA-Z_][a-zA-Z0-9_]*" contained

syn keyword nclType byte character double float logical integer
syn keyword nclType long numeric record file short string

" ncl numbers (ripped off from  fortran.vim)
syn match nclNumber display "\<\d\+\(_\a\w*\)\=\>"
syn match nclNumber display "\<\d\+[deq][-+]\=\d\+\(_\a\w*\)\=\>"
syn match nclNumber display "\.\d\+\([deq][-+]\=\d\+\)\=\(_\a\w*\)\=\>"
syn match nclNumber display "\<\d\+\.\([deq][-+]\=\d\+\)\=\(_\a\w*\)\=\>"
syn match nclNumber display "\<\d\+\.\d\+\([dq][-+]\=\d\+\)\=\(_\a\w*\)\=\>"
syn match nclNumber display "\<\d\+\.\d\+\(e[-+]\=\d\+\)\=\(_\a\w*\)\=\>"


syn match nclBoolean    "\.\s*\(True\|False\)\s*\."

" pattern matching for comments
syn match   nclComment  "^\ *;.*$"
syn match   nclComment    ";.*"

" pattern matching for strings
syn region  nclString       start=+"+  end=+"+

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_ncl_syn_inits")
  if version < 508
    let did_ncl_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink nclConditional Conditional
  HiLink nclRepeat      Repeat
  HiLink nclNumber      Number
  HiLink nclBoolean     Boolean
  HiLink nclStatement   Statement
  HiLink nclFunction    Function
  HiLink nclComment     Comment
  HiLink nclString      String
  HiLink nclOperator    Operator
  HiLink nclType        Type

  delcommand HiLink
endif

let b:current_syntax = "ncl"

" vim: ts=8

