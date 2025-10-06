return {
    "echasnovski/mini.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("mini.basics").setup {
            options = { basic = true },
            mappings = {
                basic = true,
                windows = true,
                move_with_alt = true,
            },
        }
        require("mini.icons").setup()
        require("mini.statusline").setup()
        require("mini.ai").setup()
        require("mini.surround").setup()
        require("mini.operators").setup {
            replace = { prefix = "gs" },
            sort = { prefix = "" },
        }
        require("mini.pairs").setup()
        require("mini.move").setup()
    end,
}
