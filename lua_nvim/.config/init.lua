--[[ init.lua ]]

-- LEADER
-- These keybindings need to be defined before the first /
-- is called; otherwise, it will default to "\"
vim.g.mapleader = ","
vim.g.localleader = "\\"

-- IMPORTS
require('vars')      -- Variables
require('opts')      -- Options
require('keys')      -- Keymaps
require('plug')      -- Plugins

-- PLUGINS
require('nvim-tree').setup{}
-- Add the block below
require('lualine').setup {
  options = {
    theme = 'dracula-nvim'
  }
}

-- require'lspconfig'.pyright.setup{}
require'lspconfig'.pyre.setup{}
require'lspconfig'.clangd.setup{}
require'lspconfig'.cmake.setup{}
require'lspconfig'.rust_analyzer.setup{}

--    [Getting started using Lua in Neovim](https://github.com/nanotee/nvim-lua-guide) 
--
--    [Floaterm](https://github.com/voldikss/vim-floaterm):
--      floating terminal manager.
--    [Impatient](https://github.com/lewis6991/impatient.nvim):
--      improve Neovim’s startup time.
--    [Commentary](https://github.com/tpope/vim-commentary):
--      quickly toggle comments in a variety of programming languages.
--    [Undotree](https://github.com/mbbill/undotree):
--      persistent undo; reverse changes even after a file has been closed.
--    [Vimwiki](https://github.com/vimwiki/vimwiki):
--      craft a personal knowledgebase, entirely in Neovim.
--    [Surround](https://github.com/tpope/vim-surround):
--      easily surround chunks of text with brackets, quotes, tags, and more.
--    [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter):
--      and related Language Server Protocol (LSP) tools.
