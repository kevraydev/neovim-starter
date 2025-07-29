return {
  -- LSP
  {
    'neovim/nvim-lspconfig',
    event = 'VeryLazy',
    dependencies = {
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      { 'j-hui/fidget.nvim', opts = {} },
      { 'folke/neodev.nvim', opts = {} },
    },
    config = function ()
      require('mason').setup()
      require('mason-lspconfig').setup({
        ensure_installed = {
          'lua_ls',
          'lemminx',
          'marksman',
          'emmet_ls',
          'eslint',  -- Add eslint to list of LSPs
        }
      })

      local lspconfig = require('lspconfig')
      local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lsp_attach = function(client, bufnr)
      end

      require('mason-lspconfig').setup({
        function(server_name)
          lspconfig[server_name].setup({
            on_attach = lsp_attach,
            capabilities = lsp_capabilities,
          })
        end
      })

      lspconfig.lua_ls.setup {
        settings = {
          Lua = {
            diagnostics = {
              globals = {'vim'},
            },
          },
        },
      }

      -- Setup for emmet-ls
      lspconfig.emmet_ls.setup({
        capabilities = lsp_capabilities,
        filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "svelte", "pug", "typescriptreact", "vue" },
        init_options = {
          html = {
            options = {
              ["bem.enabled"] = true,
            },
          },
        },
      })

      -- Setup for eslint
      lspconfig.eslint.setup({
        capabilities = lsp_capabilities,
        on_attach = lsp_attach,
        filetypes = { "javascript", "javascriptreact", "vue", "typescript", "typescriptreact" },
        root_dir = lspconfig.util.root_pattern(".eslintrc.js", ".eslintrc.json", ".git"),
        settings = {
          format = { enable = true },
        },
      })

      -- Configure LSP floating preview popups
      local open_floating_preview = vim.lsp.util.open_floating_preview
      function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
        opts = opts or {}
        opts.border = opts.border or "rounded"
        return open_floating_preview(contents, syntax, opts, ...)
      end
    end
  },

  -- Tailwind Tools
  {
    "luckasRanarison/tailwind-tools.nvim",
    name = "tailwind-tools",
    build = ":UpdateRemotePlugins",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      autoComplete = true,
    },
    config = function()
      require("tailwind-tools").setup({
      })
    end,
  },
}

