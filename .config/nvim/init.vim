"" GLOBAL SETTINGS
set nocompatible
set autoread

filetype plugin on
filetype indent on

set backspace=eol,start,indent
set whichwrap+=<,>,h,l

"" SEARCH SETTING
set ignorecase " Ignore case when searching
set smartcase  " When searching try to be smart about cases
set incsearch  " Makes search act like search in modern browsers

set showcmd
set showmode
set showmatch

set number
set relativenumber

set list
set lcs=tab:→·,trail:»

set hlsearch
set incsearch
set wrap
set linebreak
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set autoindent
set foldmethod=indent
set foldnestmax=3
set nofoldenable
set wildmode=list:longest
set wildmenu
set formatoptions-=o
set scrolloff=3
set sidescrolloff=7
set sidescroll=1
set cursorline
set cursorcolumn
hi CursorLine term=bold cterm=bold
set t_Co=256
set hidden
set noswapfile
set nobackup
set nowb

"Encryption Parameters
set viminfo=
set nobackup
set nowritebackup

set encoding=utf-8
setglobal fileencoding=utf-8
set fileencodings=utf-8
set termencoding=utf-8

set undodir=~/.config/nvim/undofiles
set undofile
set colorcolumn=+1

syntax enable

call plug#begin('~/.vim/plugged')
  " TPOPE Plugins
  Plug 'tpope/vim-dispatch'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-vinegar'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-unimpaired'
  Plug 'tpope/vim-rhubarb'

  " Airline
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " Languages
  Plug 'dense-analysis/ale'
  Plug 'hashivim/vim-terraform'

  " Quality of Life
  Plug 'sainnhe/sonokai'
  Plug 'junegunn/limelight.vim'
  Plug 'junegunn/goyo.vim'
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-vsnip'
  Plug 'hrsh7th/vim-vsnip'
  Plug 'onsails/lspkind-nvim'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/nvim-compe'


  " Notes
  Plug 'xolox/vim-misc'
  Plug 'xolox/vim-notes'
call plug#end()

"""""""""""""""""""
" CUSTOM MAPPINGS "
"""""""""""""""""""
let mapleader = "\<space>"

" open the README for the current file in a new tab
" use `gt` to go back and forth the the tab
nmap <silent> <leader>n :tab drop README.md<CR>

" make gb select the last pasted text
nnoremap <expr> gb '`[' . strpart(getregtype(), 0, 1) . '`]'
inoremap jk <ESC>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

"resizing helpers
nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> _ :exe "resize " . (winheight(0) * 2/3)<CR>

"make <c-l> clear the highlight as well as redraw
nnoremap <C-L> :nohls<CR><C-L>
inoremap <C-L> <C-O>:nohls<CR>

" Move visual selection
vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv

" Open the current file in the default program
nmap <leader>x :!xdg-open %<cr><cr>

cmap w!! %!sudo tee > /dev/null %

" Quicker switching between windows
nmap <silent> <C-h> <C-w>h
nmap <silent> <C-j> <C-w>j
nmap <silent> <C-k> <C-w>k
nmap <silent> <C-l> <C-w>l

" Markdown Config
let g:markdown_fenced_languages = ['elixir', 'go', 'html', 'python', 'bash', 'vim']
let g:vim_markdown_folding_disabled=1
autocmd BufNewFile,BufReadPost *.md set filetype=markdown


"""""""""""""""""
" ABBREVIATIONS "
"""""""""""""""""
iabbrev defm defmodule do
            \<CR>
            \ @moduledoc ""
            \<CR>
            \<Left><Left>
            \<CR>
            \end<Up><Up><Up><Right><Right><Right><Right><Right><Right>

iabbrev def @doc ""<CR>def do<CR><CR>end<Up><Up>
iabbrev defp defp do<CR><CR>end<Up><Up><Right>


""""""""""""""""""
" LIMELIGHT/GOYO "
""""""""""""""""""
nmap <Leader>l <Plug>(Limelight)
xmap <Leader>l <Plug>(Limelight)
nnoremap <silent> <leader>w :Goyo<CR>
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!


