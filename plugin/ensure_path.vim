" File:		ensure_path.vim
" Author:	Luc Hermitte <hermitte@fre.fr>
" Last Update:	17th nov 2001
"
if !exists("g:ensure_path_vim")
  let g:ensure_path_vim = 1

  function! EnsurePath(path)
    if !isdirectory(a:path)
      if filereadable(a:path)
	echohl ErrorMsg
	echo   "A file is found were a folder is expected : " . a:path
	echohl None
	return
	""exit
      endif
      let v:errmsg=""
      echo "Create <".a:path.">\n"
      if has("unix") 
	call system('mkdir '.a:path)
      elseif has("win32")
	if &shell =~ "sh"
	  let path = substitute(a:path,'\\','/','g')
	  ""echo "system( 'mkdir ".path."')"
	  call system('mkdir '.path)
	  ""exe "!mkdir ".path
	else
	  let path = substitute(a:path,'/','\\','g')
	  ""echo "system( 'md ".path."')"
	  call system('md '.path)
	endif
      endif
      if strlen(v:errmsg) != 0
	echohl ErrorMsg
	echo   v:errmsg
	echohl None
      endif
      return 1
    else
      return 0
    endif
  endfunction


endif
