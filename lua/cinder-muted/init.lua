local M = {}

function M.setup(options)
  require('cinder-muted.config').setup(options)
end

function M.load()
  local config = require('cinder-muted.config').get()
  local colors = require('cinder-muted.util').resolve_colors(config.colors)

  vim.cmd('highlight clear')
  if vim.fn.exists('syntax_on') == 1 then
    vim.cmd('syntax reset')
  end

  vim.o.background = 'dark'
  vim.o.termguicolors = true

  require('cinder-muted.theme').apply(colors, config)
  if config.terminal_colors then
    require('cinder-muted.terminal').apply()
  end

  vim.g.colors_name = 'cinder-muted'
end

return M
