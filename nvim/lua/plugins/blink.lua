return {
    "saghen/blink.cmp",
    dependencies = {
        "rafamadriz/friendly-snippets",
        "L3MON4D3/LuaSnip",
        { "folke/lazydev.nvim", ft = "lua" },
    },
    version = "*",
    event = { "InsertEnter", "CmdlineEnter" },
    config = function()
        require("blink.cmp").setup {
            keymap = {
                preset = "enter",
                ["<Tab>"] = { "select_next", "fallback" },
                ["<S-Tab>"] = { "select_prev", "fallback" },
            },

            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = "mono",
            },

            completion = {
                menu = { border = "single" },
                list = { selection = { preselect = false, auto_insert = true } },
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 500,
                    window = { border = "single" },
                },
                ghost_text = { enabled = true },
            },

            signature = {
                enabled = true,
                window = { border = "single" },
            },

            snippets = { preset = "luasnip" },

            sources = {
                default = { "lazydev", "snippets", "lsp", "path", "buffer" },
                providers = {
                    lazydev = {
                        name = "LazyDev",
                        module = "lazydev.integrations.blink",
                        score_offset = 100,
                    },
                },
            },
        }
    end,
    opts_extend = { "sources.default" },
}
