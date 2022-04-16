local status_ok, diffview = pcall(require, "diffview")
if not status_ok then
  return
end

diffview.setup {
  signsfile_history_panel = {
    log_options = {
      follow = true,       -- Follow renames (only for single file)
      reverse = false,      -- List commits in reverse order
    },
  },
}

