return {
  {
    "kylechui/nvim-surround",
    version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
},
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },
{
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    opts = function()
      return require "nvchad.configs.nvimtree"
    end,
  },
  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  { 'wakatime/vim-wakatime', lazy = false },
  {
  "CRAG666/code_runner.nvim",
  config = function()
    require("code_runner").setup({
      filetype = {
        python = "python3 -u",
        java = "javac $fileName && java $fileNameWithoutExt",
        cpp = "g++ $fileName -o $fileNameWithoutExt && ./$fileNameWithoutExt",
        c = "gcc $fileName -o $fileNameWithoutExt && ./$fileNameWithoutExt",
        javascript = "node",
      },
    })
  end,
  cmd = { "RunCode" }, -- optional but helps lazy-load only when needed
},
  {
  "Pocco81/auto-save.nvim",
  config = function()
    require("auto-save").setup({
      enabled = true,
      execution_message = {
        message = function() return "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S") end,
        dim = 0.18,
        cleaning_interval = 1250,
      },
      events = { "InsertLeave", "TextChanged" },
      condition = function(buf)
        return vim.bo[buf].modifiable and vim.bo[buf].filetype ~= ""
      end,
    })
  end,
  event = "BufReadPre",
},
  -- custom/plugins.lua or lazy.lua
{
  "williamboman/mason-lspconfig.nvim",
  opts = {
    ensure_installed = { "pyright" }, -- optional: auto-installs
    automatic_installation = true,
  },
},
{
  "christoomey/vim-tmux-navigator",
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
    "TmuxNavigatorProcessList",
  },
  keys = {
    { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
    { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
    { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
    { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
    { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
  },
},
  {
  "olrtg/nvim-emmet",
  config = function()
    vim.keymap.set({ "n", "v" }, '<leader>xe', require('nvim-emmet').wrap_with_abbreviation)
  end,
},

  --test new blink
  { import = "nvchad.blink.lazyspec" },

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc",
       "html", "css"
  		},
  	},
  },
{
  "nvim-tree/nvim-tree.lua",
  opts = {
    filters = {
      dotfiles = false,
      git_ignored = false, -- Show .gitignore'd files
    },
  },
},
  {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      file_ignore_patterns = {}, -- optional: remove other filters too
    },
    pickers = {
      find_files = {
        hidden = true,         -- Show dotfiles
        no_ignore = true,      -- Show .gitignored files
        follow = true,         -- Follow symlinks if any
      },
    },
  },
},
 {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = "cd app && yarn install",
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
  ft = { "markdown" },
},
 {
  "MaximilianLloyd/ascii.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
} 

}
