-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Toggle comments
vim.keymap.set("n", "<leader>3", function()
  require("Comment.api").toggle.linewise.current()
end, { desc = "Toggle comment" })

-- Toggle comments in visual mode
vim.keymap.set(
  "v",
  "<leader>3",
  "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
  { desc = "Toggle comment" }
)

-- Buffer movements
vim.keymap.set("n", "<leader><left>", "<cmd>bprevious<cr>", { desc = "Previous buffer" })

vim.keymap.set("n", "<leader><Right>", "<cmd>bnext<cr>", { desc = "Next buffer" })

vim.keymap.set("n", "<leader><Up>", function()
  if vim.bo.filetype == "neo-tree" then
    vim.cmd.wincmd("p")
  else
    vim.cmd.Neotree("focus")
  end
end, { desc = "Toggle Neotree" })

vim.keymap.set("n", "<leader><Down>", function()
  local bd = require("bufdelete").bufdelete
  if vim.bo.modified then
    local choice = vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
    if choice == 1 then -- Yes
      vim.cmd.write()
      bd(0)
    elseif choice == 2 then -- No
      bd(0, true)
    end
  else
    bd(0)
  end
end, { desc = "Close Buffer" })

-- Autosave
vim.keymap.set("n", "<leader>ma", vim.cmd.ASToggle, { desc = "Autosave" })

-- Fun trick
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>", { desc = "Make it rain" })

-- Find all words
vim.keymap.set("n", "<leader>fw", "<cmd> Telescope live_grep <CR>", { desc = "Live grep" })

-- Telescope copy
vim.keymap.set('v', '<leader>fy', function()
  vim.api.nvim_input('y')
  vim.api.nvim_input('<cmd> Telescope live_grep <CR>')
  vim.api.nvim_input('<c-r>')
  vim.api.nvim_input('0')
end, { desc = 'Telescope yank' })

vim.keymap.set('n', '<leader>fy', function()
  vim.api.nvim_input('<cmd> Telescope live_grep <CR>')
  vim.api.nvim_input('<c-r>')
  vim.api.nvim_input('0')
end, { desc = 'Telescope yank' })

-- Open spec file from source file and vice versa
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'ruby',
  callback = function()
    vim.keymap.set("n", "<leader>r", function()
      local current_file = vim.fn.expand('%:p')
      local corresponding_file

      -- Detect if it's a source or test file
      if current_file:match('_spec%.') then
          corresponding_file = current_file:gsub('spec/', 'app/'):gsub('spec/lib/', 'lib/'):gsub('_spec%.', '.')
      else
          corresponding_file = current_file:gsub('app/', 'spec/'):gsub('lib/', 'spec/lib/'):gsub('%.%w+$', '_spec%0')
      end

      vim.cmd('edit ' .. corresponding_file)
    end, { desc = "Open spec from source file. viceversa" })
  end
})

-- Toggle relative line numbers
vim.keymap.set("n", "<leader>t", function()
  if vim.wo.relativenumber then
    vim.wo.relativenumber = false
    vim.wo.number = true
  else
    vim.wo.relativenumber = true
    vim.wo.number = false
  end
end, { desc = "Toggle line numbers" })

