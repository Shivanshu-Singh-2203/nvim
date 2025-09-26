return {
  "windwp/nvim-autopairs",
  event = "InsertEnter", -- lazy load when entering insert mode
  config = function()
    require("nvim-autopairs").setup({
      check_ts = true,             -- Treesitter integration
      enable_check_bracket_line = true,
      ignored_next_char = "[%w%.]", -- ignore letters & dot
      fast_wrap = {
        map = "<M-e>",            -- Alt+e to wrap
        chars = { "{", "[", "(", '"', "'" },
        pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
        offset = 0,
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        check_comma = true,
        highlight = "Search",
        highlight_grey = "Comment",
      },
    })
  end,
}

