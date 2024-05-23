return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    keys = {
      { '<C-n>', '<cmd>Neotree toggle reveal<cr>', desc = 'NeoTree' },
    },
    config = function()
      require('neo-tree').setup {
        enable_git_status = true,
        position = 'float',
        default_component_configs = {
          filesystem = {
            follow_current_file = {
              enabled = false, -- This will find and focus the file in the active buffer every time
              --               -- the current file is changed while the tree is open.
              leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
            },
          },
        },
      }
    end,
  },
}
