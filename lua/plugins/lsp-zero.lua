return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies =  {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/nvim-cmp',
        'L3MON4D3/LuaSnip',
        'mfussenegger/nvim-dap',
        'mfussenegger/nvim-jdtls'
    },
    config = function ()
        local lsp_zero = require('lsp-zero')

        lsp_zero.on_attach(function(client, bufnr)
          -- see :help lsp-zero-keybindings
          -- to learn the available actions
          lsp_zero.default_keymaps({buffer = bufnr})
        end)

        lsp_zero.setup()
        --- if you want to know more about lsp-zero and mason.nvim
        --- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
        require('mason').setup({})
        require('mason-lspconfig').setup({
          ensure_installed = {'jdtls'},
          handlers = {
            function(server_name)
             require('lspconfig')[server_name].setup({})
            end,
            -- this is the "custom handler" for `jdtls`
            -- noop is an empty function that doesn't do anything
            jdtls = lsp_zero.noop,
          },
        })
    end,
}
