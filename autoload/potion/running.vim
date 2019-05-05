function! potion#running#PotionCompileAndRunFile()
  write
  silent !clear
  execute "!" . g:potion_command . " " . bufname("%")
endfunction

function! potion#running#PotionShowBytecode()
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
