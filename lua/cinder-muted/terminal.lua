local M = {}

-- The ANSI 16 from terminalColors() in the cinder-muted monorepo: accent
-- rungs are floored for legibility, bright variants lifted, bright red is
-- primary. Kept in sync with xresources/cinder-muted.xrdb and st there.
local terminal = {
  '#15110F', -- 0 black
  '#A45751', -- 1 red
  '#D98C63', -- 2 green
  '#FFBD9B', -- 3 yellow
  '#C2764E', -- 4 blue
  '#CA7D55', -- 5 magenta
  '#D2845C', -- 6 cyan
  '#B5A196', -- 7 white
  '#5F5049', -- 8 bright black
  '#F1A278', -- 9 bright red
  '#ED9F75', -- 10 bright green
  '#FFD4BE', -- 11 bright yellow
  '#D68960', -- 12 bright blue
  '#DE9067', -- 13 bright magenta
  '#E6976E', -- 14 bright cyan
  '#E9D1C5', -- 15 bright white
}

function M.apply()
  for index, color in ipairs(terminal) do
    vim.g['terminal_color_' .. index - 1] = color
  end
end

return M
