return {
  "michaelb/sniprun",
  build = "sh ./install.sh",
  cmd = { "SnipRun", "SnipInfo" },
  keys = {
    { "<leader>r", "<Plug>SnipRun", mode = "n", desc = "Run line" },
    { "<leader>r", "<Plug>SnipRun", mode = "v", desc = "Run selection" },
  },
  config = function()
    require("sniprun").setup({
      display = {
        "Classic",         -- shows output in virtual text
        "VirtualTextOk",   -- highlights successful runs
        -- "TempFloatingWindow", -- uncomment to get popup window
      },
      live_mode_toggle = "enable", -- run as you type if you want
    })
  end,
}

