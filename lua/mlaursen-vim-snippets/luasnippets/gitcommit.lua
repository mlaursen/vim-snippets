local ls = require("luasnip")
local util = require("mlaursen-vim-snippets.util")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node

--- Sorted by my used
--- @type string[]
local commit_types = {
  "chore",
  "fix",
  "feat",
  "build",
  "test",
  "refactor",
  "docs",
  "ci",
}

local create_choices = function()
  --- @type unknown[]
  local choices = {}
  for _, type in pairs(commit_types) do
    table.insert(choices, (type == "chore" and i(nil, type)) or t(type))
  end

  return choices
end

--- @param type string
--- @param breaking boolean
local create_type = function(type, breaking)
  local is_choice = type == "cc" or type == "bc"
  local start = (is_choice and 2) or 1
  local desc = (is_choice and "type" or type) .. "(scope)" .. (breaking and "!" or "") .. ": title"
  local trig = type .. (not is_choice and breaking and "!" or "")

  return s({
    trig = trig,
    name = type .. " conventional commit",
    desc = desc,
  }, {
    is_choice and c(1, create_choices()) or t(type),
    t("("),
    i(start, "scope"),
    t(")" .. (breaking and "!" or "") .. ": "),
    i(start + 1, "title"),
    t({ "", "", "" }),
    i(0),
  })
end

local false_true = { false, true }

--- @type unknown[]
local snippets = {
  create_type("cc", false),
  create_type("cb", true),

  s({
    trig = "cct",
    name = "Conventional Commit Ticket",
  }, {
    c(1, create_choices()),
    t("("),
    f(function()
      return util.current_branch()
    end),
    t("): "),
    i(2, "title"),
    t({ "", "", "" }),
    i(0),
  }),
}
for _, breaking in ipairs(false_true) do
  for _, type in ipairs(commit_types) do
    table.insert(snippets, create_type(type, breaking))
  end
end

return snippets