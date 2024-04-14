local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s({
    trig = "table",
    name = "Table",
  }, {
    t("| "),
    i(1, "Column1"),
    t(" | "),
    i(2, "Column2"),
    t({ " | ", "" }),
    t({ "| ---- | ---- | ", "" }),
    t("| "),
    i(3, "Cell 1"),
    t(" | "),
    i(4, "Cell 3"),
    t({ " |", "" }),
  }),
  s({
    trig = "img",
    name = "Image",
  }, {
    t("!["),
    i(1, "alt text"),
    t("]("),
    i(2, "url"),
    t(") "),
  }),

  s({
    trig = "a",
    name = "Link",
  }, {
    t("["),
    i(1, "name"),
    t("]("),
    i(2, "path"),
    t(")"),
  }),
  s({
    trig = "code",
    name = "Code Block",
  }, {
    t("```"),
    i(1, "tsx"),
    t({ "", "" }),
    i(2),
    t({ "", "```" }),
  }),
}
