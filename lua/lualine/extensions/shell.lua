
local M = {}

M.sections = {
    lualine_a = {
      {
        "mode",
        fmt = function(str)
          return "  " .. str:sub(1, 1)
        end,
      },
    },
    lualine_b = {},
    lualine_c = {
      {
        "pretty_path", -- beautify via lualine plugin's pretty path plugin's custom terminal provider plugin
        providers = {
          "shell", -- wont encounter anything else inside this extension
        },
      },
    },
    lualine_x = {
      {
        "pretty_path", -- beautify via lualine plugin's pretty path plugin's custom terminal provider plugin
        providers = {
          "terminal", -- wont encounter anything else inside this extension
        },
      },
    },
    lualine_y = {},
    lualine_z = {},
}

M.filetypes = { "shell" }

return M

