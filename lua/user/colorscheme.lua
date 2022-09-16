local status_ok, colour_scheme = pcall(require, "github-theme")
if not status_ok then
  return
end

colour_scheme.setup({
  theme_style = "dimmed"
})
