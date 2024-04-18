-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
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
      { '<C-n>', '<cmd>Neotree toggle<cr>', desc = 'NeoTree' },
    },
    config = function()
      require('neo-tree').setup {
        position = 'float',
      }
    end,
  },

  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require 'harpoon'
      harpoon:setup()

      vim.keymap.set('n', '<leader>ha', function()
        harpoon:list():add()
      end, { desc = 'Add to harpoon' })

      vim.keymap.set('n', '<leader>hc', function()
        harpoon.ui:toggle_quick_menu(harpoon:list():clear())
      end, { desc = 'Harpoon clear' })

      for i = 0, 9 do
        vim.keymap.set('n', '<C-' .. i .. '>', function()
          harpoon:list():select(i)
        end, { desc = 'Harpoon to ' .. i })
      end

      vim.keymap.set('n', '<A-Up>', function()
        harpoon:list():prev()
      end)
      vim.keymap.set('n', '<A-Down>', function()
        harpoon:list():next()
      end)

      -- basic telescope configuration
      local conf = require('telescope.config').values
      local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
          table.insert(file_paths, item.value)
        end

        require('telescope.pickers')
          .new({}, {
            prompt_title = 'Harpoon',
            finder = require('telescope.finders').new_table {
              results = file_paths,
            },
            previewer = conf.file_previewer {},
            sorter = conf.generic_sorter {},
          })
          :find()
      end

      vim.keymap.set('n', '<leader>hl', function()
        toggle_telescope(harpoon:list())
      end, { desc = 'Open harpoon window' })
    end,
  },

  {
    'NeogitOrg/neogit',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim', -- required
      'sindrets/diffview.nvim', -- optional - Diff integration

      -- Only one of these is needed, not both.
      'nvim-telescope/telescope.nvim', -- optional
    },
    config = true,
    keys = {

      { '<leader>ng', '<cmd> Neogit <CR>', desc = 'NeoGit' },
    },
  },

  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
    -- use opts = {} for passing setup options
    -- this is equalent to setup({}) function
  },

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

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {}
    end,
  },

  {
    'okuuva/auto-save.nvim',
    opts = {
      -- your config goes here
      -- or just leave it empty :)
    },
  },

  -- {
  --   'folke/noice.nvim',
  --   event = 'VeryLazy',
  --   opts = {
  --     -- add any options here
  --   },
  --   dependencies = {
  --     -- if you lazy-load any plugin below, make sure to add proper `module=` entries
  --     'MunifTanjim/nui.nvim',
  --     -- OPTIONAL:
  --     --   `nvim-notify` is only needed, if you want to use the notification view.
  --     --   If not available, we use `mini` as the fallback
  --     'rcarriga/nvim-notify',
  --   },
  --   config = function()
  --     require('noice').setup {
  --       lsp = {
  --         -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
  --         override = {
  --           ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
  --           ['vim.lsp.util.stylize_markdown'] = true,
  --           ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
  --         },
  --         hover = {
  --           enabled = false,
  --         },
  --         signature = {
  --           enabled = false,
  --         },
  --       },
  --       -- you can enable a preset for easier configuration
  --       --
  --       --
  --       cmdline = {
  --         enabled = true,
  --         view = 'cmdline_popup',
  --       },
  --
  --       messages = {
  --         enabled = false,
  --         view = 'mini',
  --         view_error = 'mini',
  --       },
  --
  --       presets = {
  --         bottom_search = true, -- use a classic bottom cmdline for search
  --         command_palette = true, -- position the cmdline and popupmenu together
  --         long_message_to_split = true, -- long messages will be sent to a split
  --         inc_rename = false, -- enables an input dialog for inc-rename.nvim
  --         lsp_doc_border = false, -- add a border to hover docs and signature help
  --       },
  --     }
  --   end,
  -- },

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
