return {
  {
    'Sonicfury/scretch.nvim',
    event = 'VeryLazy',
    config = function()
      local scretch = require 'scretch'
      vim.keymap.set('n', '<leader>tsc', scretch.new_named, { desc = 'Create Scratch' })
      vim.keymap.set('n', '<leader>tss', scretch.search, { desc = 'Search Scratch' })
    end,
  },
}
