-- Add this block to your list of plugins (e.g., in lua/plugins/init.lua)
return{
  "ellisonleao/gruvbox.nvim",
  lazy = false,
  priority = 1000, -- Make sure it loads first
  config = function()
    require("gruvbox").setup({
      -- Options are optional, but recommended for Gruvbox style
      terminal_colors = true, -- Add Neovim terminal colors
      undercurl = true,
      bold = true,
      italic = {
        strings = true,
        emphasis = true,
        comments = true,
        operators = false,
        folds = true,
      },
      invert_selection = false,
      invert_signs = false,
      invert_tabline = false,
      inverse = true, -- Inverts syntax for some things, like the statusline
    })
    
    -- Set the background option (crucial for Gruvbox theme)
    vim.o.background = "dark" -- or "light" for Gruvbox light mode

    -- Apply the colorscheme
    vim.cmd("colorscheme gruvbox")
  end
}
