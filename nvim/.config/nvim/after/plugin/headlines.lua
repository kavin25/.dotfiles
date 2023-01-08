-- vim.cmd([[highlight Headline1 guibg=#000000 guifg=green gui=bold]])
vim.cmd([[highlight Headline1 guibg=#1e2718 gui=bold]])
vim.cmd([[highlight Headline2 guibg=#21262d gui=bold]])
-- vim.cmd([[highlight Headline2 guibg=#21262d]])
vim.cmd([[highlight CodeBlock guibg=#1c1c1c]])
vim.cmd([[highlight Dash guifg=#D19A66 gui=bold]])

require("headlines").setup({
	markdown = {
		query = vim.treesitter.parse_query(
			"markdown",
			[[
                (atx_heading [
                    (atx_h1_marker)
                    (atx_h2_marker)
                    (atx_h3_marker)
                    (atx_h4_marker)
                    (atx_h5_marker)
                    (atx_h6_marker)
                ] @headline)

                (thematic_break) @dash

                (fenced_code_block) @codeblock

                (block_quote_marker) @quote
                (block_quote (paragraph (inline (block_continuation) @quote)))
            ]]
		),
		headline_highlights = { "Headline1", "Headline2" },
		codeblock_highlight = "CodeBlock",
		dash_highlight = "Dash",
		dash_string = "–",
		quote_highlight = "Quote",
		quote_string = "┃",
		fat_headlines = true,
		fat_headline_upper_string = "▄",
		fat_headline_lower_string = "▀",
	},
})
