local lsp = require('feline.providers.lsp')
local vi_mode_utils = require('feline.providers.vi_mode')

local properties = {
    force_inactive = {
        filetypes = {},
        buftypes = {},
        bufnames = {}
    }
}

local components = {
    active = {},
    inactive = {}
}
properties.force_inactive.filetypes = {
    'NvimTree',
    'dbui',
    'packer',
    'startify',
    'fugitive',
    'fugitiveblame'
}

properties.force_inactive.buftypes = {
    'terminal'
}

-- table.insert(components.active[1], {
--     provider = '▊ ',
--     hl = {
--         fg = 'skyblue',
--     }
-- })
-- components.active[1][1] = {
--     provider = '▊ ',
--     hl = {
--         fg = 'skyblue'
--     }
-- }

-- table.insert(components.active[1], {
--     provider = 'vi_mode',
--     hl = function()
--         local val = {}

--         val.name = vi_mode_utils.get_mode_highlight_name()
--         val.fg = vi_mode_utils.get_mode_color()
--         val.style = 'bold'

--         return val
--     end,
--     right_sep = ' '
-- })

-- table.insert(components.active[1], {
--     provider = 'file_info',
--     hl = {
--         fg = 'white',
--         bg = 'oceanblue',
--         style = 'bold'
--     },
--     left_sep = { ' ', 'slant_left_2' },
--     right_sep = { 'slant_right_2', ' ' }
-- })

-- table.insert(components.active[1], {
--     provider = 'file_size',
--     enabled = function() return vim.fn.getfsize(vim.fn.expand('%:t')) > 0 end,
--     right_sep = {
--         ' ',
--         {
--             str = 'slant_left_2_thin',
--             hl = {
--                 fg = 'fg',
--                 bg = 'bg'
--             }
--         },
--         ' '
--     }
-- })

-- table.insert(components.active[1], {
--     provider = 'position',
--     right_sep = {
--         ' ',
--         {
--             str = 'slant_right_2_thin',
--             hl = {
--                 fg = 'fg',
--                 bg = 'bg'
--             }
--         }
--     }
-- })

-- table.insert(components.active[1], {
--     provider = 'diagnostic_errors',
--     enabled = function() return lsp.diagnostics_exist('Error') end,
--     hl = { fg = 'red' }
-- })
-- table.insert(components.active[1], {
--     provider = 'diagnostic_warnings',
--     enabled = function() return lsp.diagnostics_exist('Warning') end,
--     hl = { fg = 'yellow' }
-- })
-- table.insert(components.active[1], {
--     provider = 'diagnostic_hints',
--     enabled = function() return lsp.diagnostics_exist('Hint') end,
--     hl = { fg = 'cyan' }
-- })
-- table.insert(components.active[1], {
--     provider = 'diagnostic_info',
--     enabled = function() return lsp.diagnostics_exist('Information') end,
--     hl = { fg = 'skyblue' }
-- })


-- table.insert(components.active[3], {
--     provider = 'git_branch',
--     hl = {
--         fg = 'white',
--         bg = 'black',
--         style = 'bold'
--     },
--     right_sep = function()
--         local val = { hl = { fg = 'NONE', bg = 'black' } }
--         if vim.b.gitsigns_status_dict then val.str = ' ' else val.str = '' end

--         return val
--     end
-- })
-- table.insert(components.active[3], {
--     provider = 'git_diff_added',
--     hl = {
--         fg = 'green',
--         bg = 'black'
--     }
-- })
-- table.insert(components.active[3], {
--     provider = 'git_diff_changed',
--     hl = {
--         fg = 'orange',
--         bg = 'black'
--     }
-- })
-- table.insert(components.active[3], {
--     provider = 'git_diff_removed',
--     hl = {
--         fg = 'red',
--         bg = 'black'
--     },
--     right_sep = function()
--         local val = { hl = { fg = 'NONE', bg = 'black' } }
--         if vim.b.gitsigns_status_dict then val.str = ' ' else val.str = '' end

--         return val
--     end
-- })
-- table.insert(components.active[3], {
--     provider = 'line_percentage',
--     hl = {
--         style = 'bold'
--     },
--     left_sep = '  ',
--     right_sep = ' '
-- })
-- table.insert(components.active[3], {
--     provider = 'scroll_bar',
--     hl = {
--         fg = 'skyblue',
--         style = 'bold'
--     }
-- })
-- table.insert(components.inactive[1], {
--     provider = 'file_type',
--     hl = {
--         fg = 'white',
--         bg = 'oceanblue',
--         style = 'bold'
--     },
--     left_sep = {
--         str = ' ',
--         hl = {
--             fg = 'NONE',
--             bg = 'oceanblue'
--         }
--     },
--     right_sep = {
--         {
--             str = ' ',
--             hl = {
--                 fg = 'NONE',
--                 bg = 'oceanblue'
--             }
--         },
--         'slant_right'
--     }
-- })
local vi_mode_colors = {
    NORMAL = 'green',
    OP = 'green',
    INSERT = 'red',
    VISUAL = 'skyblue',
    BLOCK = 'skyblue',
    REPLACE = 'violet',
    ['V-REPLACE'] = 'violet',
    ENTER = 'cyan',
    MORE = 'cyan',
    SELECT = 'orange',
    COMMAND = 'green',
    SHELL = 'green',
    TERM = 'green',
    NONE = 'yellow'
}

require('feline').setup({
    default_bg = '#1F1F23',
    default_fg = '#D0D0D0',
    -- components = M,
    properties = properties,
    vi_mode_colors = vi_mode_colors
})