"""""""""""""
" VIM-NOTES "
"""""""""""""
let g:notes_directories = ['~/Documents/notes']
let g:notes_suffix = '.md'
let g:notes_title_sync = 'rename_file'
let g:notes_shadowdir = "~/.vim/bundle/vim-notes/misc/notes/shadow/"
let g:notes_unicode_enabled = 0


"""""""
" ALE "
"""""""
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'elixir': ['mix_format'],
\   'go': ['goimports', 'gofmt'],
\   'rust': ['rustfmt']
\}
set completeopt=menu,menuone,preview,noselect,noinsert
let g:ale_completion_enabled = 0
nmap <silent> <leader>gd :ALEGoToDefinition<CR>


""""""""""""
" Dispatch "
""""""""""""
nnoremap <leader>cc :Dispatch<cr>
nnoremap <leader>iex :Dispatch iex -S mix<cr>
nnoremap <leader>dep :Dispatch mix deps.get<cr>
autocmd FileType elixir let b:dispatch = 'mix compile'
autocmd FileType rust let b:dispatch = 'cargo build'


"""""""""""""
" TELESCOPE "
"""""""""""""
nnoremap <leader>. :Telescope find_files<cr>
nnoremap <leader>b :Telescope buffers<cr>
nnoremap <leader>f :Telescope live_grep<cr>
nnoremap <leader>c :Telescope git_commits<cr>
nnoremap <leader>l :BLines<cr>




"""""""""""""""
" COLOR THEME "
"""""""""""""""
let g:sonokai_style='shusia'
let g:sonokai_diagnostic_text_highlight = 1
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1
let g:sonokai_diagnostic_line_highlight = 1
set termguicolors
colorscheme sonokai


"""""""""""
" AIRLINE "
"""""""""""
let g:airline_theme="sonokai"
let g:airline_powerline_fonts = 1
set statusline=%#identifier#
set statusline+=[%f] "tail of the filename
set statusline+=%*
set statusline+=%#warningmsg# "display a warning if fileformat isnt unix
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*
set statusline+=%h "help file flag
set statusline+=%y "filetype
set statusline+=%#identifier#
set statusline+=%r
set statusline+=%*
set statusline+=%#identifier#
set statusline+=%m
set statusline+=%*
set statusline+=%{fugitive#statusline()}
set statusline+=%{StatuslineGitStatus()}
set statusline+=%#error#
set statusline+=%{StatuslineTabWarning()}
set statusline+=%*
set statusline+=%{StatuslineTrailingSpaceWarning()}
set statusline+=%{StatuslineLongLineWarning()}
set statusline+=%#warningmsg#
set statusline+=%*
set statusline+=%#error#
set statusline+=%{&paste?'[paste]':''}
set statusline+=%*
set statusline+=%= "left/right separator
set statusline+=%{StatuslineCurrentHighlight()}\ \ "current highlight
set statusline+=%c, "cursor column
set statusline+=%l/%L "cursor line/total lines
set statusline+=\ %P "percent through file
set laststatus=2

autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning
"recalculate the tab warning flag when idle and after writing
autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning
"recalculate the long line warning when idle and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_long_line_warning

function! StatuslineTrailingSpaceWarning()
  if !exists("b:statusline_trailing_space_warning")
    if !&modifiable
      let b:statusline_trailing_space_warning = ''
      return b:statusline_trailing_space_warning
    endif
    if search('\s\+$', 'nw') != 0
      let b:statusline_trailing_space_warning = '[\s]'
    else
      let b:statusline_trailing_space_warning = ''
    endif
  endif
  return b:statusline_trailing_space_warning
endfunction

function! StatuslineCurrentHighlight()
  let name= synIDattr(synID(line('.'),col('.'),1),'name')
  if name == ''
    return ''
  else
    return '['.name.']'
  endif
endfunction

function! StatuslineTabWarning()
  if !exists("bLstatusline_tab_warning")
    let b:statusline_tab_warning = ''

    if !&modifiable
      return b:statusline_tab_warning
    endif
    let tabs = search('Z^\t', 'nw') != 0

    let spaces = search('!^\{' . &ts . ',}[^\t]', 'nw') != 0

    if tabs && spaces
      let b:statusline_tab_warning = '[mixed-indenting]'
    elseif (spaces && !&et) || (tabs && &et)
      let b:statusline_tab_warning = '[&et]'
    endif
    return b:statusline_tab_warning
endfunction

function! StatuslineLongLineWarning()
  if !exists("b:statusline_long_line_warning")

    if !&modifiable
      let b:statusline_long_line_warning = ''
      return b:statusline_long_line_warning
    endif

    let long_line_lens = s:LongLines()
    if len(long_line_lens) > 0
      let b:statusline_long_line_warning = "[" .
            \ '#' . len(long_line_lens) . "," .
            \ 'm' . s:Median(long_line_lens) . "," .
            \ '$' . max(long_line_lens) . "]"
    else
      let b:statusline_long_line_warning = ""
    endif
  endif
  return b:statusline_long_line_warning
endfunction

function! StatuslineGitStatus()
	let [a,m,r] = GitGutterGetHunkSummary()
	return printf('+%d ~%d -%d', a, m, r)
endfunction

"return a list containing the lengths of the long lines in this buffer
function! s:LongLines()
  let threshold = (&tw ? &tw : 80)
  let spaces = repeat(" ", &ts)
  let line_lens = map(getline(1,'$'), 'len(substitute(v:val, "\\t", spaces, "g"))')
  return filter(line_lens, 'v:val > threshold')
endfunction

"find the median of the given array of numbers
function! s:Median(nums)
  let nums = sort(a:nums)
  let l = len(nums)
  if l % 2 == 1
    let i = (l-1) / 2
    return nums[i]
  else
    return (nums[l/2] + nums[(l/2)-1]) / 2
  endif
endfunction

lua <<EOF
require'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = "maintained",

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,


  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF

lua <<EOF
local lspconfig = require("lspconfig")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
local cmp = require("cmp")

cmp.setup({
  snippet = {
    expand = function(args)
      -- For `vsnip` user.
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "vsnip" },
  },
  formatting = {
    format = require("lspkind").cmp_format({
      with_text = true,
      menu = {
        nvim_lsp = "[LSP]",
      },
    }),
  },
})

