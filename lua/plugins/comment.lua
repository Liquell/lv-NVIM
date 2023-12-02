return {
  {
    "terrortylor/nvim-comment",
    keys = {
      {
        "<leader>/",
        mode = { "n", "v" },
        ":CommentToggle<CR>",
        desc = "Comment line",
        opts = { noremap = true, silent = true },
      },
    },
  },
}
