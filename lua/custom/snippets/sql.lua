local ls = require "luasnip"
ls.setup {}

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local dropColumn = s("dropc", {
  t "ALTER TABLE ",
  i(1, "tableName"),
  t " DROP COLUMN ",
  i(2, "columnName"),
})

local renameColumn = s("renamec", {
  t "ALTER TABLE ",
  i(1, "tableName"),
  t " RENAME COLUMN ",
  i(2, "oldColumnName"),
  t " TO ",
  i(3, "newColumnName"),
})

local createTrigger = s("createTrigger", {
  t "CREATE FUNCTION ",
  i(1, "triggerName"),
  t "()",
  t { "", "RETURNS trigger AS $BODY$ ", "" },
  t { "", "BEGIN", "" },
  i(2, "-- do stuffs..."),
  t { "", "RETURN NEW;", "" },
  t { "", "END;", "" },
  t { "", "$BODY$ LANGUAGE plpgsql;", "" },
})

local applyTrigger = s("applyTrigger", {
  t "CREATE TRIGGER ",
  i(1, "triggerName"),
  t " ",
  i(2, "event"),
  t " ON ",
  i(3, "table"),
  t " FOR EACH ROW EXECUTE PROCEDURE ",
  i(4, "triggerFunctionName"),
})

local constraint = s("constraint", {
  t "CONSTRAINT ",
  i(1, "constraint name"),
})

ls.add_snippets("sql", {
  dropColumn,
  renameColumn,
  createTrigger,
  applyTrigger,
  constraint,
})
