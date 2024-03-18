local ls = require "luasnip"
ls.setup {}
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local ternary = s("ternary", {
  i(1, "cond"),
  t " ? ",
  i(2, "then"),
  t " : ",
  i(3, "else"),
})
ls.add_snippets("typescript", {
  ternary,
})

ls.add_snippets("javascript", {
  ternary,
})

ls.add_snippets("typescriptreact", {
  ternary,
})
ls.add_snippets("javascriptreact", {
  ternary,
})
