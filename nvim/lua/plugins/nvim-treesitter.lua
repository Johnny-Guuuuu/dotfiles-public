return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    vim.list_extend(opts.ensure_installed, {
      "javascript",
      "typescript",
      "vue",
      "json",
      "css",
      "html",
      "lua",
      "bash",
      "markdown",
      "markdown_inline",
      "yaml",
    })
  end,
}
