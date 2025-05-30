return {
	-- correctly comment embedded languages like jsx
	"JoosepAlviste/nvim-ts-context-commentstring",
	opts = { enable_autocmd = false },
	config = function()
		local get_option = vim.filetype.get_option
		vim.filetype.get_option = function(filetype, option)
			return option == "commentstring" and require("ts_context_commentstring.internal").calculate_commentstring()
				or get_option(filetype, option)
		end
	end,
}
