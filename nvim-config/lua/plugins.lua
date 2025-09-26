return {
  -- Theme
  { "ellisonleao/gruvbox.nvim", priority = 1000, config = true },

  -- Statusline + bufferline
  { "nvim-lualine/lualine.nvim", config = function()
      require("lualine").setup { options = { theme = "gruvbox" } }
    end
  },
  { "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons",
    config = function() require("bufferline").setup() end
  },

  -- File explorer
  { "nvim-tree/nvim-tree.lua", dependencies = "nvim-tree/nvim-web-devicons",
    config = function() require("nvim-tree").setup() end
  },

  -- Telescope
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

  -- Treesitter
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- Git signs
  { "lewis6991/gitsigns.nvim", config = true },

  -- Autopairs & surround
  { "windwp/nvim-autopairs", config = true },
  { "kylechui/nvim-surround", config = true },

  -- Comment
  { "numToStr/Comment.nvim", config = true },

  -- Which-key
  { "folke/which-key.nvim", config = true },

  -- Trouble (diagnostics)
  { "folke/trouble.nvim", dependencies = "nvim-tree/nvim-web-devicons" },

  -- Noice (UI enhancements)
  { "folke/noice.nvim", dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" } },

  -- Dashboard
  { "nvimdev/dashboard-nvim", event = "VimEnter",
    config = function()
      require("dashboard").setup {
        theme = "doom",
        config = {
          header = { "NeoVim Config 🚀" },
          center = {
            { icon = " ", desc = "New File", action = "ene | startinsert" },
            { icon = " ", desc = "Find File", action = "Telescope find_files" },
            { icon = " ", desc = "File Explorer", action = "NvimTreeToggle" },
          },
        }
      }
    end
  },

  -- Completion
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "saadparwaiz1/cmp_luasnip" },
  { "L3MON4D3/LuaSnip" },

  -- LSP
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason.nvim", config = true },
  { "williamboman/mason-lspconfig.nvim" },
  { "ray-x/lsp_signature.nvim" },

  -- SnipRun
  { "michaelb/sniprun", build = "bash ./install.sh",
    config = function()
      require("sniprun").setup({
        display = { "Classic", "VirtualTextOk" },
      })
      vim.keymap.set("v", "<leader>r", ":'<,'>SnipRun<CR>",
        { noremap = true, silent = true, desc = "Run selection" })
      vim.keymap.set("n", "<leader>r", "<cmd>SnipRun<CR>",
        { noremap = true, silent = true, desc = "Run current line" })
      vim.keymap.set("n", "<leader>rc", "<cmd>SnipClose<CR>",
        { noremap = true, silent = true, desc = "Clear SnipRun" })
    end
  },
}
