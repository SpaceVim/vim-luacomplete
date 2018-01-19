""
" @section Introduction, intro
" @order intro mappings
" This ia a basic completion plugin for lua file.


" check if Vim is in correct version and has Lua support
if v:version < 703
    echohl WarningMsg
    echom 'Only Vim version 7.3 (or newer) is supported!'
    echohl NONE
    finish
endif
if !has('lua') && !has('nvim')
    echohl WarningMsg
    echom 'Lua support must be enabled!'
    echohl NONE
    finish
endif

" save and reset compatibility options
let s:save_cpo = &cpo
set cpo&vim

if exists('g:luacomplete_loaded')
  finish
else
  let g:luacomplete_loaded = 1
endif

""
" Diable/Enable default mappings in lua buffer.
" >
"   mode        key         functinon
"   normal      <leader>fl  print functin list
"   normal      <leader>lf  wirte and luafile
"   normal      <leader>sli set lua iabbrevs
"   normal      <leader>cli clear lua iabbrevs
" <
let g:luacompleteEnableDefaultMappings = 0

""
" @section Mappings, mappings
" luacomplete defined some mappings for lua buffer:
" >
"   <Plug>PrintFunctionList  print functino list
"   <Plug>WriteAndLuaFile    wirte and luafile
"   <Plug>SetLuaIabbrevs     set lua iabbrevs
"   <Plug>ClearLuaIabbrevs   clear lua iabbrevs
" <
augroup vim_luacomplete
  autocmd!
  autocmd FileType lua setlocal omnifunc=luacomplete#complete
augroup END

noremap <unique> <script> <Plug>PrintFunctionList   :lua print_function_list()
noremap <unique> <script> <Plug>WriteAndLuaFile     :w
noremap <unique> <script> <Plug>SetLuaIabbrevs      :call luacomplete#SetLuaIabbrevs()
noremap <unique> <script> <Plug>ClearLuaIabbrevs    :call luacomplete#ClearLuaIabbrevs()

" restore compatibility options
let &cpo = s:save_cpo
