local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
  return
end

require("dapui").setup({})
require("nvim-dap-virtual-text").setup()
require('dap-ruby').setup()

