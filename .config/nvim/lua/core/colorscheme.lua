-- set colorscheme to nightfly with protected call
-- in case it isn't installed
local status, _ = pcall(vim.cmd, [[colorscheme gruvbox-material]])
if not status then
	print("Colorscheme not found!") -- print error if colorscheme not installed
 	return
 end

-- vim.o.colorscheme = "gruvbox-material"

-- set up for transparent
require("transparent").setup({
	extra_groups = {
		-- table/string: additional groups that should be cleared
		-- In particular, when you set it to 'all', that means all available groups
		-- example of akinsho/nvim-bufferline.lua
		"BufferLineTabClose",
		"BufferlineBufferSelected",
		"BufferLineFill",
		"BufferLineBackground",
		"BufferLineSeparator",
		"BufferLineIndicatorSelected",
	},
	exclude_groups = {}, -- table: groups you don't want to clear
})
