return {
  {
    'laytan/cloak.nvim',
    config = function()
      require('cloak').setup {
        enabled = true,
        cloak_length = 32,
      }
    end,
  },
}
