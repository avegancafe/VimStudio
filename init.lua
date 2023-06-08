vim.loader.enable()

vim.opt.encoding = 'UTF-8'
vim.cmd('set noswapfile')
vim.opt.switchbuf = 'uselast'
vim.cmd([[
set termguicolors
]])
vim.cmd('set scrolloff=4')

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.shortmess = ''
vim.g.WebDevIconsUnicodeDecorateFolderNodes = 1
vim.g.DevIconsEnableFoldersOpenClose = 1
vim.g.DevIconsDefaultFolderOpenSymbol = ''
vim.g.WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ''
vim.opt.timeoutlen = 500

vim.cmd('filetype plugin indent on')

vim.opt.mouse = 'a'
vim.opt.mousemoveevent = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 3
vim.opt.backspace = 'indent,eol,start'
vim.opt.clipboard = 'unnamed'
vim.opt.fdm = 'syntax'
vim.cmd('autocmd InsertEnter * set cursorline')
vim.cmd('autocmd InsertLeave * set nocursorline')
vim.opt.termguicolors = true

vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.foldmethod = 'expr'

vim.opt.foldcolumn = '1'
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

vim.opt.hidden = true

vim.cmd([[
augroup FiletypeGroup
  autocmd!
  au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
  au BufNewFile,BufRead *.mdx set filetype=markdown.mdx
  au BufRead,BufNewFile *.md setlocal textwidth=80
  au FileType fish setlocal textwidth=79
  au FileType fish setlocal foldmethod=expr
  autocmd BufNewFile,BufRead Brewfile set filetype=ruby
  autocmd BufNewFile,BufRead Procfile set filetype=sh
augroup END
]])
vim.cmd('highlight MatchParen cterm=bold ctermfg=white ctermbg=black')

local lazy_plugins_path = vim.fn.stdpath('data') .. '/lazy'
-- bootstrap lazy.nvim
local lazy_path = lazy_plugins_path .. '/lazy.nvim'
if not vim.loop.fs_stat(lazy_path) then
	vim.fn.system({
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable', -- latest stable release
		lazy_path,
	})
end
vim.opt.rtp:prepend(lazy_path)

-- bootstrap hotpot.nvim
local hotpot_path = lazy_plugins_path .. '/hotpot.nvim'
if not vim.loop.fs_stat(hotpot_path) then
	vim.notify('Bootstrapping hotpot.nvim...', vim.log.levels.INFO)
	vim.fn.system({
		'git',
		'clone',
		'--filter=blob:none',
		'--single-branch',
		'https://github.com/rktjmp/hotpot.nvim.git',
		hotpot_path,
	})
end
vim.opt.rtp:prepend(hotpot_path)

require('hotpot').setup({
	provide_require_fennel = true,
	compiler = {
		modules = {
			correlate = true,
		},
	},
})

require('plugins.index')
require('mappings')
require('initializers.index')
