if exists("b:current_syntax")
    finish
endif

syntax keyword potionKeyword loop times to while
syntax keyword potionKeyword if elsif else
syntax keyword potionKeyword class return

syntax keyword potionFunction print join string

syntax match potionComment "\v#.*$"

syntax match potionOperator "\v\*"
syntax match potionOperator "\v/"
syntax match potionOperator "\v\+"
syntax match potionOperator "\v-"
syntax match potionOperator "\v\?"
syntax match potionOperator "\v\="
syntax match potionOperator "\v\*\="
syntax match potionOperator "\v/\="
syntax match potionOperator "\v\+\="
syntax match potionOperator "\v-\="

" integers
syntax match potionNumber "\v(\S)@<!\d+"
" floats
syntax match potionNumber "\v(\S)@<![0-9]*\.[0-9]*"
" hex numbers
syntax match potionNumber "\v(\S)@<!0x\x+"
" scientific notation
syntax match potionNumber "\v(\S)@<![0-9]+\.*[0-9]*e+(\+|\-)*[0-9]*"

syntax region potionString start=/\v"/ skip=/\v\\./ end=/\v"/
syntax region potionString start="\v'" skip="\v\\." end="\v'"

highlight link potionKeyword Keyword
highlight link potionFunction Function
highlight link potionComment Comment
highlight link potionOperator Operator
highlight link potionNUmber Number
highlight link potionString String

let b:current_syntax = "potion"
