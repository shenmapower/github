" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
"debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'. Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
set nocompatible

" Vim5 and later versions support syntax highlighting. Uncommenting the
" following enables syntax highlighting by default.
if has("syntax")
syntax on " 语法高亮
endif
colorscheme bandit " elflord ron peachpuff default 设置配色方案，vim自带的配色方案保存在/usr/share/vim/vim72/colors目录下

" detect file type
filetype on
filetype plugin on
filetype plugin indent on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

"set updatecount=100
set updatetime=10000

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"have Vim load indentation rules and plugins according to the detected filetype
filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.

"set ignorecase " 搜索模式里忽略大小写
"set smartcase " 如果搜索模式包含大写字符，不使用 'ignorecase' 选项。只有在输入搜索模式并且打开 'ignorecase' 选项时才会使用。
set autowrite " 自动把内容写回文件: 如果文件被修改过，在每个 :next、:rewind、:last、:first、:previous、:stop、:suspend、:tag、:!、:make、CTRL-] 和 CTRL-^命令时进行；用 :buffer、CTRL-O、CTRL-I、'{A-Z0-9} 或 `{A-Z0-9} 命令转到别的文件时亦然。
set autoindent " 设置自动对齐(缩进)：即每行的缩进值与上一行相等；使用 noautoindent 取消设置
"set smartindent " 智能对齐方式
set tabstop=4 " 设置制表符(tab键)的宽度
set softtabstop=4 " 设置软制表符的宽度
set shiftwidth=4 " (自动) 缩进使用的4个空格
set cindent " 使用 C/C++ 语言的自动缩进方式
set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s "设置C/C++语言的具体缩进方式
"set backspace=2 " 设置退格键可用
set showmatch " 设置匹配模式，显示匹配的括号
set linebreak " 整词换行
set whichwrap=b,s,<,>,[,] " 光标从行首和行末时可以跳到另一行去
"set hidden " Hide buffers when they are abandoned
set mouse=a " Enable mouse usage (all modes) "使用鼠标
set number " Enable line number "显示行号
"set previewwindow " 标识预览窗口
set history=500 " set command history to 50 "历史记录50条
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,gb2312,gbk,big5,euc-jp,euc-kr
set encoding=utf8
set cmdheight=1               "命令部分高度为1 
set shortmess=atI             "启动的时候不显示那个援助索马里儿童的提示
set t_ti= t_te=               "退出vim后，内容显示在终端屏幕 设置 退出vim后，内容显示在终端屏幕, 可以用于查看和复制好处：误删什么的，如果以前屏幕打开，可以找回
set title                     "change the terminal's title
set novisualbell             "don't beep
set noerrorbells             "don't beep
set backup                   "备份
set backupext=.bak
set wildignore=*.swp,*.bak,*.pyc,*.class
set scrolloff=3               "至少有3行在光标所在行上下

set go=             "不要图形按钮  
set cul             "高亮光标所在行
autocmd InsertEnter * se cul "用浅色高亮当前行  
"--状态行设置--
set laststatus=2 " 总显示最后一个窗口的状态行；设为1则窗口数多于一个的时候显示最后一个窗口的状态行；0不显示最后一个窗口的状态行
set ruler " 标尺，用于显示光标位置的行号和列号，逗号分隔。每个窗口都有自己的标尺。如果窗口有状态行，标尺在那里显示。否则，它显示在屏幕的最后一行上。

"--命令行设置--
set showcmd " 命令行显示输入的命令
set showmode " 命令行显示vim当前模式

set foldenable     "允许折叠  
set foldmethod=manual   "手动折叠 

"--find setting--
"set ignorecase "搜索时忽略大小写 
set hlsearch                 "高亮显示结果
"set nohlsearch "关闭搜索高亮  
"
"Smart way to move between windows 分屏窗口移动
"则可以用<C-h,j,k,l>切换到上下左右的窗口中去,就像:
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" F1 - F6 设置
" F2 close hight search
" F4 调出listbar函数列表
" F5 粘贴模式paste_mode开关,用于有格式的代码粘贴
" F6 语法开关，关闭语法可以加快大文件的展示
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" I can type :help on my own, thanks.  Protect your fat fingers from the evils of <F1>
noremap <F1> <Esc>"
nnoremap <F2> :set nohlsearch! hlsearch?<CR>
"nmap <silent> <F4> :TagbarToggle<CR> "按下F4就可以呼出文件的函数列表及变量
set pastetoggle=<F5>             "when in insert mode, press <F5> to go to
                                "paste mode, where you can paste mass data
                                "that won't be autoindented
"au InsertLeave * set nopaste
"nnoremap <F6> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>



