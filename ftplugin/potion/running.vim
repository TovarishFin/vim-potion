if !exists("g:potion_command")
  let g:potion_command = "potion"
endif

function! PotionCompileAndRunFile()
  write
  silent !clear
  execute "!" . g:potion_command . " " . bufname("%")
endfunction

function! PotionShowBytecode()
  write
  " get bytecode
  let bytecode = system(g:potion_command . " -c -V " . bufname("%"))

  let window_location = bufwinnr("__Potion_Bytecode__")
  if window_location != -1
    " move to that window
    execute window_location . " wincmd w"
    normal! ggdG
  else 
    " open new split
    vsplit __Potion_Bytecode__
    normal! ggdG
    setlocal filetype=potionbytecode
    setlocal buftype=nofile
  endif

  " insert bytecode
  call append(0, split(bytecode, '\v\n'))
endfunction

nnoremap <buffer> <localleader>r :call potion#running#PotionCompileAndRunFile()<cr>
nnoremap <buffer> <localleader>b :call potion#running#PotionShowBytecode()<cr>
