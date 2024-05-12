local util = require("mlaursen-vim-snippets.util")
local ls = require("luasnip")

local s = ls.snippet
local f = ls.function_node

return {
  s({
    trig = "gcb",
    name = "Git Current Branch",
  }, {
    f(function()
      return util.current_branch()
    end),
  }),
}