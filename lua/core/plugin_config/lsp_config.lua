require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = { 'lua_ls', 'jedi_language_server', 'texlab', 'html', 'clangd' },
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
  end,
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').lua_ls.setup {
  capabilities = capabilities
}
require('lspconfig').jedi_language_server.setup {
  capabilities = capabilities
}
require('lspconfig').texlab.setup {
  capabilities = capabilities
}
require('lspconfig').html.setup {
  capabilities = capabilities
}
require('lspconfig').clangd.setup {
  capabilities = capabilities
}


