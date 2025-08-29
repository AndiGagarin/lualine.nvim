-- Extension for oil.nvim
local uv = vim.uv or vim.loop

local function getTypes(path)
  local fd = assert(uv.fs_opendir(path, nil, 10000))
  local entries = assert(uv.fs_readdir(fd))
  assert(uv.fs_closedir(fd))

  local types = {}
  for _, entry in pairs(entries) do
    types['total'] = (types['total'] or 0) + 1
    local index = entry.type
    types[index] = (types[index] or 0) + 1
    --  print (k, entry.name, entry.type)
  end
  return types
end

local function oil_stats()
  local filetypes = getTypes(require('oil').get_current_dir())
  return '  '
    .. (filetypes['file'] or '0')
    .. '  '
    .. (filetypes['directory'] or '0')
    .. '  '
    .. (filetypes['link'] or '0')
end

local function oil_location()
  local line = vim.fn.line('.')
  local total = vim.fn.line('$')
  local isdotdot = require('oil').get_entry_on_line(0, 1)
  if isdotdot and isdotdot.name == '..' then
    line = line - 1
    total = total - 1
  end
  return line .. ' of ' .. total
end

local M = {}

M.sections = {
  lualine_a = {
    {
      'mode',
      separator = { left = '', right = '' },
      fmt = function(str)
        return '󰁴  ' .. str:sub(1, 1)
      end,
    }, -- we DO use all the modes in Oil
  },
  lualine_b = {
    'branch', -- interesting for each and every directory we might encounter
    'oil_git_signs_diff', -- best extra ever
  },
  lualine_c = {
    {
      'pretty_path', -- beautify via lualine plugin's pretty path plugin's custom oil provider plugin
      directories = {
        enable = true,
        shorten = false, -- take everything we can get
      },

      highlights = {
        modified = 'Title',
        symbols = 'Title',
      },
      symbols = { -- current parent directory can never be new
        modified = '',
        readonly = '',
      },
      custom_icons = {
        oil = { '󱏒', 'OilDir' },
      },
      providers = {
        default = 'oil', -- wont encounter anything else inside this extension
      },
    },
  },
  lualine_x = {},
  lualine_y = {
    oil_stats,
  },
  lualine_z = {
    {
      oil_location,
      separator = { left = '', right = '' },
    },
  },
}

M.filetypes = { 'oil' }

return M
