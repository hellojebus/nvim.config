local builtin = require("telescope.builtin")
require("telescope").load_extension("zoxide")

require("telescope").setup({
	defaults = {
		file_ignore_patterns = {
			"node_modules",
			".min.",
		},
	},
	extensions = {
		lsp_handlers = {
			disable = {},
			location = {
				telescope = {},
				no_results_message = "No references found",
			},
			symbol = {
				telescope = {},
				no_results_message = "No symbols found",
			},
			call_hierarchy = {
				telescope = {},
				no_results_message = "No calls found",
			},
			code_action = {
				telescope = {},
				no_results_message = "No code actions available",
				prefix = "",
			},
		},
	},
})

vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fr", builtin.resume, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<leader>fd", builtin.git_files, {})
vim.keymap.set("n", "gr", builtin.lsp_references, {})
vim.keymap.set("n", "<C-f>", builtin.git_files, {})

-- oxide plugin
vim.keymap.set("n", "<leader>cd", require("telescope").extensions.zoxide.list)
