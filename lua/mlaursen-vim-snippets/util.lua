local M = {}

M.current_branch = function()
  local branch = ""
  if vim.fn.exists(":Git") then
    branch = vim.fn.FugitiveHead()
  else
    branch = vim.fn.system("git branch --show-current")
  end
  local ticket = branch:gsub("%s", ""):gsub("^(.+/)", "")
  return ticket or branch
end

return M
