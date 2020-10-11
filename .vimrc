"==============================================================================
" vim 内置配置 
"==============================================================================
" 设置 vimrc 修改保存后立刻生效，不用在重新打开
" 建议配置完成后将这个关闭，否则配置多了之后会很卡
" autocmd BufWritePost $MYVIMRC source $MYVIMRC

"set nocompatible                                               " 关闭兼容模式

set backspace=indent,eol,start                                  " 启用backspace
set nu                                                          " 设置行号
set cursorline                                                  "突出显示当前行
" set cursorcolumn " 突出显示当前列
set showmatch                                                   " 显示括号匹配

" tab 缩进
set tabstop=4                                                   " 设置Tab长度为4空格 或者 set ts=4
set shiftwidth=4                                                " 设置自动缩进长度为4空格
set expandtab                                                   " 将tab转成space
set autoindent                                                  " 继承前一行的缩进方式，适用于多行注释

" 定义快捷键的前缀，即<Leader>
let mapleader=";" 

" ==== 系统剪切板复制粘贴 ====
" v 模式下复制内容到系统剪切板
vmap <Leader>c "+yy
" n 模式下复制一行到系统剪切板
nmap <Leader>c "+yy
" n 模式下粘贴系统剪切板的内容
nmap <Leader>v "+p

" 开启实时搜索
set incsearch
" 搜索时大小写不敏感
set ignorecase
syntax enable
syntax on                                                       " 开启文件类型侦测
filetype plugin indent on                                        " 启用自动补全

" 退出插入模式指定类型的文件自动保存
au InsertLeave *.go,*.sh,*.php write


set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936        " 文件编码格式
set termencoding=utf-8
set encoding=utf-8
set wrap                                                        " 设置自动换行
set foldmethod=indent                                           " 折叠
set foldlevelstart=99                                           " 设置折叠级别 用于取消打开就折叠

" set spell                                                     " 开启语法检查
set nospell                                                     " 关闭语法检查

" 标签页操作快捷键
nmap nex    :tabnext<CR>
nmap pre    :tabprevious<CR>
nmap new    :tabnew<CR>

" ESC 可用ctrl + c代替，vim默认配置中已有
" ESC 使用kl替换
inoremap kl <ESC>

" 保存 使用hj替换
inoremap hj <ESC>:w<CR>
noremap hj :w<CR>


set fdm=syntax " 折叠方式, 用语法高亮来定义折叠
" manual          手工定义折叠
" indent          更多的缩进表示更高级别的折叠
" expr            用表达式来定义折叠
" syntax          用语法高亮来定义折叠
" diff            对没有更改的文本进行折叠
" marker          对文中的标志折叠

" 保存快捷键
nmap fs :w!<CR>
"nmap <c-s> :w!<CR>                                             " control + s 被系统快捷键占用，无法在vim配置文件中使用
" vmap <C-S> <C-C>:w!<CR>
" nmap <C-S> :w!<CR>i

nmap ag     :Ack

" 启用鼠标
set mouse=a

" 在当前文件中快速查找光标下的单词, 要了解详细信息，":help :lvimgrep"及":help :lgrep"
nmap <leader>lv :lv /<c-r>=expand("<cword>")<cr>/ %<cr>:lw<cr>

" 光标跨窗口移动 左移 右移 上移 下移
nmap <leader>a <c-w>h
nmap <leader>d <c-w>l
nmap <leader>w <c-w>k
nmap <leader>s <c-w>j

"==============================================================================
" 插件配置 
"==============================================================================

" 插件开始的位置
"call plug#begin('~/.vim/plugged')
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" 玩具插件
"----------------------------------------------------------------
" 黑客帝国屏幕字符流效果
Plugin 'matrix.vim--Yang'

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" 可以快速对齐的插件
Plugin 'junegunn/vim-easy-align'

" 用来提供一个导航目录的侧边栏
Plugin 'scrooloose/nerdtree'

" 可以使 nerdtree Tab 标签的名称更友好些
Plugin 'jistr/vim-nerdtree-tabs'

" 可以在导航目录中看到 git 版本信息
Plugin 'Xuyuanp/nerdtree-git-plugin'

