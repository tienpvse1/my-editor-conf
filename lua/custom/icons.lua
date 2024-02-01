local Config = {
  override_by_filename = {
    [".gitignore"] = {
      icon = "",
      color = "#f1502f",
      name = "Gitignore",
    },

    ["vite.config.ts"] = {
      icon = "󱐋",
      color = "yellow",
      name = "ViteConfig",
    },

    ["vitest.config.ts"] = {
      icon = "󱐋",
      color = "#7EC8E3",
      name = "VitestConfig",
    },
  },

  override_by_extension = {
    ["log"] = {
      icon = "",
      color = "#81e043",
      name = "Log",
    },
    ["graphql"] = {
      icon = "󰡷",
      name = "Graphql",
    },
    ["sql"] = {
      icon = "",
      name = "PostgreSQL",
    },
  },
}

return Config
