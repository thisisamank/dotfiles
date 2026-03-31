# Neovim Configuration (`thisisamank`)

A modular, modern Neovim configuration for productivity, code navigation, and a beautiful UI/UX. It leverages the latest plugin ecosystem, with lazy-loading, LSP, Treesitter, autocompletion, formatting, linting, and more.

---

## Table of Contents
- [Features](#features)
- [Directory Structure](#directory-structure)
- [Core Settings](#core-settings)
- [Plugin Overview](#plugin-overview)
- [Cheatsheet](#cheatsheet)
- [Language Support](#language-support)
- [Formatting & Linting](#formatting--linting)
- [Custom Text Objects](#custom-text-objects)
- [Tips](#tips)
- [Credits](#credits)

---

## Features

- **Lazy-loading plugin manager** (`lazy.nvim`)
- **LSP** (Language Server Protocol) with auto-installer (`mason.nvim`)
- **Treesitter** for advanced syntax highlighting and text objects
- **Autocompletion** with snippet support
- **Automatic formatting and linting**
- **File explorer** (`nvim-tree`)
- **Fuzzy finder** (`telescope`)
- **Statusline** (`lualine`)
- **Buffer/tab line** (`bufferline`)
- **Git integration** (`gitsigns`, `lazygit`)
- **Session management** (`auto-session`)
- **Dashboard** (`alpha-nvim`)
- **Which-key** for keybinding discovery
- **Surround, substitute, commenting, maximizer, indent guides, autopairs, and more**

---

## Directory Structure

```
.config/nvim/
├── init.lua
├── lazy-lock.json
├── .stylua.toml
├── after/
│   └── queries/
│       └── ecma/
│           └── textobjects.scm
└── lua/
    └── thisisamank/
        ├── core/
        │   ├── init.lua
        │   ├── keymaps.lua
        │   └── options.lua
        ├── lazy.lua
        └── plugins/
            ├── init.lua
            ├── <plugin-configs>.lua
            └── lsp/
                ├── lspconfig.lua
                └── mason.lua
```

---

## Core Settings

- **Relative and absolute line numbers**
- **2-space indentation, expand tabs**
- **System clipboard integration**
- **No line wrap, true color support**
- **Split windows open to right/bottom**
- **No swap files**
- **Backspace works everywhere**

See `lua/thisisamank/core/options.lua` for details.

---

## Plugin Overview

### Plugin Manager
- **[lazy.nvim](https://github.com/folke/lazy.nvim)**: Fast, modern plugin manager. See `lua/thisisamank/lazy.lua`.

### UI/UX
- **tokyonight.nvim**: Default colorscheme (customized in `colorscheme.lua`)
- **lualine.nvim**: Statusline with custom theme
- **bufferline.nvim**: Tab/buffer line
- **alpha-nvim**: Dashboard on startup
- **which-key.nvim**: Keybinding hints
- **dressing.nvim**: Improved UI for input/select
- **indent-blankline.nvim**: Indentation guides
- **nvim-web-devicons**: File icons

### Navigation
- **nvim-tree.lua**: File explorer (`<leader>ee` to toggle)
- **telescope.nvim**: Fuzzy finder for files, buffers, grep, etc.
- **vim-tmux-navigator**: Seamless navigation between tmux and splits

### Coding
- **nvim-treesitter**: Syntax highlighting, text objects, incremental selection
- **nvim-treesitter-textobjects**: Advanced text objects (see below)
- **nvim-autopairs**: Auto-close pairs
- **nvim-surround**: Add/change/delete surrounding characters
- **substitute.nvim**: Enhanced substitution
- **Comment.nvim**: Easy commenting (with context support)
- **todo-comments.nvim**: Highlight and search TODO/FIXME/etc.
- **trouble.nvim**: Diagnostics and quickfix UI
- **vim-maximizer**: Maximize/minimize splits

### Git
- **gitsigns.nvim**: Git gutter, hunk actions, blame, etc.
- **lazygit.nvim**: Launch LazyGit in a floating window

### LSP, Completion, Formatting, Linting
- **nvim-lspconfig**: LSP client
- **mason.nvim**: LSP/DAP/formatter/linters installer
- **mason-lspconfig.nvim**: Bridge between mason and lspconfig
- **mason-tool-installer.nvim**: Ensure formatters/linters are installed
- **nvim-cmp**: Autocompletion engine
- **LuaSnip**: Snippet engine
- **conform.nvim**: Formatter integration
- **nvim-lint**: Linter integration

### Session Management
- **auto-session**: Save/restore sessions (`<leader>ws`/`<leader>wr`)

---

## Cheatsheet

**Leader key:** `<Space>`

### General
| Key                | Action                                 |
|--------------------|----------------------------------------|
| `jk` (insert mode) | Exit insert mode                       |
| `<leader>nh`       | Clear search highlights                |
| `<leader>+`/`-`    | Increment/decrement number             |

### Window/Tab Management
| Key                | Action                                 |
|--------------------|----------------------------------------|
| `<leader>sv`       | Split window vertically                |
| `<leader>sh`       | Split window horizontally              |
| `<leader>se`       | Equalize splits                        |
| `<leader>sx`       | Close current split                    |
| `<leader>to`       | New tab                                |
| `<leader>tx`       | Close tab                              |
| `<leader>tn`/`tp`  | Next/previous tab                      |
| `<leader>tf`       | Open buffer in new tab                 |
| `<leader>sm`       | Maximize/minimize split                |

### File Explorer
| Key                | Action                                 |
|--------------------|----------------------------------------|
| `<leader>ee`       | Toggle file explorer                   |
| `<leader>ef`       | Toggle explorer on current file        |
| `<leader>ec`       | Collapse explorer                      |
| `<leader>er`       | Refresh explorer                       |

### Fuzzy Finder (Telescope)
| Key                | Action                                 |
|--------------------|----------------------------------------|
| `<leader>ff`       | Find files                             |
| `<leader>fr`       | Recent files                           |
| `<leader>fs`       | Live grep                              |
| `<leader>fc`       | Grep string under cursor               |
| `<leader>ft`       | Find TODOs                             |

### LSP
| Key                | Action                                 |
|--------------------|----------------------------------------|
| `gR`               | Show references                        |
| `gD`               | Go to declaration                      |
| `gd`               | Go to definition                       |
| `gi`               | Go to implementation                   |
| `gt`               | Go to type definition                  |
| `<leader>ca`       | Code actions                           |
| `<leader>rn`       | Rename                                 |
| `<leader>D`        | Buffer diagnostics                     |
| `<leader>d`        | Line diagnostics                       |
| `[d`/`]d`          | Prev/next diagnostic                   |
| `K`                | Hover docs                             |
| `<leader>rs`       | Restart LSP                            |

### Formatting & Linting
| Key                | Action                                 |
|--------------------|----------------------------------------|
| `<leader>mp`       | Format file/range                      |
| `<leader>l`        | Lint current file                      |

### Git
| Key                | Action                                 |
|--------------------|----------------------------------------|
| `<leader>lg`       | Open LazyGit                           |
| `<leader>hs`/`hr`  | Stage/reset hunk                       |
| `<leader>hS`/`hR`  | Stage/reset buffer                     |
| `<leader>hu`       | Undo stage hunk                        |
| `<leader>hp`       | Preview hunk                           |
| `<leader>hb`/`hB`  | Blame line/toggle line blame           |
| `<leader>hd`/`hD`  | Diff                                   |

### Session
| Key                | Action                                 |
|--------------------|----------------------------------------|
| `<leader>ws`       | Save session                           |
| `<leader>wr`       | Restore session                        |

### TODO Comments
| Key                | Action                                 |
|--------------------|----------------------------------------|
| `[t`/`]t`          | Prev/next TODO comment                 |

### Trouble
| Key                | Action                                 |
|--------------------|----------------------------------------|
| `<leader>xw`       | Workspace diagnostics                  |
| `<leader>xd`       | Document diagnostics                   |
| `<leader>xq`       | Quickfix list                          |
| `<leader>xl`       | Location list                          |
| `<leader>xt`       | TODOs in Trouble                       |

### Substitute
| Key                | Action                                 |
|--------------------|----------------------------------------|
| `s` (normal)       | Substitute with motion                 |
| `ss` (normal)      | Substitute line                        |
| `S` (normal)       | Substitute to end of line              |
| `s` (visual)       | Substitute in visual mode              |

### Surround
- Use `nvim-surround` keymaps (see [docs](https://github.com/kylechui/nvim-surround))

---

## Language Support

- **LSP servers** auto-installed via Mason for: TypeScript, JavaScript, HTML, CSS, Tailwind, Svelte, Lua, GraphQL, Emmet, Prisma, Python, and more.
- **Treesitter** parsers for: JSON, JS, TS, TSX, YAML, HTML, CSS, Prisma, Markdown, Svelte, GraphQL, Bash, Lua, Vim, Dockerfile, Gitignore, Query, Vimdoc, C.

---

## Formatting & Linting

- **Formatters**: Prettier, Stylua, isort, black
- **Linters**: eslint_d, pylint

Auto-format on save is enabled. Trigger manually with `<leader>mp`. Linting is automatic on buffer events, or manually with `<leader>l`.

---

## Custom Text Objects

Advanced text objects for assignments, properties, parameters, conditionals, loops, calls, functions, classes, and more, powered by Treesitter.

See `lua/thisisamank/plugins/nvim-treesitter-text-objects.lua` and `after/queries/ecma/textobjects.scm` for custom mappings.

---

## Tips

- **Plugin updates**: Run `:Lazy update` to update plugins.
- **LSP/formatter/linters**: Use `:Mason` to manage external tools.
- **Keybinding hints**: Press `<leader>` to see available keymaps via which-key.
- **Session management**: Sessions are not auto-restored by default; use `<leader>ws`/`<leader>wr`.
- **Colorscheme**: Custom tokyonight theme with optional transparency (see `colorscheme.lua`).

---

## Credits

- Inspired by [NvChad](https://github.com/NvChad/NvChad), [LunarVim](https://github.com/LunarVim/LunarVim), and the Neovim community.
- See individual plugin repos for more details.

---

**Enjoy your productive Neovim experience!** 