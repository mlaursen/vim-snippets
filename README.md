# mlaursen-vim-snippets

Custom code snippets that should be used with [LuaSnip] or [UltiSnips].

## Installation

With [lazy.nvim] and [LuaSnip]:

```diff
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
+     "mlaursen/vim-react-snippets",
+     "mlaursen/mlaursen-vim-snippets",
    },
    ---@param opts cmp.ConfigSchema
    opts = function()
      vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
+     require("vim-react-snippets").lazy_load()
+     require("mlaursen-vim-snippets").lazy_load()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local compare = cmp.config.compare
```

With [vim-plug] and [UltiSnips]:

```diff
 Plug 'SirVer/ultisnips'
+Plug 'mlaursen/mlaursen-vim-snippets'
```

## Luasnip Template

```lua
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key
```

[luasnip]: https://github.com/L3MON4D3/LuaSnip
[ultisnips]: https://github.com/SirVer/ultisnips
[lazy.nvim]: https://github.com/folke/lazy.nvim
[vim-plug]: https://github.com/junegunn/vim-plug
