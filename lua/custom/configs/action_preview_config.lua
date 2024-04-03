return {
  {
    "<leader>ca",
    function()
      vim.lsp.buf.code_action()
    end,
    desc = "action preview: display",
  },
}
