" Blackboard feedback syntax file
" Author:  Camil Staps <info@camilstaps.nl>
" License: This file is placed in the public domain.

if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn spell toplevel

syn region  bbData   start=/Name:/ end=/Feedback:/ keepend contains=@Spell

syn match   bbValue  /[^\n]*$/ display contained containedin=bbData
syn match   bbKey    /^[^:]*:/ display contained containedin=bbData
syn match   bbTodo   /Needs Grading/ display contained containedin=bbValue

hi def link bbKey    Keyword
hi def link bbValue  String
hi def link bbTodo   Todo

syn match   bbPolUse /^\$\(\s\|\w\)\+$/ display
syn region  bbPol    start=/^\$\(\s\|\w\)\+:$/ end=/^\$$/ keepend contains=@Spell
syn match   bbPolId  /^\$\(\s\|\w\)\+:$/ display contained containedin=bbPol
syn match   bbPolEnd /^\$$/ display contained containedin=bbPol

hi def link bbPolUse PreProc
hi def link bbPolId  Macro
hi def link bbPolEnd PreProc

if !exists("b:undo_ftplugin")
	let b:undo_ftplugin = ""
endif

setlocal textwidth=71
let b:undo_ftplugin .= "|setl tw<"
setlocal colorcolumn=72
let b:undo_ftplugin .= "|setl cc<"

let b:current_syntax = 'bb'

let &cpo = s:cpo_save
unlet s:cpo_save
