return {
  'nvim-java/nvim-java',
  config = function()
    require('lspconfig').jdtls.setup({})
  end
}
