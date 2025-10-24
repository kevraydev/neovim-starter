return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      css = { "prettier" },
      html = { "prettier" },
      javascript = {"prettier"},
      typescript = {"prettier"},
      c = { "clang-format" },
      h = { "clang-format" },
      python = { "black" },
      vue = {"prettier"},
    },
  },
}

