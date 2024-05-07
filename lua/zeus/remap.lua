vim.g.mapleader = " "

--allows you to move visual block up/down
Map("v", "J", ":m '>+1<CR>gv=gv")
Map("v", "K", ":m '<-2<CR>gv=gv")

--replace current buffer
Map("n", "<leader>r", [[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]])

-- Files
Map("n", "<leader>1", ":Ex<CR>")

-- Git
Map("n", "<leader>hd", ":Gitsigns diffthis<CR>")
Map("n", "<leader>hp", ":Gitsigns preview_hunk<CR>")
Map("n", "<leader>hb", ":Gitsigns toggle_current_line_blame<CR>")
Map("n", "<leader>h;", ":Gitsigns next_hunk<CR>zz")
Map("n", "<leader>h,", ":Gitsigns prev_hunk<CR>zz")

-- ToggleTerm
Map("n", "<leader>t", ":ToggleTerm<CR>")
Map("t", "<Esc>", "<C-\\><C-n>")

-- aerial
Map("n", "<leader>o", ":AerialToggle<CR>")

-- obsidian
Map("n", "<leader>ot", ":ObsidianToday<CR>")
Map("n", "<leader>oy", ":ObsidianYesterday<CR>")
Map("n", "<leader>on", ":ObsidianNew<CR>")
Map("n", "<leader>od", ":ObsidianDailies<CR>")
Map("n", "<leader>os", ":ObsidianSearch<CR>")
Map("n", "<leader>x", ":ToggleCheckbox<CR>")
Map("i", "<C-l>", "copilot#Accept()", { expr = true, replace_keycodes = false })
-- todo: remove
vim.g.copilot_no_tab_map = true
