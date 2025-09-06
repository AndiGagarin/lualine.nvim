local M = {}

M.sections = {
  lualine_a = {
    {
      separator = { left = '', right = '' },
      function()
        return '󰘥  help'
      end,
    },
  },
  lualine_b = { { 'filename', file_status = false } },
  lualine_y = { 'progress' },
  lualine_z = {
    {
      separator = { left = '', right = '' },
      'location',
    },
  },
}

M.filetypes = { 'help' }

return M
