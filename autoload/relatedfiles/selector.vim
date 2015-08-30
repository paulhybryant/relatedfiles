let s:plugin = maktaba#plugin#Get('relatedfiles')

" Functions for editing related files
let s:editfns = { 'h' : 's:EditHeader', 'c' : 's:EditCC', 't' : 's:EditTest' }
function! relatedfiles#selector#JumpToRelatedFile(related_type) abort " {{{
  call call(s:editfns[a:related_type], [])
endfunction

function! s:EditHeader() abort
  let l:filename = expand("%")
  if l:filename =~# ".*\.h$"
    echo "Already in header file."
    return
  elseif l:filename =~# ".*_unittest\.cc$"
    let l:filename = substitute(l:filename, "\\v(.*)_unittest\.cc", "\\1", "")
  elseif l:filename =~# ".*\.cc$"
    let l:filename = substitute(l:filename, "\\v(.*)\.cc", "\\1", "")
  else
    echo "Do not know related files to" l:filename
    return
  endif
  execute s:plugin.Flag('open_command') fnameescape(l:filename . ".h")
endfunction

function! s:EditCC() abort
  let l:filename = expand("%")
  if l:filename =~# ".*\.cc"
    echo "Already in cc file."
    return
  elseif l:filename =~# ".*_unittest\.cc"
    let l:filename = substitute(l:filename, "\\v(.*)_unittest\.cc", "\\1", "")
  elseif l:filename =~# ".*\.h"
    let l:filename = substitute(l:filename, "\\v(.*)\.h", "\\1", "")
  else
    echo "Do not know related files to" l:filename
    return
  endif
  execute s:plugin.Flag('open_command') fnameescape(l:filename . ".cc")
endfunction

function! s:EditTest() abort
  let l:filename = expand("%")
  if l:filename =~# ".*_unittest\.cc"
    echo "Already in test file."
    return
  elseif l:filename =~# ".*\.cc"
    let l:filename = substitute(l:filename, "\\v(.*)\.cc", "\\1", "")
  elseif l:filename =~# ".*\.h"
    let l:filename = substitute(l:filename, "\\v(.*)\.h", "\\1", "")
  else
    echo "Do not know related files to" l:filename
    return
  endif
  execute s:plugin.Flag('open_command') fnameescape(l:filename . "_unittest.cc")
endfunction
" }}}
