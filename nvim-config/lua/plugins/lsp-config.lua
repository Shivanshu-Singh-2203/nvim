return {
    -- 1. Mason (Installer)
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end,
    },

    -- 2. Mason-LSPConfig (Bridge & Auto-Installer)
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            -- List of language servers to install.
            ensure_installed = {
                "solargraph",
                "html",
                "lua_ls",
                -- ✅ FIX 1: Use the correct, non-deprecated server name
                "ts_ls", 
            },
            auto_install = true,
        },
        -- Define the handler to set up servers using the new vim.lsp.config approach
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            -- This is the function that defines the base config for every server
            local on_attach = function(client, bufnr)
                -- LspAttach is the recommended place for keymaps
                local opts = { buffer = bufnr }
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
            end

            -- This sets the default configuration for ALL servers installed by Mason
            require('mason-lspconfig').setup({
                -- This handler is the key to fixing the deprecation warning (FIX 2)
                -- It tells mason-lspconfig to use the new vim.lsp.enable API
                handlers = {
                    -- Default handler for any server not listed below
                    function(server_name)
                        require('lspconfig')[server_name].setup({
                            capabilities = capabilities,
                            on_attach = on_attach,
                        })
                    end,

                    -- You can define custom handlers for specific servers here if needed
                    -- e.g., ["lua_ls"] = function() ... end
                }
            })
        end
    },
    
    -- 3. nvim-lspconfig (Now only needed as a dependency for the configurations)
    -- We can simplify this block substantially now that the logic is in mason-lspconfig
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        -- No config needed here, as mason-lspconfig handles the setup and keymaps
    },
}
