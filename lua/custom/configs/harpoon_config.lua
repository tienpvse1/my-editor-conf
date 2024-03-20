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
      initial_mode = "normal",
      attach_mappings = function(prompt_buffer_number, map)
        map("n", "dd", function()
          local state = require "telescope.actions.state"
          local selected_entry = state.get_selected_entry()
          local current_picker = state.get_current_picker(prompt_buffer_number)
          harpoon:list():removeAt(selected_entry.index)
          current_picker:refresh(make_finder())
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
    "<leader>fa",
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
