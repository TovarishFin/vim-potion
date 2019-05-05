syntax match PoByteComment "\v--.*--"
syntax match PoByteComment "\v^\*\*.*$"
syntax match PoByteStep "\v\[.*\]"
syntax match PoByteNumber "\v(\S)@<!\d+"


highlight link PoByteComment Comment
highlight link PoByteStep Keyword
highlight link PoByteNumber Number

