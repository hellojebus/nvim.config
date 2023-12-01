vim.g.mapleader = " "

--File explorer
vim.keymap.set("n", "<leader>1", vim.cmd.Ex)

--allows you to move visual block up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--replace current buffer
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]])
