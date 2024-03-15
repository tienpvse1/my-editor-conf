---@type MappingsTable
local M = {}

M.general = {
  i = {
    ["<C-s>"] = { "<ESC><cmd> w <CR>", "Save file" },
  },
  n = {

    ["<leader>d"] = { "<cmd>DBUIToggle<CR>", "Save file" },
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
