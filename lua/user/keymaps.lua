local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Quickfix, see Telescope
keymap("n", "<leader>Q", ":cclose<CR>", opts)

-- Telescope related
keymap("n", "<leader>r", "<cmd>Telescope resume<cr>", opts)
-- show hidden files, except *.git, respect gitignore
-- keymap("n", "<leader>p", "<cmd>Telescope find_files find_command=rg,--hidden,--files,-g,!.git<cr>", opts)
-- or just use git_files
keymap("n", "<leader>p", "<cmd>Telescope git_files<cr>", opts)
keymap("n", "<leader>f", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>w", "<cmd>Telescope grep_string<cr>", opts)
keymap("n", "<leader>b", "<cmd>Telescope buffers<cr>", opts)
keymap("n", "<leader>m", "<cmd>Telescope marks<cr>", opts)
keymap("n", "<leader>q", "<cmd>Telescope quickfix<cr>", opts)

-- LazyGit and Tig
keymap("n", "<leader>g", "<cmd>:lua _LAZYGIT_TOGGLE()<cr>", opts)
keymap("n", "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", opts)
keymap("n", "<leader>gb", "<cmd>Gitsigns blame_line<cr>", opts)

-- Nvimtree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Neotest-rspec
-- Test the spec under the cursor
keymap("n", "<leader>t", "<cmd>:lua require('neotest').run.run()<cr>", opts)
-- Test the current rspec file
keymap("n", "<leader>tf", "<cmd>:lua require('neotest').run.run(vim.fn.expand('%'))<cr>", opts)
