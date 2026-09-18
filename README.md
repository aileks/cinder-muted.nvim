# Cinder Muted for Neovim

A thin layer over [cinder-grove.nvim](https://github.com/aileks/cinder-grove.nvim): the muted palette feeds grove's palette overrides, so every highlight group, plugin integration, and terminal color re-resolves in ember tones. cinder-grove.nvim must be installed alongside.

The palette is generated from the [cinder-muted monorepo](https://github.com/aileks/cinder-muted); `lua/cinder-muted/palette.lua` regenerates there and syncs into this repo.

## lazy.nvim

```lua
{
  'aileks/cinder-muted.nvim',
  lazy = false,
  priority = 1000,
  dependencies = { 'aileks/cinder-grove.nvim' },
  config = function()
    vim.cmd.colorscheme('cinder-muted')
  end,
}
```

## vim.pack.add

```lua
vim.pack.add({
  "https://github.com/aileks/cinder-grove.nvim",
  "https://github.com/aileks/cinder-muted.nvim",
})

vim.cmd.colorscheme('cinder-muted')
```

## Local checkout

```lua
vim.opt.runtimepath:prepend('/path/to/cinder-muted.nvim')
vim.cmd.colorscheme('cinder-muted')
```

## Options

Any options passed to `require('cinder-grove').setup()` survive; the muted palette merges into the active grove config.

```lua
require("cinder-grove").setup({
  transparent = true,
})

vim.cmd.colorscheme('cinder-muted')
```

lualine picks the theme up through `theme = 'auto'`. fzf.vim and minimap.vim work through `require('cinder-grove.extras')` as documented in grove's README.
