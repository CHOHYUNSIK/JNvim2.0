" ================================기본세팅 관리================================
syntax on																" 구문강조 하이라이팅 킴
set nowrap															" 자동 줄바꿈 안되도록 함
set splitbelow													" 가로로 창 분할 시, 새 창은 아래에 생기도록
set splitright													" 세로로 창 분할 시, 새 창은 오른쪽에 생기도록
set mouse=a															" 마우스 사용가능
set encoding=utf-8											" 인코딩 한글깨짐 방지
set fileencoding=utf-8									" 파일 인코딩 한글깨짐 방지
set cmdheight=2													" --INSERT--나오는 부분 높이 2로 설정
set ruler																" 우측 하단에 커서위치 표시
set number															" 라인번호 표시
set pumheight=10												" 팝업리스트 10개까지 보이도록 함
set autoindent													" 자동 들여쓰기 활성화
set smartindent													" 조금 더 똑똑한 들여쓰기 활성화
set shiftwidth=2												" 자동 들여쓰기 2칸
set smarttab														" 조금 더 똑똑한 탭 활성화
set tabstop=2														" 탭 한번 = 띄어쓰기 2번 설정
set laststatus=2                        " 상태바 표시(항상 표시)
set showmatch														" 괄호쌍 보이기
set cursorline													" 커서있는곳 라인으로 표시해줌
set t_Co=256														" 256색 적용
set noshowmode													" --INSERT-- 안보이게 하기
set nobackup														" 백업파일 안생기도록 함
set nowritebackup												" 백업파일 안생기게 함
set shortmess+=c												" 사용자가 정의한 메세지 숨기기
set updatetime=300											" completion 속도 증가
set timeoutlen=100											" 타임아웃시간 0.1초로 지정
set clipboard=unnamedplus								" 복사 붙여넣기 어디든 되도록 함
set autochdir														" 현재 디렉토리를 자동으로 working dir로 설정
set incsearch														" 한글자 입력할때마다 매칭되는부분 알려주도록 함
set hlsearch														" 검색결과에 하이라이트 표시
set background=dark											" 바탕화면 어둡게
set showtabline=2												" 무조건적으로 퍼버 보이도록 하기
" =============================================================================

" ================================매핑세팅 관리 ================================
" 리더키 <space>로 설정
let mapleader=" "
" 로컬리더키 <space>로 설정
nnoremap <space> <Nop>

" normal모드에서 <TAB>누르면 다음버퍼로
nnoremap <silent> <TAB> :bnext<CR>
" normal모드에서 <Shift-TAB>누르면 이전버퍼로
nnoremap <silent> <S-TAB> :bprevious<CR>

" visual모드에서
" shift + k = 그 줄 올리기
" shift + j = 그 줄 내리기
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

" <C-s>: :w로 동작하도록
nnoremap <silent> <C-s> :w<CR>
" <C-q>: :wq로 동작하도록
nnoremap <silent> <C-q> :wq<CR>
" <C-c>: <ESC>로 동작하도록
nnoremap <silent> <C-c> <ESC>

" 터미널 분할 창 이동
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" normal모드에서 창 크기 조절
nnoremap <silent> <C-Up>		:resize -2<CR>
nnoremap <silent> <C-Down>	:resize +2<CR>
nnoremap <silent> <C-Left>	:vertical resize -2<CR>
nnoremap <silent> <C-Right>	:vertical resize +2<CR>

" insert모드에서 자동완성 팝업 움직이기
" <TAB> = 다음
inoremap <silent> <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" <c-k> = 이전
inoremap <expr> <c-k> ("\<C-p>")
" =============================================================================
"
" ================================플러그인 관리================================
" vim-plug 자동 설치
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif
" neovim 시작 시 안깔려있는 플러그인 있으면 설치되도록 하기
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
" =============================================================================

" ================================플러그인 종류================================
call plug#begin('~/.config/nvim/autoload/plugged')

  " 주석처리 플러그인
  " <space>/ 로 주석처리 가능
  Plug 'tpope/vim-commentary'

call plug#end()
" =============================================================================

" ================================vim-commentary===============================
" <space>/ : 자동 주석처리
function! Comment()
	if(mode() == "n")
		execute "Commentary"
	else
		execute "'<,'>Commentary"
	endif
endfunction
vnoremap <silent> <space>/ :call Comment()
" =============================================================================