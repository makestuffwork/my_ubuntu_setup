" Enable modern Vim features not compatible with Vi spec.
set nocompatible

colorscheme evening

set guioptions-=T
set hls ic is scs nu!
set ts=2
set sts=2
set sw=2
set ai et sta si
set expandtab
set diffopt=filler,iwhite,context:2
:set printoptions=left:36pt,right:36pt,top:36pt,bottom:36pt,syntax:a,number:y,wrap:y,duplex:long,paper:letter,portrait:y
:set pfn=courier_new:h8

" Highlight lines >100 chars
highlight OverLength ctermbg=red ctermfg=white guibg=#b5b5b5
match OverLength /\%101v.\+/

" Trailing Whitespace highlighting
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
" Remove trailing whitespace every time a file is saved.
au BufWritePre * :%s/\s\+$//e
" Replace tabs with two spaces every time a *.sv file is saved.
au BufWritePre *.sv :%s/\t/ /ge
" Format BUILD file on save
autocmd FileType bzl,blazebuild AutoFormatBuffer buildifier

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

au filetype c,cpp,verilog	    let b:comment_leader = '// '
au filetype sh,make,tcl,dtcl	    let b:comment_leader = '# '
noremap <silent> ,c :<C-B>sil <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:noh<CR>
noremap <silent> ,u :<C-B>sil <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:noh<CR>

" All of your plugins must be added before the following line.

" Enable file type based indent configuration and syntax highlighting.
" Note that when code is pasted via the terminal, vim by default does not detect
" that the code is pasted (as opposed to when using vim's paste mappings), which
" leads to incorrect indentation when indent mode is on.
" To work around this, use ":set paste" / ":set nopaste" to toggle paste mode.
" You can also use a plugin to:
" - enter insert mode with paste (https://github.com/tpope/vim-unimpaired)
" - auto-detect pasting (https://github.com/ConradIrwin/vim-bracketed-paste)
filetype plugin indent on
syntax on

func DiffSetup()
"  set nofoldenable foldcolumn=0 number
"  wincmd b
"  set nofoldenable foldcolumn=0 number
  let &columns = &columns * 2
  wincmd =
"  winpos 0 0
endfun

if &diff
  autocmd VimEnter * call DiffSetup()
endif

set guifont=Monospace\ 11
if has("unix")
   function! FontSizePlus ()
     let l:gf_size_whole = matchstr(&guifont, '\( \)\@<=\d\+$')
     let l:gf_size_whole = l:gf_size_whole + 1
     let l:new_font_size = ' '.l:gf_size_whole
     let &guifont = substitute(&guifont, ' \d\+$', l:new_font_size, '')
   endfunction

   function! FontSizeMinus ()
     let l:gf_size_whole = matchstr(&guifont, '\( \)\@<=\d\+$')
     let l:gf_size_whole = l:gf_size_whole - 1
     let l:new_font_size = ' '.l:gf_size_whole
     let &guifont = substitute(&guifont, ' \d\+$', l:new_font_size, '')
   endfunction
else
    function! FontSizePlus ()
      let l:gf_size_whole = matchstr(&guifont, '\(:h\)\@<=\d\+$')
      let l:gf_size_whole = l:gf_size_whole + 1
      let l:new_font_size = ':h'.l:gf_size_whole
      let &guifont = substitute(&guifont, ':h\d\+$', l:new_font_size, '')
    endfunction

    function! FontSizeMinus ()
      let l:gf_size_whole = matchstr(&guifont, '\(:h\)\@<=\d\+$')
      let l:gf_size_whole = l:gf_size_whole - 1
      let l:new_font_size = ':h'.l:gf_size_whole
      let &guifont = substitute(&guifont, ':h\d\+$', l:new_font_size, '')
    endfunction
endif

