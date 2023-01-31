local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
  return
end

-- DAP setup
dap.adapters.ruby = function(callback, config)
  local script

  if config.current_line then
    script = config.script .. ":" .. vim.fn.line(".")
  else
    script = config.script
  end

  callback({
    type = "server",
    host = "127.0.0.1",
    port = "${port}",
    executable = {
      command = "rdbg",
      args = { "--open", "--port", "${port}", "-c", "--", config.command, script },
    },
  })
end

dap.configurations.ruby = {
  {
    type = "ruby",
    name = "debug rspec current_line",
    request = "attach",
    localfs = true,
    command = "rspec",
    script = "${file}",
    current_line = true,
  },
  {
    type = "ruby",
    name = "debug current file",
    request = "attach",
    localfs = true,
    command = "ruby",
    script = "${file}",
  },
}
-- end dap setup

local dapui = require "dapui"
dapui.setup()
-- these aren't necessary but make the dap ui just pop up automatically which is neat
dap.listeners.after.event_initialized["dapui_config"] = dapui.open
dap.listeners.before.event_terminated["dapui_config"] = dapui.close
dap.listeners.before.event_exited["dapui_config"] = dapui.close
-- end dap ui

require("nvim-dap-virtual-text").setup()
