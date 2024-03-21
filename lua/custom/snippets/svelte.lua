local ls = require "luasnip"

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local typescriptScript = s("tsscript", {
  t { '<script lang="ts">', "" },
  t "  ",
  i(1, "// do stuffs..."),
  t { "", "</script>" },
})

ls.add_snippets("svelte", {
  typescriptScript,
})
