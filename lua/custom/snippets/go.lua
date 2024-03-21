local ls = require "luasnip"
ls.setup {}

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fiberJsonResponse = s("jsonfiber", {
  t { "c.", "" },
  t " Status(fiber.",
  i(1, "Status"),
  t { ").", "" },
  t " JSON(",
  i(2, "json"),
  t ")",
})

ls.add_snippets("go", {
  fiberJsonResponse,
})
