vim.loader.enable()

local lazy_plugins_path = vim.fn.stdpath("data") .. "/lazy"
-- bootstrap lazy.nvim
local lazy_path = lazy_plugins_path .. "/lazy.nvim"
if not vim.loop.fs_stat(lazy_path) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazy_path,
	})
end
vim.opt.rtp:prepend(lazy_path)

-- bootstrap hotpot.nvim
local hotpot_path = lazy_plugins_path .. "/hotpot.nvim"
if not vim.loop.fs_stat(hotpot_path) then
	vim.notify("Bootstrapping hotpot.nvim...", vim.log.levels.INFO)
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--single-branch",
		"https://github.com/rktjmp/hotpot.nvim.git",
		hotpot_path,
	})
end
vim.opt.rtp:prepend(hotpot_path)

require("hotpot").setup({
	provide_require_fennel = true,
	compiler = {
		modules = {
			correlate = true,
		},
	},
})

require("config")
require("plugins.index")
require("mappings")
require("initializers.index")
