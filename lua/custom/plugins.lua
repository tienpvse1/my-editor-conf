local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "smjonas/inc-rename.nvim",
    config = function()
      require("inc_rename").setup()
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
    dependencies = {
      { "windwp/nvim-ts-autotag", "HiPhish/nvim-ts-rainbow2" },
    },
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "stevearc/conform.nvim",
    --  for users those who want auto-save conform + lazyloading!
    -- event = "BufWritePre"
    config = function()
      require "custom.configs.conform"
    end,
  },
  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  { "akinsho/git-conflict.nvim", version = "*", config = true },
  -- lazy.nvim
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },
  {
    "folke/noice.nvim",
    config = function()
      require("noice").setup {
        views = {
          split = {
            enter = true,
          },
        },
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
          },
        },
        notify = {
          enabled = false,
          view = "notify",
        },
        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = false, -- use a classic bottom cmdline for search
          command_palette = false, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = true, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false, -- add a border to hover docs and signature help
        },
      }
    end,
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "smjonas/inc-rename.nvim",
    },
  },

  {
    "theprimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("harpoon"):setup()
    end,
    keys = function()
      local harpoon = require "harpoon"
      -- basic telescope configuration
      local conf = require("telescope.config").values
      local function toggle_telescope(harpoon_files)
        local file_paths = {}
        local make_finder = function()
          local paths = {}
          for _, item in ipairs(harpoon_files.items) do
            table.insert(paths, item.value)
          end

          return require("telescope.finders").new_table {
            results = paths,
          }
        end
        for _, item in ipairs(harpoon_files.items) do
          table.insert(file_paths, item.value)
        end

        require("telescope.pickers")
          .new({}, {
            prompt_title = "Jump list",
            finder = require("telescope.finders").new_table {
              results = file_paths,
            },
            previewer = conf.file_previewer {},
            sorter = conf.generic_sorter {},
            attach_mappings = function(prompt_buffer_number, map)
              map("n", "dd", function()
                local state = require "telescope.actions.state"
                local selected_entry = state.get_selected_entry()
                local current_picker = state.get_current_picker(prompt_buffer_number)

                harpoon:list():removeAt(selected_entry.index)
                current_picker:refresh(make_finder())
                -- current_picker:set_selection(selected_entry.index)
              end)

              return true
            end,
          })
          :find()
      end
      return {
        {
          "<C-S-P>",
          function()
            harpoon:list():prev()
          end,
          desc = "harpoon: previous",
        },
        {
          "<C-S-N>",
          function()
            harpoon:list():next()
          end,
          desc = "harpoon: next",
        },
        {
          "<leader>a",
          function()
            harpoon:list():append()
          end,
          desc = "harpoon file",
        },
        {
          "<leader>A",
          function()
            toggle_telescope(harpoon:list())
          end,
          desc = "harpoon quick menu",
        },
        {
          "<leader>1",
          function()
            harpoon:list():select(1)
          end,
          desc = "harpoon to file 1",
        },
        {
          "<leader>2",
          function()
            harpoon:list():select(2)
          end,
          desc = "harpoon to file 2",
        },
        {
          "<leader>3",
          function()
            harpoon:list():select(3)
          end,
          desc = "harpoon to file 3",
        },
        {
          "<leader>4",
          function()
            harpoon:list():select(4)
          end,
          desc = "harpoon to file 4",
        },
        {
          "<leader>5",
          function()
            harpoon:list():select(5)
          end,
          desc = "harpoon to file 5",
        },
        {
          "<leader>rm",
          function()
            harpoon:list():remove()
          end,
          desc = "harpoon remove current index",
        },
      }
    end,
  },
}

return plugins
