(set vim.opt.encoding :UTF-8)
(vim.cmd "set noswapfile")
(set vim.opt.switchbuf :uselast)
(vim.cmd "set termguicolors\n")
(vim.cmd "set scrolloff=4")
(set vim.g.loaded_netrw 1)
(set vim.g.loaded_netrwPlugin 1)
(set vim.g.shortmess "")
(set vim.g.WebDevIconsUnicodeDecorateFolderNodes 1)
(set vim.g.DevIconsEnableFoldersOpenClose 1)
(set vim.g.DevIconsDefaultFolderOpenSymbol "")
(set vim.g.WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol "")
(set vim.opt.timeoutlen 500)
(vim.cmd "filetype plugin indent on")
(set vim.opt.mouse :a)
(set vim.opt.mousemoveevent true)
(set vim.opt.number true)
(set vim.opt.relativenumber true)
(set vim.opt.numberwidth 3)
(set vim.opt.backspace "indent,eol,start")
(set vim.opt.clipboard :unnamed)
(set vim.opt.fdm :syntax)
(vim.cmd "autocmd InsertEnter * set cursorline")
(vim.cmd "autocmd InsertLeave * set nocursorline")
(set vim.opt.termguicolors true)
(set vim.opt.shiftwidth 2)
(set vim.opt.softtabstop 2)
(set vim.opt.tabstop 2)
(set vim.opt.foldmethod :expr)
(set vim.opt.fillchars {:eob " "})
(set vim.opt.foldcolumn :1)
(set vim.opt.foldlevel 99)
(set vim.opt.foldlevelstart 99)
(set vim.opt.foldenable true)
(set vim.opt.hidden true)
(vim.cmd "augroup FiletypeGroup
  autocmd!
  au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
  au BufNewFile,BufRead *.mdx set filetype=markdown.mdx
  au BufRead,BufNewFile *.md setlocal textwidth=80
  au FileType fish setlocal textwidth=79
  au FileType fish setlocal foldmethod=expr
  autocmd BufNewFile,BufRead Brewfile set filetype=ruby
  autocmd BufNewFile,BufRead Procfile set filetype=sh
augroup END
")

(vim.cmd "highlight MatchParen cterm=bold ctermfg=white ctermbg=black")
