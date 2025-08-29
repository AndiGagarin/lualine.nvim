local M = {}

M.sections = {
  lualine_a = {
    {
      separator = { left = '', right = '' },
      function()
        return '  ' .. 'lazygit'
      end,
    },
  },
  lualine_b = {},
  lualine_c = {
    function()
      return vim.fn.getcwd()
    end,
  },
  lualine_x = {
    {
      'pretty_path', -- beautify via lualine plugin's pretty path plugin's custom terminal provider plugin
      providers = {
        default = 'terminal', -- wont encounter anything else inside this extension
      },
    },
  },
  lualine_y = {},
  lualine_z = {},
}

M.filetypes = { 'lazygit' }

return M
