local status_ok, colour_scheme = pcall(require, "tokyonight")
if not status_ok then
  return
end

colour_scheme.setup({
  style = "moon"
})

vim.cmd[[colorscheme tokyonight]]
