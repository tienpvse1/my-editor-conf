local telescope = require("telescope")
local dropdown_configs = {
  layout_strategy = "vertical",
  layout_config = {
    prompt_position = "bottom",
    vertical = {
      width = 0.8,
      height = 100,
    },
  },
}

telescope.setup {
  defaults = require("telescope.themes").get_dropdown(dropdown_configs),
}

telescope.setup {
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        dropdown_configs,
      },
    },
  },
}
telescope.load_extension "ui-select"
