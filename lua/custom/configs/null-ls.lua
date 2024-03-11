-- custom/configs/null-ls.lua
local null_ls = require "null-ls"
local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics
local filetypes = {"typescript", "javascript", "go", "typescriptreact","javascriptreact"}
local sources = {
   formatting.prettier,
   formatting.stylua,
   formatting.gofmt,
   diagnostics.misspell.with({filetypes}),
   code_actions.gomodifytags,
   code_actions.impl,
   code_actions.refactoring,
   diagnostics.tsc,
   lint.shellcheck,
   require("typescript.extensions.null-ls.code-actions"),

}

null_ls.setup {
   debug = true,
   sources = sources,
}

