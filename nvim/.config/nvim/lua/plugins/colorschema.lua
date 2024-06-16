return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      -- compatition for transparent_background
      vim.o.cursorlineopt = "number"
      require("catppuccin").setup({
        flavour = "mocha",
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