" 查看当前代码文件中的变量和函数列表的插件，
" 可以切换和跳转到代码中对应的变量和函数的位置
" 大纲式导航, Go 需要 https://github.com/jstemmer/gotags 支持
Plugin 'majutsushi/tagbar'

" 自动补全括号的插件，包括小括号，中括号，以及花括号
Plugin 'jiangmiao/auto-pairs'

" Vim状态栏插件，包括显示行号，列号，文件类型，文件名，以及Git状态
Plugin 'vim-airline/vim-airline'

" 有道词典在线翻译
Plugin 'ianva/vim-youdao-translater'

" 代码自动完成，安装完插件还需要额外配置才可以使用
Plugin 'Valloric/YouCompleteMe'

" 可以在文档中显示 git 信息
Plugin 'airblade/vim-gitgutter'


" 下面两个插件要配合使用，可以自动生成代码块
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" 配色方案
" colorscheme neodark
Plugin 'KeitaNakamura/neodark.vim'
" colorscheme monokai
Plugin 'crusoexia/vim-monokai'
" colorscheme github 
Plugin 'acarapetis/vim-colors-github'
" colorscheme one 
Plugin 'rakr/vim-one'

" go 主要插件
Plugin 'fatih/vim-go', { 'tag': '*' }
" go 中的代码追踪，输入 gd 就可以自动跳转
Plugin 'dgryski/vim-godef'
" go 中代码提示
Plugin 'nsf/gocode', {'rtp': 'vim/'}

" markdown 插件
Plugin 'iamcco/mathjax-support-for-mkdp'
Plugin 'iamcco/markdown-preview.vim'

" c/c++插件
"----------------------------------------------------------------
Plugin 'a.vim'                              " 头文件和源文件切换
Plugin 'octol/vim-cpp-enhanced-highlight'   " 自定义类型 变量的语法高亮


" solidity 插件
Plugin 'tomlion/vim-solidity'

" 语法检查器，需要配合solidity语法检查器一块使用 npm install -g solhint
Plugin 'vim-syntastic/syntastic'

" 语法检查
"Plugin 'sohkai/syntastic-local-solhint'

call vundle#end()            " required
filetype plugin indent on    " required

" 插件结束的位置，插件全部放在此行上面
" call plug#end()


"==============================================================================
" 主题配色 
"==============================================================================

" 开启24bit的颜色，开启这个颜色会更漂亮一些
set termguicolors
" 配色方案, 可以从上面插件安装中的选择一个使用 
colorscheme one " 主题 one, 或者solarized、molokai
set background=dark " 主题背景 dark-深色; light-浅色


"==============================================================================
" vim-go 插件
"==============================================================================
let g:go_fmt_command = "goimports" " 格式化将默认的 gofmt 替换
let g:go_fmt_command = "gofmt"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"

let g:go_version_warning = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_methods = 1
let g:go_highlight_generate_tags = 1

let g:godef_split=2


"==============================================================================
" NERDTree 插件
"==============================================================================

" 打开和关闭NERDTree快捷键
map <F10> :NERDTreeToggle<CR>
nmap tr :NERDTreeToggle<cr>


" 显示行号
let NERDTreeShowLineNumbers=1
" 打开文件时是否显示目录
let NERDTreeAutoCenter=1
" 是否显示隐藏文件
let NERDTreeShowHidden=0
" 设置宽度
" let NERDTreeWinSize=31
" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" 打开 vim 文件及显示书签列表
let NERDTreeShowBookmarks=2

" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1

" 自动打开NERDTree
" let NERDTreeQuitOnOpen=0
" NERDTree 宽度
" let NERDTreeWinSize=40

"==============================================================================
"  majutsushi/tagbar 插件
"==============================================================================

" majutsushi/tagbar 插件打开关闭快捷键
nmap <F9> :TagbarToggle<CR>
nmap ta :TagbarToggle<CR>

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }


"==============================================================================
"  nerdtree-git-plugin 插件
"==============================================================================
"let g:NERDTreeIndicatorMapCustom = {
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

"let g:NERDTreeShowIgnoredStatus = 1
let g:NERDTreeGitStatusShowIgnored = 1 


"==============================================================================
"  Valloric/YouCompleteMe 插件
"==============================================================================

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<space>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

