return {
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
}
