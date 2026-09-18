# Cinder Muted for Neovim

A warm, muted dark colorscheme. Tones of a single ember hue, with a red exception for errors.

`lua/cinder-muted/palette.lua` is generated in the [cinder-muted monorepo](https://github.com/aileks/cinder-muted); everything else lives here.

## Features

- Modern Neovim UI, syntax, Tree-sitter, LSP, diagnostics, and semantic tokens
- Language-specific groups for Markdown, structured data, web, Lua, Go, Python, Rust, shell, and JavaScript/TypeScript
- Plugin integrations with no plugin setup or import-time side effects
- Lualine auto-discovery through `theme = 'auto'`
- Optional transparency, palette overrides, highlight overrides, and terminal colors

## Installation

lazy.nvim:

```lua
{
  'aileks/cinder-muted.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme('cinder-muted')
  end,
}
```

Neovim's built-in package manager:

```lua
vim.pack.add({
  { src = 'https://github.com/aileks/cinder-muted.nvim' },
})
vim.cmd.colorscheme('cinder-muted')
```

Locally:

```lua
vim.opt.runtimepath:prepend('/path/to/cinder-muted.nvim')
vim.cmd.colorscheme('cinder-muted')
```

## Configuration

Calling `setup()` is optional. It configures the theme but does not load it.

```lua
require('cinder-muted').setup({
  transparent = false,
  terminal_colors = true,
  colors = {},
  highlights = {},
})
vim.cmd.colorscheme('cinder-muted')
```

### Transparency

Enable transparency while keeping floating windows opaque:

```lua
require('cinder-muted').setup({ transparent = true })
vim.cmd.colorscheme('cinder-muted')
```

### Palette overrides

Palette values must use six-digit hexadecimal colors. Existing names can be replaced and new names can be used by custom highlights.

Highlight colors may be palette names, `#RRGGBB`, or `NONE`. Other `nvim_set_hl()` fields pass through unchanged.

```lua
require('cinder-muted').setup({
  colors = {
    background = '#101010',
    custom = '#6F8050',
  },
  highlights = {
    Normal = { fg = 'text', bg = 'background' },
    MyHighlight = { fg = 'custom', bold = true },
  },
})
```

## Integrations

Cinder Muted defines highlights for:

- blink.cmp and nvim-cmp
- flash.nvim
- fzf-lua and optional fzf.vim colors
- gitsigns.nvim and neogit
- indent-blankline.nvim
- lazy.nvim
- lualine.nvim
- markdown-plus.nvim
- mini.icons and minimap.vim
- obsidian.nvim, org-bullets.nvim, and render-markdown.nvim
- oil.nvim
- telescope.nvim
- trailblazer.nvim
- which-key.nvim

### fzf.vim and minimap.vim

These plugins require configuration in addition to highlight groups:

```lua
vim.g.fzf_colors = require('cinder-muted.extras').fzf_colors()

for name, value in pairs(require('cinder-muted.extras').minimap()) do
  vim.g[name] = value
end
```
