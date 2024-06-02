local ls = require("luasnip")

-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.expand_conditions")
local sc = require("luasnip.extras.select_choice")

-- load snippets from friendly-snippets
require("luasnip.loaders.from_vscode").lazy_load()

-- load snippets from own snippet dir
require("luasnip.loaders.from_lua").load({paths = "~/snippets"})

-- luasnip setup
ls.config.set_config {
  history = true,
  updateevents = "TextChanged, TextChangedI",
  enable_autosnippets = true,
}

-- keymaps

vim.keymap.set("n", "<leader><leader>rs", function()
  print("Reloaded all snippets");
  vim.cmd("so ~/.config/nvim/after/plugin/luasnip.lua")
end)

vim.keymap.set({ "i", "s" }, "<c-j>", function ()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true})


vim.keymap.set({ "i", "s" }, "<c-k>", function ()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true})


vim.keymap.set({ "i", "s" }, "<c-c>", function ()
  if ls.choice_active() then
    sc()
  end
end, { silent = true})

-- -- snipptes
-- ls.add_snippets("vimwiki", {
--   s("todo", fmt("- [] {}", { i(1) }))
-- })

ls.add_snippets("all", {
  s("todo",
    c(1, {
      t "TODO 1 1",
      t "TODO 2",
      t "TODO 3",
      t "TODO 4",
    })
  ),
  s("ffuf",
    fmt("ffuf -w {} {} {} -ac -of all -o {}", {
      c(1, {
        t "/usr/share/wordlists/seclists/Discovery/Web-Content/raft-medium-words.txt",
        t "/usr/share/wordlists/dirb/big.txt",
        t "/usr/share/wordlists/seclists/Discovery/DNS/subdomains-top1million-5000.txt"
      }),
      c(2, {
        t "-request",
        t "-u",
      }),
      i(3, "<URL>"),
      f(function(args)
        print(vim.inspect(args))
        return args.m, args.url
      end, {2, 3})
    })
  ),
})
