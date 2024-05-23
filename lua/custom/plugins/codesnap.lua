return {
  {
    'mistricky/codesnap.nvim',
    build = 'make',
    keys = {
      { '<leader>s', ':CodeSnap<cr>', mode = 'x', { desc = 'Snapshot Code Selection to Clipboard' } },
    },
    config = function()
      require('codesnap').setup {
        bg_theme = 'bamboo',
        has_breadcrumbs = true,
      }
    end,
  },
}
