-- local bubbles_theme = {
--   normal = {
--     a = { fg = colors.white, bg = colors.blue },
--   },

--   insert = {
--     a = { fg = colors.darkblue, bg = colors.violet },
--   },
--   visual = {
--     a = { fg = colors.black, bg = colors.cyan },
--   },
--   replace = {
--     a = { fg = colors.black, bg = colors.red },
--   },
-- }
local icons = require "magnus.icons"

local colors = {
  bg        = '#303030',
  fg        = '#bbc2cf',
  lightGrey = '#202328',
  grey      = '#9b9b9b',
  yellow    = '#ECBE7B',
  cyan      = '#008080',
  darkblue  = '#081633',
  green     = '#98be65',
  orange    = '#FF8800',
  violet    = '#a9a1e1',
  violet2   = '#7272AB',
  pruebaFg  = '#12151B',
  pruebaMod = '#7272AB',
  pruebaBg  = '#12151B',
  magenta   = '#c678dd',
  blue      = '#51afef',
  white     = '#ffffff',
  red       = '#ec5f67',
  black     = '#080808',
}

local ll = require('lualine')

ll.setup {
  options = {
    globalstatus = true,
    theme = 'auto',
    disabled_filetypes = {},
    component_separators = '',
    section_separators = '',
  },
  sections = {
    lualine_a = {
      {
        'mode',
        separator = { right = icons.sep.leftBub },
        padding = { right = 1, left = 1 }
      },
    },
    lualine_b = {
      {
        'branch',
        separator = { right = icons.sep.leftBub},
        icon = '',
        color = { fg = colors.violet, gui = 'bold' },
      },
      {
        'diff',
        separator = { right = icons.sep.leftBub },
        symbols = { added = ' ', modified = ' ', removed = ' ' },
        diff_color = {
          added = { fg = colors.blue },
          modified = { fg = colors.violet },
          removed = { fg = colors.red },
        },
      },
    },
    lualine_c = {},
    lualine_x = {
    },
    lualine_y = {
      {
        'diagnostics',
        separator = { left = icons.sep.rightBub },
        sources = { 'nvim_diagnostic' },
        symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
        diagnostics_color = {
          color_error = { fg = colors.red },
          color_warn = { fg = colors.yellow },
          color_info = { fg = colors.cyan },
        },
      },
      { 'filetype',
        separator = { left = icons.sep.rightBub }
      },
    },
    lualine_z = {
      {
        function()
          return icons.random.text2
        end,
        separator = { left = icons.sep.rightBub },
        padding = 0
      },
      { '%l:%c',
        padding = 1,
      },
      { '%p%%',
        padding = { left = 0, right = 1 },
      },
    },
  },
}
