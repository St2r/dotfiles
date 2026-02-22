vim.keymap.set("n", "/", function()
  local vscode = require("vscode")
  -- local curr_line = 0
  vscode.action("editor.actions.findWithArgs", {
    -- range = { curr_line + 1, curr_line + 3 },
  })
end, {
  noremap = true,
  silent = true,
  desc = "Open VS Code search bar from visual mode",
})
