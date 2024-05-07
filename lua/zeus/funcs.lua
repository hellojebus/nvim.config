function Term()
	vim.cmd("term")
	vim.cmd("norm G")
end

function Map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

-- Command :BufClose closes all buffers except current one
vim.api.nvim_create_user_command("BufClose", function()
	local current_buffer = vim.fn.bufnr("%")
	local last_buffer = vim.fn.bufnr("$")

	if current_buffer > 1 then
		vim.cmd("silent! " .. "1, " .. current_buffer - 1 .. "bd")
	end

	if current_buffer < last_buffer then
		vim.cmd("silent! " .. current_buffer + 1 .. "," .. last_buffer .. "bd")
	end
end, {
	nargs = 0,
})
