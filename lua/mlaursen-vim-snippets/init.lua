local extension_name = "mlaursen-vim-snippets"

--- @return string
local get_snippet_path = function()
  local snippets = vim.api.nvim_get_runtime_file("lua/" .. extension_name .. "/init.lua", false)[1]
  if snippets == nil or snippets == "" then
    error("Unable to find " .. extension_name .. " path")
  end

  return (snippets:gsub("init.lua", "luasnippets"))
end

return {
  load = function()
    require("luasnip.loaders.from_lua").load({
      paths = { get_snippet_path() },
    })
  end,
  lazy_load = function()
    require("luasnip.loaders.from_lua").lazy_load({
      paths = { get_snippet_path() },
    })
  end,
}
