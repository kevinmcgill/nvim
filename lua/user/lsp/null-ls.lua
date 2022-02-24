local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup {
  debug = true,
  default_timeout = 10000,
  sources = {
    formatting.prettier,
    diagnostics.eslint,
    formatting.rubocop.with({
      -- Use rubocop file that removes unknown parameter
      -- Warning: Metrics/BlockLength does not support IgnoredMethods parameter.
      extra_args = { "--config", vim.fn.expand("~/fix_rubocop.yml") }
    }),
    diagnostics.rubocop.with({
      -- Use rubocop file that removes unknown parameter
      -- Warning: Metrics/BlockLength does not support IgnoredMethods parameter.
      extra_args = { "--extra-details", "--display-style-guide", "--config", vim.fn.expand("~/fix_rubocop.yml") }
    }),
    diagnostics.codespell
  },
}
