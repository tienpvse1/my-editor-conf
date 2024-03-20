---@type MappingsTable
local M = {}
M.general = {
  i = {
    ["<C-s>"] = { "<ESC><cmd> w <CR>", "Save file" },
  },
  n = {

    ["<A-l>"] = {
      "<cmd>LazyGit <cr>",
      "Open lazygit",
    },
    ["-"] = {
      "<cmd>vertical resize +5<cr>",
      "Decrease window height",
    },

    ["="] = {
      "<cmd>vertical resize -5<cr>",
      "Increase window height",
    },
    ["+"] = {
      "<cmd>horizontal resize +2<cr>",
      "Increase window width",
    },
    ["_"] = {
      "<cmd>horizontal resize -2<cr>",
      "Decrease window height",
    },
    ["<leader>db"] = { "<cmd>DBUIToggle<CR>", "Save file" },
    --  format with conform
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "formatting",
    },

    ["<leader>i"] = {
      function()
        vim.diagnostic.open_float()
      end,
      "open floating diagnostic",
    },
  },
  v = {
    [">"] = { ">gv", "indent" },
  },
}

-- more keybinds!

return M
