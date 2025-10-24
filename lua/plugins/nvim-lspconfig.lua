return {
  -- LSP Support
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
      require('mason').setup({})
      require('mason-lspconfig').setup({
        ensure_installed = {
          'lua_ls',
          'lemminx',
          'marksman',
          'emmet_ls',
          'eslint',
          'ts_ls',
          'vue_ls',
          'tailwindcss',
        },
      })

      local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
      vim.lsp.config('ts_ls', {
        init_options = {
          plugins = {
            {
              name = '@vue/typescript-plugin',
              location = vim.fn.expand("$MASON/packages/vue-language-server/node_modules/@vue/language-server"),
              languages = { 'vue' },
            },
          },
        },
        filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'svelte' },
      })

      -- emmet-ls
      vim.lsp.config('emmet_ls',{
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

      -- eslint
      vim.lsp.config('eslint', {
        capabilities = lsp_capabilities,
        on_attach = lsp_attach,
        filetypes = { "javascript", "javascriptreact", "vue", "typescript", "typescriptreact" },
        settings = {
          format = { enable = true },
        },
      })

      -- LSP for floating preview popups
      local open_floating_preview = vim.lsp.util.open_floating_preview
      function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
        opts = opts or {}
        opts.border = opts.border or "rounded"
        return open_floating_preview(contents, syntax, opts, ...)
      end
    end
  },


}

