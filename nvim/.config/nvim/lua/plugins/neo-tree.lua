return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    config = true,
    opts = {
      default_component_configs = {
        git_status = {
          symbols = {
            -- change type
            added = "+",
            modified = " ",
            deleted = "-",
            renamed = " ",
            -- status type
            untracked = "?",
            ignored = " ",
            unstaged = " ",
            staged = " ",
            conflict = "!",
          },
        },
      },
    },
  },
}
