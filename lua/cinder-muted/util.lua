local M = {}

local color_fields = {
  fg = true,
  bg = true,
  sp = true,
}

function M.is_hex(value)
  return type(value) == 'string' and value:match('^#%x%x%x%x%x%x$') ~= nil
end

-- palette.lua is generated plain data in the cinder-muted monorepo, so
-- palette overrides resolve here instead of in a palette module.
function M.resolve_colors(overrides)
  local colors = vim.deepcopy(require('cinder-muted.palette'))
  for name, value in pairs(overrides or {}) do
    if type(name) ~= 'string' or name == '' then
      error('cinder-muted: palette names must be non-empty strings')
    end
    if not M.is_hex(value) then
      error(('cinder-muted: invalid color for %s: expected #RRGGBB'):format(name))
    end
    colors[name] = value
  end

  return colors
end

function M.merge_highlights(target, source, source_name)
  for group, spec in pairs(source) do
    if target[group] ~= nil then
      error(('cinder-muted: duplicate highlight %s in %s'):format(group, source_name))
    end
    target[group] = vim.deepcopy(spec)
  end

  return target
end

function M.resolve_spec(spec, colors)
  if type(spec) ~= 'table' then
    error('cinder-muted: highlight specs must be tables')
  end

  local resolved = vim.deepcopy(spec)
  for field in pairs(color_fields) do
    local value = resolved[field]
    if type(value) == 'string' and value ~= 'NONE' then
      if not M.is_hex(value) then
        value = colors[value]
        if value == nil then
          error(('cinder-muted: unknown palette color %s'):format(resolved[field]))
        end
      end
      resolved[field] = value
    end
  end

  return resolved
end

function M.apply_transparency(highlights)
  local groups = {
    'Normal',
    'NormalNC',
    'EndOfBuffer',
    'FoldColumn',
    'LineNr',
    'SignColumn',
    'WinBar',
    'WinBarNC',
  }

  for _, group in ipairs(groups) do
    if highlights[group] then
      highlights[group].bg = nil
    end
  end
end

return M
