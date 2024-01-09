-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Remove default keymappings
vim.keymap.del("n", "<leader>/")

-- Toggle comments
vim.keymap.set("n", "<leader>/", function()
  require("Comment.api").toggle.linewise.current()
end, { desc = "Toggle comment" })

vim.keymap.set(
  "v",
  "<leader>/",
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
vim.keymap.set("n", "<leader>n", vim.cmd.ASToggle, { desc = "Autosave" })

-- Find all words
vim.keymap.set("n", "<leader>fw", "<cmd> Telescope live_grep <CR>", { desc = "Live grep" })

-- Fun trick
vim.keymap.set("n", "<leader>m", "<cmd>CellularAutomaton make_it_rain<CR>", { desc = "Make it rain" })
