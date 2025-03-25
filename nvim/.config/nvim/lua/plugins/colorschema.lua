return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      -- compatition for transparent_background
      vim.o.cursorlineopt = "number"
      local function is_dark_mode()
        -- Check system appearance if possible
        -- This is a simple implementation and might need adjustment based on your OS
        local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
        if handle then
          local result = handle:read("*a")
          handle:close()
          return result:match("Dark") ~= nil
        end
        -- Default to dark if we can't determine
        return true
      end

      require("catppuccin").setup({
        flavour = is_dark_mode() and "mocha" or "latte",
        transparent_background = true,
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
