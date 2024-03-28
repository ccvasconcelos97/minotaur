return {

  -- Make neo-tree hidden files visible
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      defaults = {
        file_ignore_patterns = {
          "node_modules",
          "assets",
          ".git",
          "vendor",
        },
      },
      filesystem = {
        bind_to_cwd = true,
        filtered_items = {
          visible = true,
        },
      },
    },
  },

  -- Add my whichkey group descs
  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<leader>m"] = { name = "+misc" },
      },
    },
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "graphql",
      })
    end,
  },

  -- Copilot
  {
    "zbirenbaum/copilot.lua",
    opts = {
      suggestion = { enabled = true },
    },
  },

  -- Blocks
  -- {
  --   "HampusHauffman/block.nvim",
  --   config = function()
  --     require("block").setup({
  --       percent = 0.8,
  --       depth = 4,
  --       colors = nil,
  --       automatic = true,
  --     })
  --   end,
  -- },

  -- For fun
  {
    "eandrju/cellular-automaton.nvim",
    lazy = false,
  },

  -- For <leader>/ mapping to toggle comments
  {
    "numToStr/Comment.nvim",
    lazy = false,
  },

  -- Just in case I run into some hex color codes
  {
    "norcalli/nvim-colorizer.lua",
    lazy = false,
  },

  -- For my delete buffer keymap
  {
    "famiu/bufdelete.nvim",
    lazy = false,
  },
  -- Autosave
  {
    "okuuva/auto-save.nvim",
    cmd = "ASToggle", -- optional for lazy loading on command
    event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
    opts = {
      enabled = true,
      execution_message = {
        enabled = true,
        message = function() -- message to print on save
          return "💾"
        end,
      },
    },
  },

  -- Noice routes
  {
    "folke/noice.nvim",
    opts = {
      routes = {
        {
          view = "mini",
          filter = { find = "💾" },
        },
      },
    },
  },

  -- Telescope layout change
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
          },
          vertical = {
            mirror = false,
          },
        },
      },
    },
  },

  -- Always show buffer line
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        always_show_bufferline = true,
        offsets = {
          {
            filetype = "neo-tree",
            highlight = "Directory",
            padding = 1,
          },
        },
      },
    },
  },

  -- My cool minotaur alpha
  {
    "goolord/alpha-nvim",
    lazy = false,
    opts = function()
      local dashboard = require("alpha.themes.dashboard")
      local logo = [[
                                                              _( (~\
       _ _                        /                          ( \> > \
   -/~/ / ~\                     :;                \       _  > /(~\/
  || | | /\ ;\                   |l      _____     |;     ( \/    > >
  _\\)\)\)/ ;;;                  `8o __-~     ~\   d|      \      //
 ///(())(__/~;;\                  "88p;.  -. _\_;.oP        (_._/ /
(((__   __ \\   \                  `>,% (\  (\./)8"         ;:'  i
)))--`.'-- (( ;,8 \               ,;%%%:  ./V^^^V'          ;.   ;.
((\   |   /)) .,88  `: ..,,;;;;,-::::::'_::\   ||\         ;[8:   ;
 )|  ~-~  |(|(888; ..``'::::8888oooooo.  :\`^^^/,,~--._    |88::  |
 |\ -===- /|  \8;; ``:.      oo.8888888888:`((( o.ooo8888Oo;:;:'  |
 |_~-___-~_|   `-\.   `        `o`88888888b` )) 888b88888P""'     ;
 ; ~~~~;~~         "`--_`.       b`888888888;(.,"888b888"  ..::;-'
   ;      ;              ~"-....  b`8888888:::::.`8888. .:;;;''
      ;    ;                 `:::. `:::OOO:::::::.`OO' ;;;''
 :       ;                     `.      "``::::::''    .'
    ;                           `.   \_              /
  ;       ;                       +:   ~~--  `:'  -';
                                   `:         : .::/
      ;                            ;;+_  :::. :..;;;
                                   ;;;;;;,;;;;;;;;,;
      ]]

      dashboard.section.header.val = vim.split(logo, "\n")

      -- other cool emojis I could use: 📦📓📔📕📗📘📙🗂️
      -- stylua: ignore
      dashboard.section.buttons.val = {
        dashboard.button("1", "📦" .. " profile-backend", "<cmd> cd ~/Developer/profile-backend <cr><cmd> Neotree <cr>"),
        dashboard.button("2", "📦" .. " job-preferences-backend", "<cmd> cd ~/Developer/job-preferences-backend <cr><cmd> Neotree <cr>"),
        dashboard.button("3", "📦" .. " profile-modules", "<cmd> cd ~/Developer/profile-modules <cr><cmd> Neotree <cr>"),
        dashboard.button("4", "📦" .. " new-work-one",    "<cmd> cd ~/Developer/xing-one <cr><cmd> Neotree <cr>"),
        dashboard.button("5", "📦" .. " obsidian",    "<cmd> cd ~/obsidian <cr><cmd> Neotree <cr>"),
        dashboard.button("c", "⚙️ " .. " nvim config",     "<cmd> cd ~/.config/nvim/lua <cr><cmd> Neotree <cr>"),
        dashboard.button("l", "💤" .. " Lazy",            "<cmd> Lazy <cr>"),
        dashboard.button("q", "👋" .. " Quit",            "<cmd> qa <cr>"),
      }
      for _, button in ipairs(dashboard.section.buttons.val) do
        button.opts.hl = "AlphaButtons"
        button.opts.hl_shortcut = "AlphaShortcut"
      end
      -- dashboard.section.header.opts.hl = "AlphaHeader"
      dashboard.section.header.opts.hl = "Constant"
      dashboard.section.buttons.opts.hl = "AlphaButtons"
      dashboard.section.footer.opts.hl = "AlphaFooter"
      -- dashboard.opts.layout[1].val = 5
      return dashboard
    end,
  },
}
