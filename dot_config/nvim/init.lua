-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.opt.number = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- lazy.nvim
require("lazy").setup({
  spec = {
    -- add your plugins here
    'NMAC427/guess-indent.nvim', -- Detect tabstop and shiftwidth automatically
    {
      'Wansmer/langmapper.nvim',
      lazy = false,
      priority = 1, -- High priority is needed if you will use `autoremap()`
      config = function()
        require('langmapper').setup({--[[ your config ]]})
      end,
    },
    { 'kepano/flexoki-neovim', name = 'flexoki', priority = 99, lazy = false}
  },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

-- Styling
vim.cmd('colorscheme flexoki-dark')

-- Autoremap 
require('langmapper').automapping({ global = true, buffer = true })
