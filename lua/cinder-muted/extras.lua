local M = {}

function M.fzf_colors()
  return {
    hl = { 'fg', 'CinderMutedPrimary' },
    ['hl+'] = { 'fg', 'CinderMutedPrimary' },
    fg = { 'fg', 'CinderMutedText' },
    bg = { 'fg', 'CinderMutedBackground' },
    ['fg+'] = { 'fg', 'CinderMutedTextBright' },
    ['bg+'] = { 'bg', 'Visual' },
    pointer = { 'fg', 'CinderMutedPrimary' },
    marker = { 'fg', 'CinderMutedPrimary' },
    prompt = { 'fg', 'CinderMutedTertiary' },
    info = { 'fg', 'CinderMutedQuaternary' },
    gutter = { 'fg', 'CinderMutedBackground' },
    header = { 'fg', 'CinderMutedInfo' },
    border = { 'fg', 'FloatBorder' },
    spinner = { 'fg', 'CinderMutedWarning' },
    query = { 'fg', 'CinderMutedTextBright' },
    disabled = { 'fg', 'CinderMutedTextMuted' },
  }
end

function M.minimap()
  return {
    minimap_cursor_color = 'CinderMutedMinimapCursor',
    minimap_range_color = 'CinderMutedMinimapRange',
  }
end

return M
