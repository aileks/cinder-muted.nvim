local config = require('cinder-muted.config').get()
local colors = require('cinder-muted.util').resolve_colors(config.colors)

local function mode(accent)
  return {
    a = { fg = colors.background, bg = accent, gui = 'bold' },
    b = { fg = colors.text_bright, bg = colors.surface },
    c = { fg = colors.text, bg = colors.container },
  }
end

return {
  normal = mode(colors.primary),
  insert = mode(colors.success),
  visual = mode(colors.tertiary),
  replace = mode(colors.error),
  command = mode(colors.warning),
  terminal = mode(colors.quaternary),
  inactive = {
    a = { fg = colors.text_subtle, bg = colors.surface },
    b = { fg = colors.text_subtle, bg = colors.surface },
    c = { fg = colors.text_muted, bg = colors.container },
  },
}
