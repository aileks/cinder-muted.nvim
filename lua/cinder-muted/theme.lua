local M = {}

local modules = {
  'cinder-muted.groups.editor',
  'cinder-muted.groups.syntax',
  'cinder-muted.groups.treesitter',
  'cinder-muted.groups.lsp',
  'cinder-muted.groups.languages',
  'cinder-muted.integrations.ibl',
  'cinder-muted.integrations.markdown-plus',
  'cinder-muted.integrations.gitsigns',
  'cinder-muted.integrations.completion',
  'cinder-muted.integrations.navigation',
  'cinder-muted.integrations.ui',
  'cinder-muted.integrations.writing',
  'cinder-muted.integrations.neogit',
  'cinder-muted.integrations.trailblazer',
}

function M.collect(config)
  local util = require('cinder-muted.util')
  local highlights = {}

  for _, module_name in ipairs(modules) do
    util.merge_highlights(highlights, require(module_name), module_name)
  end

  if config.transparent then
    util.apply_transparency(highlights)
  end

  if type(config.highlights) ~= 'table' then
    error('cinder-muted: highlights must be a table')
  end
  for group, spec in pairs(config.highlights) do
    highlights[group] = vim.deepcopy(spec)
  end

  return highlights
end

function M.apply(colors, config)
  local util = require('cinder-muted.util')
  local resolved = {}

  for group, spec in pairs(M.collect(config)) do
    resolved[group] = util.resolve_spec(spec, colors)
  end

  for group, spec in pairs(resolved) do
    vim.api.nvim_set_hl(0, group, spec)
  end
end

function M.modules()
  return vim.deepcopy(modules)
end

return M