local on_attach = function(_, bufnr)
  local function map(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local map_opts = {noremap = true, silent = true}

  map("n", "df", "<cmd>lua vim.lsp.buf.formatting()<cr>", map_opts)
  map("n", "gd", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>", map_opts)
  map("n", "dt", "<cmd>lua vim.lsp.buf.definition()<cr>", map_opts)
  map("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", map_opts)
  map("n", "gD", "<cmd>lua vim.lsp.buf.implementation()<cr>", map_opts)
  map("n", "<c-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", map_opts)
  map("n", "1gD", "<cmd>lua vim.lsp.buf.type_definition()<cr>", map_opts)

  vim.cmd [[imap <expr> <C-l> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>']]
  vim.cmd [[smap <expr> <C-l> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>']]

  vim.cmd [[imap <expr> <Tab> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>']]
  vim.cmd [[smap <expr> <Tab> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>']]
  vim.cmd [[imap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>']]
  vim.cmd [[smap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>']]

  -- tell nvim-cmp about our desired capabilities
  require("cmp_nvim_lsp").update_capabilities(capabilities)
end

-- Finally, let's initialize the Elixir language server

-- Replace the following with the path to your installation
local path_to_elixirls = vim.fn.expand("~/.cache/nvim/lspconfig/elixirls/elixir-ls/release/language_server.sh")

lspconfig.elixirls.setup({
  cmd = {path_to_elixirls},
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    elixirLS = {
      -- I choose to disable dialyzer for personal reasons, but
      -- I would suggest you also disable it unless you are well
      -- aquainted with dialzyer and know how to use it.
      dialyzerEnabled = true,
      -- I also choose to turn off the auto dep fetching feature.
      -- It often get's into a weird state that requires deleting
      -- the .elixir_ls directory and restarting your editor.
      fetchDeps = false
    }
  }
})
EOF
