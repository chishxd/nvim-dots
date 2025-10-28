require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "pyright", "ruff"}
vim.lsp.enable(servers)

-- to configure lsps further read :h vim.lsp.config
vim.lsp.config('pyright',{
  settings = {
    pyright = {
      -- Using Ruff's import organizer
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        -- Ignore all files for analysis to exclusively use Ruff for linting
        ignore = { '*' },
      },
    },
  },
})

-- by default lsp config sets K in normal mode to hover with no border
-- https://github.com/neovim/nvim-lspconfig?tab=readme-ov-file#configuration
-- manually overriding the mapping passing in the border style
vim.keymap.set({ "n" }, "K", function()
  vim.lsp.buf.hover { border = "rounded" }
end, { desc = "LSP show details", silent = true })

-- sets border for diagnostics and opens them on jump in a floating window
vim.diagnostic.config {
  jump = {
    float = true,
  },
  float = {
    border = "rounded",
  },
}
