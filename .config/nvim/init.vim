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

call plug#begin('~/.config/nvim/plugged')
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
  " Plug 'hashivim/vim-terraform'
  " Plug 'elixir-editors/vim-elixir'

  " Quality of Life
  Plug 'sainnhe/sonokai'
  Plug 'morhetz/gruvbox'
  Plug 'junegunn/limelight.vim'
  Plug 'junegunn/goyo.vim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'onsails/lspkind-nvim'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-vsnip'
  Plug 'hrsh7th/vim-vsnip'
  "Plug 'hrsh7th/nvim-compe'

  " Notes
  Plug 'xolox/vim-misc'
  Plug 'xolox/vim-notes'

  " Extras
  Plug 'kyazdani42/nvim-web-devicons'
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

" Clear the highlights
map <leader>hl :nohls<cr>

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
let g:vim_markdown_folding_disabled=1
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Zig Config
autocmd BufNewFile,BufReadPost *.zig set filetype=zig

""""""""""""""""""
" LIMELIGHT/GOYO "
""""""""""""""""""
"nmap <Leader>l <Plug>(Limelight)
"xmap <Leader>l <Plug>(Limelight)
nnoremap <silent> <leader>w :Goyo<CR>
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!


"""""""""""""
" VIM-NOTES "
"""""""""""""
let g:notes_directories = ['~/Documents/notes']
let g:notes_suffix = '.md'
let g:notes_title_sync = 'rename_file'
let g:notes_shadowdir = "~/.config/nvim/plugged/vim-notes/misc/notes/shadow/"
let g:notes_unicode_enabled = 0


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

"""""""""""""""
" COLOR THEME "
"""""""""""""""
let g:gruvbox_italic = 1
let g:sonokai_style='shusia'
let g:sonokai_diagnostic_text_highlight = 1
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 0
let g:sonokai_diagnostic_line_highlight = 1
set termguicolors
" colorscheme sonokai
colorscheme gruvbox


"""""""""""
" AIRLINE "
"""""""""""
let g:airline_theme="gruvbox"
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 1
set laststatus=3


lua <<EOF
require'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = "all",

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,

  --ignore_install = { "elixir" },

  highlight = {
    enable = true,
    disable = { "c" },
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF

lua <<EOF
require'nvim-web-devicons'.setup {
 -- your personnal icons can go here (to override)
 -- you can specify color or cterm_color instead of specifying both of them
 -- DevIcon will be appended to `name`
 override = {
  zsh = {
    icon = "",
    color = "#428850",
    cterm_color = "65",
    name = "Zsh"
  }
 };
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
}
EOF

" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

" LSP SETUP
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
  window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "vsnip" }
  }),
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

  -- tell nvim-cmp about our desired capabilities
  require("cmp_nvim_lsp").update_capabilities(capabilities)
end

-- Finally, let's initialize the Elixir language server

-- Replace the following with the path to your installation
local path_to_elixirls = vim.fn.expand("~/.cache/nvim/lspconfig/elixirls/elixir-ls/release/language_server.sh")
local path_to_zigls = vim.fn.expand("~/.cache/nvim/lspconfig/zigls/zls")

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
      fetchDeps = false,
      suggestSpecs = true
    }
  }
})

lspconfig.eslint.setup{
  on_attach = on_attach
}

lspconfig.jsonls.setup{
  on_attach = on_attach
}

lspconfig.zls.setup({
  cmd = {path_to_zigls},
  capabilities = capabilities,
  on_attach = on_attach
})

lspconfig.rls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    rust = {
      unstable_features = true,
      build_on_save = false,
      all_features = true,
    },
  }
}
EOF
