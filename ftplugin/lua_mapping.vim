if get(g:, 'luacompleteEnableDefaultMappings', 0)
    " default mappings
    if !hasmapto('<Plug>PrintFunctionList')
        map <unique> <Leader>fl  <Plug>PrintFunctionList
    endif
    if !hasmapto('<Plug>WriteAndLuaFile')
        map <unique> <Leader>lf  <Plug>WriteAndLuaFile
    endif
    if !hasmapto('<Plug>SetLuaIabbrevs')
        map <unique> <Leader>sli  <Plug>SetLuaIabbrevs
    endif
    if !hasmapto('<Plug>ClearLuaIabbrevs')
        map <unique> <Leader>cli  <Plug>ClearLuaIabbrevs
    endif
endif