"--ctags setting--
" 按下F5重新生成tag文件，并更新taglist
"sudo ctags  -I __THROW  -I __THROWNL -I __attribute_pure__ -I __nonnull -I__attribute__ -R --c-kinds=+p --fields=+iaS --extra=+q --language-force=C
"/usr/include/
map <F5> :!ctags -R --c++-kinds=+p --fields=+liaS --extra=+q .<CR> :TlistUpdate<CR> :UpdateTypesFile<CR> :call UpdateTagColor()<CR>
imap <F5> <ESC>:!ctags -R --c++-kinds=+p --fields=+lSia --extra=+q .<CR> :TlistUpdate<CR> :UpdateTypesFile<CR>

func! UpdateTagColor()
	exec "!cscope -Rbq"
	if filereadable("mathtag.py")
		exec "!python mathtag.py ./tags proColor.vim"
		exec "so ./proColor.vim"
	endif
endfunc




set tags=tags 
set tags+=./tags "add current directory's generated tags file
"set tags+=~/Downloads/linux-3.2.47/tags "add current directory's generated tags file
set tags+=/usr/include/tags "add new tags file(刚刚生成tags的路径，在ctags -R 生成tags文件后，不要将tags移动到别的目录，否则ctrl+］时，会提示找不到源码文件)
set tags+=/usr/include/c++/tags

"-- omnicppcomplete setting --
"" 按下F3自动补全代码，注意该映射语句后不能有其他字符，包括tab；否则按下F3会自动补全一些乱码
imap <F3> <C-X><C-O>
imap <F2> <C-X><C-I>
set completeopt=menu,menuone " 关掉智能补全时的预览窗口
let OmniCpp_MayCompleteDot = 1 " autocomplete with .
let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)
let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included files
let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype in popup window
let OmniCpp_GlobalScopeSearch=1 " enable the global scope search
let OmniCpp_DisplayMode=1 " Class scope completion mode: always show all members
"let OmniCpp_DefaultNamespaces=["std"]
let OmniCpp_ShowScopeInAbbr=1 " show scope in abbreviation and remove the last column
let OmniCpp_ShowAccess=1

"echofunc
let g:EchoFuncShowOnStatus=2
set statusline=%<%f\:                    " Filename
set statusline+=%-5.3n\                 " buffer number
set statusline+=%5l\
set statusline+=%{EchoFuncGetStatusLine()} 
let g:EchoFuncKeyNext='<C-o>'

map <leader>tn :tabnew<cr> "
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

"共享剪贴板  
set clipboard+=unnamed 


"-- Taglist setting --
let Tlist_Show_One_File=0 "让taglist可以同时展示多个文件的函数列表
let Tlist_Ctags_Cmd='ctags' "因为我们放在环境变量里，所以可以直接执行
let Tlist_Use_Right_Window=1 "让窗口显示在右边，0的话就是显示在左边
let Tlist_File_Fold_Auto_Close=1 "非当前文件，函数列表折叠隐藏
let Tlist_Exit_OnlyWindow=1 "当taglist是最后一个分割窗口时，自动推出vim
"是否一直处理tags.1:处理;0:不处理
let Tlist_Process_File_Always=1 "实时更新tags
let Tlist_Inc_Winwidth=0

let g:winManagerWindowLayout='FileExplorer|TagList'
let g:persistentBehaviour=0 " 如果所有编辑文件都关闭了，退出vim
nmap wm :WMToggle<cr>


" -- MiniBufferExplorer --
let g:miniBufExplMapWindowNavVim = 1 " 按下Ctrl+h/j/k/l，可以切换到当前窗口的上下左右窗口
let g:miniBufExplMapWindowNavArrows = 1 " 按下Ctrl+箭头，可以切换到当前窗口的上下左右窗口
"let g:miniBufExplMapCTabSwitchBufs = 1 " 启用以下两个功能：Ctrl+tab移到下一个buffer并在当前窗口打开；Ctrl+Shift+tab移到上一个buffer并在当前窗口打开；ubuntu好像不支持
"let g:miniBufExplMapCTabSwitchWindows = 1 "  启用以下两个功能：Ctrl+tab移到下一个窗口；Ctrl+Shift+tab移到上一个窗口；ubuntu好像不支持
let g:miniBufExplModSelTarget = 1 "  不要在不可编辑内容的窗口（如TagList窗口）中打开选中的buffer
let g:bufExplorerMaxHeight=50

"--编码--
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,gbk,latin1


"--QuickFix
"nmap cn :cn<cr>
"nmap cp :cp<cr>

"winmanager
"设置taglistbuffer的最高限制：
"let g:bufExplorerMinHeight=100
"可直接 :res 20 

" 映射切换buffer的键位
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""设置cscope ctags"配置""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("cscope") 
 
    """"""""""""" Standard cscope/vim boilerplate 
 
