if vim.g.neovide then
    return {
        "okuuva/auto-save.nvim",
        version = "^1.0.0", -- see https://devhints.io/semver, alternatively use '*' to use the latest tagged release
        cmd = "ASToggle", -- optional for lazy loading on command
        event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
        opts = {
            trigger_events = {
                immediate_save = { "BufLeave", "FocusLost" },
                defer_save = {},
            },
        },
    }
else
    return {
        "okuuva/auto-save.nvim",
        version = "^1.0.0", -- see https://devhints.io/semver, alternatively use '*' to use the latest tagged release
        cmd = "ASToggle", -- optional for lazy loading on command
        opts = {
            enabled = false,
        }
    }
end
