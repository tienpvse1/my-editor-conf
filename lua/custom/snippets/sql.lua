local ls = require "luasnip"
ls.setup {}

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local createTable = s("createt", {
  t("CREATE TABLE "),
  i(1, "tableName"),
  t("("),
  i(2, "key"),
  t(")")
})

ls.add_snippets("sql", {
  createTable
})