if filereadable("GTAGS")
set csprg=gtags-cscope
" use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t' 
" check cscope for definition of a symbol before checking ctags: set to 1 
" if you want the reverse search order. 
set csto=0 
set cst  
set nocsverb 
"cs reset
"let Gtags_Auto_Map = 1
cs add GTAGS $PWD
endif 


"    " add any cscope database in current directory 
    if filereadable("cscope.out") 
set csprg=/usr/bin/cscope
set csto=0 
set cst  
set nocsverb 
        cs add cscope.out   
    " else add the database pointed to by environment variable  
    elseif $CSCOPE_DB != "" 
        cs add $CSCOPE_DB 
    endif 


set csverb   
"    " show msg when any other cscope db added 
    set cscopeverbose
endif

"frist 终端输入 $:cscope -Rbq
"sec F12
"查找本C 符号
nmap <C-f>c :cs find s <C-R>=expand("<cword>")<CR><CR>
"查找本定义
nmap <C-f>d :cs find g <C-R>=expand("<cword>")<CR><CR>
"查找调用本函数的函数
nmap <C-f>f :cs find c <C-R>=expand("<cword>")<CR><CR>
"查找本字符串
nmap <S-f>f :cs find t <C-R>=expand("<cword>")<CR><CR>
"查找本函数调用的函数
nmap <S-c>d :cs find d <C-R>=expand("<cword>")<CR><CR>
"查找本文件
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
"查找包含本文件的文件
nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>

map <F12> :call Do_CsTag()<CR>
function Do_CsTag()
	let dir = getcwd()

	if filereadable("tags")
		let tagsdeleted=delete("./"."tags")
		if(tagsdeleted!=0)
			echohl WarningMsg | echo "Fail to do tags! I cannot delete the tags" | echohl None
			return
		endif
	endif


	if has("cscope")
		silent! execute "cs kill -1"
	endif
	if filereadable("cscope.files")
		let csfilesdeleted=delete("./"."cscope.in.out")
		let csfilesdeleted=delete("./"."cscope.po.out")
		let csfilesdeleted=delete("./"."cscope.files")

		if(csfilesdeleted!=0)
			echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.files" | echohl None
			return
		endif
	endif
	if filereadable("cscope.out")
		let csoutdeleted=delete("./"."cscope.out")

		if(csoutdeleted!=0)
			echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.out" | echohl None
			return
		endif
	endif
	if filereadable("filenametags")
		let csoutdeleted=delete("./"."filenametags")

		if(csoutdeleted!=0)
			echohl WarningMsg | echo "Fail to do cscope! I cannot delete the filenametags" | echohl None
			return
		endif
	endif


	if(executable('cscope') && has("cscope") && executable('ctags'))
		silent! execute"!find `pwd` -name '*.h' -o -name '*.c++' -o -name '*.cc' -o -name '*.cp' -o -name '*.cpp' -o -name '*.cxx' -o -name '*.h++' -o -name '*.hh' -o -name '*.hp' -o -name '*.hpp' -o -name '*.hxx' -o -name '*.C' -o -name '*.H' -o -name '*.ipp' -o -name '*.c' -o -name '*.js' -o -name '*.java' -o -name '*.idl' -o -name '*.mak' -o -name '*.mk' -o -name '[Mm]akefile' -o -name 'GNUmakefile' -o -name '*.pl' -o -name '*.pm' -o -name '*.plx' -o -name '*.perl' -o -name '*.cmake' -o -name '*.y' -o -name '*.sh' -o -name 'CMakeList*.txt'> cscope.files"
		silent! execute "!cscope -Rbkq -i cscope.files"

		silent! execute "ctags -R --c++-kinds=+p --fields=+liaS --extra=+q ."
		"silent! execute "!ctags -R --languages=+c,c++,java,javascript,make,perl,yacc,sh --langmap=c:+.x,c++:+.inl,make:+.mk.cmake --c-kinds=+px --c++-kinds=+px --fields=+lSafmikKlnsStz --extra=+q --exclude=lex.yy.cc --exclude=copy_lex.yy.cc"
		"silent! execute "!cscope -b"
		execute "normal :"


		if filereadable("cscope.out")
			"let csoutdeleted=delete("./"."cscope.in.out")
			"let csoutdeleted=delete("./"."cscope.po.out")
			execute "cs add cscope.out"
			let csoutdeleted=delete("./"."cscope.files")
			call system("echo -e '!_TAG_FILE_SORTED\t2\t/2=foldcase/' > filenametags")
			call system("find `pwd` -not -regex '.*\.png∥gifpng‖gif' -type f -printf '%f\t%p\t1\n' | sort -f >> filenametags")
		endif
	endif
endfunction
""""""""""""

map <F7> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %< -std=c++11"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ % -o %< -std=c++11"
		exec "!time ./%<"
	elseif &filetype == 'java' 
		exec "!javac %" 
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		exec "!time python2.7 %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
        exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
	endif
endfunc
