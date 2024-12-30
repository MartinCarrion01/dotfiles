return {
  -- Autocomplete
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
    },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        desc = 'LSP keybindings',
        callback = function(event)
          local opts = { buffer = event.buf }

          vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
          vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
          vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
          vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
          vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
          vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
          vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
          vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
          vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
          vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
          vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
          vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        end
      })

      local cmp = require("cmp")
      local lsp_kind = require("lspkind")

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },

        mapping = cmp.mapping.preset.insert({
          ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
          ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
          ['<C-y>'] = cmp.mapping.confirm({ select = true }),
          ['<C-Space>'] = cmp.mapping.complete(),
          -- ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          -- ['<C-f>'] = cmp.mapping.scroll_docs(4),
        }),

        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "luasnip" },
        }),

        formatting = {
          format = lsp_kind.cmp_format({
            mode = "symbol_text",
            maxwidth = 50,
          }),
        },
      })
    end,
  },
  -- LSPs
  -- Order 1.mason -> 2. mason-lspconfig.nvim -> 3. lspconfig

  {
    "williamboman/mason.nvim", -- Install LSP, DAP, Formatters
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim", -- mason-lspconfig bridges mason.nvim with the lspconfig plugin - making it easier to use both plugins together.
    lazy = false,
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls" },

        automatic_installation = true,
      })
    end,
  },

  {
    "neovim/nvim-lspconfig", -- Nvim LSP client config
    lazy = false,
    config = function()
      local lspconfig = require("lspconfig")
      -- Capabilites -> "Useful for broadcasting to the server additional functionality (snippets, off-protocol features) provided by plugins."
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Typescript / Javascript
      lspconfig.ts_ls.setup({
        filetypes = {
          "javascript",
          "javascriptreact",
          "javascript.jsx",
          "typescript",
          "typescriptreact",
          "typescript.tsx",
        },

        init_options = {
          hostInfo = "neovim",
        },

        capabilities = capabilities,
      })

      -- Rubocop
      lspconfig.solargraph.setup({
        filetypes = { "ruby" },

        capabilities = capabilities,
      })

      -- Go
      lspconfig.gopls.setup({
        filetypes = { "go" },

        capabilities = capabilities,
      })

      -- Lua
      lspconfig.lua_ls.setup({
        filetypes = { "lua" },
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
        capabilities = capabilities,
      })
    end,
  },
}
