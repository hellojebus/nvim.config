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

-- ToggleTerm
Map("n", "<leader>t", ":ToggleTerm<CR>")
Map("t", "<Esc>", "<C-\\><C-n>")
