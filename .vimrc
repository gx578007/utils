set nocompatible  "cancel some vi modes to keep from bugs
set number  	   "show the line number
filetype on 	   "check the type of the document
set history=1000  "the limited number of historical lines
set background=dark "black background
syntax on           "colorful syntax

set autoindent
set smartindent
set tabstop=3
set expandtab
set shiftwidth=3
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,gbk,big5,utf8showmatch

let g:tern_map_keys=1
let g:tern_show_argument_hints='on_hold'

set vb t_vb=
set nohls
set incsearch

if has ("vms")
set nobackup
else
set backup
endif

set backupdir=~/temp
set hlsearch
set backspace=indent,eol,start

filetype plugin on
let g:C_AuthorName = "Bo-Han Gary Wu"
let g:C_Email      = "researchgary@gmail.com"
let g:C_Company    = "NTU GIEE"
let g:C_AuthorRef  = "NTU GIEE"
let AUTHOR         = "Bo-Han Gary Wu"
let EMAIL          = "researchgary@gmail.com"
let COMPANY        = "NTU GIEE"
let AUTHORREF      = "NTU GIEE"

"=========fold==========
set foldmarker={,}
set foldmethod=marker
"zc => fold
"-> => open
"_______________________


"===============mapping keys=============================

"AutoIndent and keep the cursor in the same position
function! AutoIndent()
	let lnum = line(".")
	exe "normal" "gg=G"
	exe "normal" cursor(lnum,1)
endfu

map <F1>	:call AutoIndent()<CR>
"paste without mess position
map <F2> : set paste!<BAR>set paste?<CR>
"delete dummy spaces
map <F3> : %s/[ ]*$//g <CR>
set pastetoggle=<F2>

set cursorline
highlight CursorLine term=bold cterm=bold
highlight Cursor term=reverse cterm=reverse
highlight Visual term=bold,reverse cterm=bold,reverse

map Q gq

"runtime .vim/matchit.vim

au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
au BufRead,BufNewFile *.go set filetype=go
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
"autocmd WinEnter,BufRead,BufNewFile * sil !~/.st.sh %
autocmd VimLeave * sil !~/.st.sh bash
"autocmd VimLeave * sil

"_________________________________________________________




function! C_ins_file_header()
	exec "insert"
	/*******************************************************************************

	  [ Filename    ]
	  .
	  exec "normal \<END>a "
	  exec "normal \"%p"
	  exec "normal \<END>\<CR>"
	  exec "insert"

	  [ Description ]

	  [ Author      ]  Gary Wu

	 *******************************************************************************/
	.
	exec "normal 4\<UP>\<END>"
	endfu

	function! C_ins_comment_block()
call inputsave()
	let comment_text = input("Title:")
call inputrestore()
	exec "insert"
	// Copyright 2009 All Rights Reserved
	// =====================================================================================
	//    [   Filename]:
	//    [  CodeStyle]:  Behavior Model
	//    [Description]:
	//    [    Created]:
	//    [     Author]:  Gary Wu (NTUEE), researchgary@gmail.com
	//    [    Company]:  NTUEE
	// =====================================================================================
	module
			\(
			
			\);

		// INPUTS

		// OUTPUTS

		// WIRES & REGS

		// INITIALIZATION

		// COMB

	endmodule
	endfu

	function! C_ins_function_description()
call inputsave()
	let fname = input("Function name:")
call inputrestore()
	exec "insert"
	//=== Function =================================================================
	//  [ Name     ]
	//  [ Synopsis ]
	//  [ Notes    ]
	//==============================================================================
	.
	exec "normal 3\<UP>i\<END>" . fname . "\<ESC>\<DOWN>"
	endfu
	let LocalLeader='\'
	inoremap <buffer> <silent> <LocalLeader>cb <ESC>:call C_ins_comment_block()<CR>i
	nnoremap <buffer> <silent> <LocalLeader>cb :call C_ins_comment_block()<CR>
	inoremap <buffer> <silent> <LocalLeader>fd <ESC>:call C_ins_function_description()<CR>i
	nnoremap <buffer> <silent> <LocalLeader>fd :call C_ins_function_description()<CR>
	inoremap <buffer> <silent> <LocalLeader>fh <ESC>:call C_ins_file_header()<CR>i
	nnoremap <buffer> <silent> <LocalLeader>fh :call C_ins_file_header()<CR>
"execute pathogen#infect()
"call pathogen#helptags()


"set nocompatible
"filetype off

"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()

"Plugin 'gmarik/Vundle.vim'
"Bundle 'Valloric/YouCompleteMe'

"call vundle#end()
"filetype plugin indent on
"let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
