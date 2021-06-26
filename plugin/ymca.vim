" It's fun to stay at the ...
" Last Change: 2021 Jun 26
" Maintainer: Joe Ellis <joechrisellis@gmail.com>

if exists("g:loaded_ymca")
  finish
endif
let g:loaded_ymca = 1

function! s:GetOS() abort
  if has("win64") || has("win32") || has("win16")
    return "Windows"
  endif
  return substitute(system('uname'), '\n', '', '')
endfunction

function! s:YMCA() abort
  let l:YMCA_DEEPLINK = "https://youtu.be/CS9OO0S5w2k?t=42"

  let l:open_progs = {
        \ "Darwin" : "open",
        \ "Linux" : "xdg-open",
        \ "Windows" : "start",
        \ }
  let l:open_prog = get(l:open_progs, s:GetOS(), "open")

  echo l:open_prog . " '" . l:YMCA_DEEPLINK . " '"
  call system(l:open_prog . " '" . l:YMCA_DEEPLINK . "'")
endfunction

nnoremap <expr> ymca <SID>YMCA()