"==============================================================================
" airline 插件
"==============================================================================
" airline 状态栏
set laststatus=2                                                " 永远显示状态栏
set t_Co=256                                                    " 在windows中用xshell连接打开vim可以显示色彩
"let g:airline_theme='luna'                                      " 状态栏主题

"==============================================================================
"  其他插件配置
"==============================================================================

" markdwon 的快捷键
"map <silent> <F5> <Plugin>MarkdownPreview
"map <silent> <F6> <Plugin>StopMarkdownPreview

map exp   :MarkdownPreview<CR>
map ext   :StopMarkdownPreview<CR>

" tab 标签页切换快捷键
:nn <Leader>1 1gt
:nn <Leader>2 2gt
:nn <Leader>3 3gt
:nn <Leader>4 4gt
:nn <Leader>5 5gt
:nn <Leader>6 6gt
:nn <Leader>7 7gt
:nn <Leader>8 8gt
:nn <Leader>9 8gt
:nn <Leader>0 :tablast<CR>


" markdown预览配置
" https://github.com/suan/vim-instant-markdown
" start command: InstantMarkdownPreview InstantMarkdownStop
" stop command: InstantMarkdownStop

" 关闭自动打开预览
"let g:instant_markdown_autostart = 0

" 设置预览快捷键exp
"map exp     :InstantMarkdownPreview<CR>

"==============================================================================
" ctags 插件
"==============================================================================

" set tags=tags
" set tags+=./tags                            " 表示在当前工作目录下搜索tags文件
" set tags+=/Users/user/lib/tags               " 三方库和系统库路径 自定义路径
map tags :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
nmap ts     :<ESC>g<C-]>


"\ 'ctagsbin' : '/Users/pjc/.vim/bundle/markdown2ctags/markdown2ctags.py',
" Add support for markdown files in tagbar.
let g:tagbar_type_markdown = {
    \ 'ctagstype': 'markdown',
    \ 'ctagsbin' : '/Users/pjc/.vim/bundle/markdown2ctags/markdown2ctags.py',
    \ 'ctagsargs' : '-f - --sort=yes --sro=»',
    \ 'kinds' : [
        \ 's:sections',
        \ 'i:images'
    \ ],
    \ 'sro' : '»',
    \ 'kind2scope' : {
        \ 's' : 'section',
    \ },
    \ 'sort': 0,
\ }


" c/c++插件
"----------------------------------------------------------------
let g:cpp_class_scope_highlight = 1                    " 突出显示类作用于
let g:cpp_member_variable_highlight = 1                " 成员变量突出显示
let g:cpp_class_decl_gighlight = 1                     " 在声明中高亮显示类名
let g:cpp_posix_standard = 1                           " POSIX功能的高亮显示
"let g:cpp_experimental_simple_template_highlight = 1   " 模板功能突出显示
"let g:cpp_experimental_template_highlight = 1          "文件较大时使用高亮模板速度较快，但会有一些小错误, 
"let g:cpp_concepts_highlight = 1                       " 库概念突出显示


" solidity 插件
"----------------------------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_solidity_checkers = ['solhint']


" ==============================================================================
" GVim 的配置
"==============================================================================
" 如果不使用 GVim ，可以不用配置下面的配置
if has('gui_running')
        colorscheme one
    " 设置启动时窗口的大小
    set lines=999 columns=999 linespace=4

    " 设置字体及大小
        set guifont=Roboto\ Mono\ 13

    set guioptions-=m " 隐藏菜单栏
    set guioptions-=T " 隐藏工具栏
    set guioptions-=L " 隐藏左侧滚动条
    set guioptions-=r " 隐藏右侧滚动条
    set guioptions-=b " 隐藏底部滚动条
            " 在 gvim 下不会和 terminal 的 alt+数字的快捷键冲突，
    " 所以将 tab 切换配置一份 alt+数字的快捷键
    :nn <M-1> 1gt
    :nn <M-2> 2gt
    :nn <M-3> 3gt
    :nn <M-4> 4gt
    :nn <M-5> 5gt
    :nn <M-6> 6gt
    :nn <M-7> 7gt
    :nn <M-8> 8gt
        :nn <M-9> 9gt
        :nn <M-0> :tablast<CR>
endif


