" Blackboard feedback syntax file
" Author:       Camil Staps <info@camilstaps.nl>
" License:      This file is placed in the public domain.

if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn match   bbValue       /[^\n]*$/ display contains=bbTodo
syn match   bbTodo        /Needs Grading/ display contained
syn match   bbKey         /^[^:]*:/ display nextgroup=bbValue
syn region  bbFeedback    start=/^Feedback:/ end=/\eof/ contains=@Spell,bbFeedbackKey
syn match   bbFeedbackKey /^Feedback:/ display contained

hi def link bbKey         Keyword
hi def link bbFeedbackKey Keyword
hi def link bbValue       String
hi def link bbTodo        Todo

let b:current_syntax = 'bb'

let &cpo = s:cpo_save
unlet s:cpo_save
