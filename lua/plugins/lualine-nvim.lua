-- Status line
return {
  -- https://github.com/nvim-lualine/lualine.nvim
  'nvim-lualine/lualine.nvim',
  dependencies = {
    -- https://github.com/nvim-tree/nvim-web-devicons
    'nvim-tree/nvim-web-devicons', -- fancy icons
    -- https://github.com/linrongbin16/lsp-progress.nvim
    'linrongbin16/lsp-progress.nvim', -- LSP loading progress
  },
  opts = {
    options = {
      -- For more themes, see https://github.com/nvim-lualine/lualine.nvim/blob/master/THEMES.md
      theme = "codedark", -- "auto, tokyonight, catppuccin, codedark, nord" 
    },
    sections = {
      lualine_a = { 'mode' }, -- Add mode to the left section
      lualine_b = { 'branch' }, -- Add branch to the left section
      lualine_c = {
        {
          -- Customize the filename part of lualine to be parent/filename
          'filename',
          file_status = true,      -- Displays file status (readonly status, modified status)
          newfile_status = false,  -- Display new file status (new file means no write after created)
          path = 4,                -- 0: Just the filename
          symbols = {
            modified = '[+]',      -- Text to show when the file is modified.
            readonly = '[-]',      -- Text to show when the file is non-modifiable or readonly.
          }
        }
      },
      lualine_x = { 'encoding', 'fileformat', 'filetype' }, -- Add encoding, file format, and file type
      lualine_y = { 'progress' }, -- Add progress to the right section
      lualine_z = { 'location' }, -- Add location to the right section
    },
    tabline = {
      lualine_a = { 'buffers' }, -- Show buffer tabs
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },
    extensions = {  }, -- Optional extensions
  }
}

