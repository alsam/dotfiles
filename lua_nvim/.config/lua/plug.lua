-- [[ plug.lua ]]

return require('packer').startup(function(use)
  -- [[ Plugins Go Here ]]
  use 'wbthomason/packer.nvim' -- Package manager
  use 'neovim/nvim-lspconfig'  -- Configurations for Nvim LSP
  use {                                              -- filesystem navigation
   'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons'        -- filesystem icons
  }

-- [[ Theme ]]
  use { 'mhinz/vim-startify' }                       -- start screen
  use { 'DanilaMihailov/beacon.nvim' }               -- cursor jump
  use {
    'nvim-lualine/lualine.nvim',                     -- statusline
    requires = {'kyazdani42/nvim-web-devicons',
                opt = true}
  }
  use { 'Mofiqul/dracula.nvim' }                     -- colorscheme
  use { 'ms-jpq/coq_nvim' }
end) --,
--config = { package_root = vim.fn.stdpath('config') .. '/site/pack' })
