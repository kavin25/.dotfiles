-- https://intelephense.com
require('lspconfig').intelephense.setup {
  on_attach = function(client, bufnr)
    -- Do not autoformat PHP
    client.resolved_capabilities.document_formatting = false
    require('k.plugins.lsp').on_attach(client, bufnr)
  end,
  capabilities = require('k.plugins.lsp').capabilities,
  settings = {
    intelephense = {
      environment = {
        shortOpenTag = true,
      },
      format = {
        enable = false,
      },
    },
  },
  flags = {
    debounce_text_changes = 150,
  },
}
