return {
  {
    "AckslD/nvim-neoclip.lua",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require('neoclip').setup()
      vim.keymap.set('n', '<C-a>', ':Telescope neoclip<CR>', { noremap = true, silent = true })
    end
  },
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup({
        manual_mode = false, -- Auto-detect projects without opening first
        detection_methods = { "lsp", "pattern" },
        patterns = { ".git", "Gemfile", "package.json", "yarn.lock" },
        silent_chdir = false,                                 -- Folder change ka prompt dega
        scope_chdir = "global",                               -- Global project tracking
        datapath = vim.fn.stdpath("data") .. "/project_nvim", -- Save project list
      })
      vim.keymap.set('n', '<leader>fp', ':Telescope projects<CR>', { noremap = true, silent = true })
    end
  },
{
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {},
  config = function()
    require("flash").setup({
      labels = "asdfghjklqwertyuiopzxcvbnm", -- Easy keys for jumping
      modes = {
        search = { enabled = true }, -- `/` ke saath flash enable
        char = { enabled = true },   -- Sneak-like motion
        treesitter = { enabled = true }, -- Better syntax jumps
      }
    })

    -- Keymaps for Flash.nvim
    vim.keymap.set({ "n", "x", "o" }, "s", function() require("flash").jump() end, { noremap = true, silent = true })
    vim.keymap.set({ "n", "o", "x" }, "S", function() require("flash").treesitter() end, { noremap = true, silent = true })
    vim.keymap.set({ "o" }, "<C-e>", function() require("flash").remote() end, { noremap = true, silent = true })
  end
}
}
