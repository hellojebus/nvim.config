local builtin = require('telescope.builtin')
require("telescope").load_extension('zoxide')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fd', builtin.git_files, {})
vim.keymap.set('n', '<C-f>', builtin.git_files, {})

-- oxide plugin
vim.keymap.set("n", "<leader>cd", require("telescope").extensions.zoxide.list)
