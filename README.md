# Cinder Muted for Neovim

A [cinder-grove.nvim](https://github.com/aileks/cinder-grove.nvim) colorscheme with the Cinder Muted palette. Requires cinder-grove.nvim.

`lua/cinder-muted/palette.lua` is generated in the [cinder-muted monorepo](https://github.com/aileks/cinder-muted).

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

Options passed to `require('cinder-grove').setup()` survive. The muted palette merges into the active config.

```lua
require("cinder-grove").setup({
  transparent = true,
})

vim.cmd.colorscheme('cinder-muted')
```

lualine picks the theme up through `theme = 'auto'`. fzf.vim and minimap.vim work through `require('cinder-grove.extras')` as documented in cinder-grove.nvim's README.
