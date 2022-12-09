local M = {}

function M.wait_for_lsp_initialization()
  if not _G.initialized then
    vim.wait(10000, function()
      return _G.initialized
    end, 10)
    -- to be sure everything is setup correctly wait a bit
    vim.wait(1000)
  end
end

function M.open_file(file)
  local cwd = vim.fn.getcwd()

  if not string.find(cwd, "ts_project", 1, true) then
    vim.cmd ":cd tests/ts_project"
  end

  vim.cmd(":e " .. file)
end

function M.get_text_document()
  return { uri = vim.uri_from_bufnr(0) }
end

function M.make_position(line, character)
  return { line = line, character = character }
end

return M