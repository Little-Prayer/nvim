return {
    "folke/flash.nvim",
    ---@type Flash.Config
    event = "VeryLazy",
    -- ないとfキー拡張が上手く起動しない
    opts = {},
    keys = {
        {
            "<leader>s",
            mode = { "n", "x", "o" },
            function()
                require("flash").jump()
            end,
            desc = "Flash",
        },
        {
            "<leader>r",
            mode = "o",
            function() end,
            desc = "Remote Flash",
        },
        {
            "<leader>l",
            mode = { "n", "x", "o" },
            function()
                require("flash").jump({
                    search = { mode = "search", max_length = 0 },
                    label = { after = { 0, 0 } },
                    pattern = "^",
                })
            end,
            desc = "Jump to a line",
        },
        {
            "<leader>L",
            mode = { "n", "x", "o" },
            function()
                require("flash").jump({
                    search = { mode = "search", max_length = 0 },
                    label = { after = { 0, 0 } },
                    pattern = "$",
                })
            end,
            desc = "Jump to a line end",
        },
        {
            "<leader>I",
            mode = { "n", "x", "o" },
            function()
                require("flash").jump({
                    search = { mode = "search", max_length = 0 },
                    label = { after = { 0, 0 } },
                    pattern = "^",
                })
                vim.cmd("startinsert")
            end,
            desc = "Jump to a line and insert",
        },
        {
            "<leader>A",
            mode = { "n", "x", "o" },
            function()
                require("flash").jump({
                    search = { mode = "search", max_length = 0 },
                    label = { after = { 0, 0 } },
                    pattern = "$",
                })
                vim.cmd("startinsert!")
            end,
            desc = "Jump to a line end and insert",
        },
        {
            "<leader>j",
            mode = { "n", "x", "o" },
            function()
                require("flash").jump({
                    search = { mode = "search", max_length = 0, forward = true, wrap = false, multi_window = false },
                    label = { after = { 0, 0 } },
                    pattern = "^",
                })
            end,
            desc = "Jump to a forward line",
        },
        {
            "<leader>J",
            mode = { "n", "x", "o" },
            function()
                require("flash").jump({
                    search = { mode = "search", max_length = 0, forward = true, wrap = false, multi_window = false },
                    label = { after = { 0, 0 } },
                    pattern = "$",
                })
            end,
            desc = "Jump to a forward line end",
        },
        {
            "<leader>k",
            mode = { "n", "x", "o" },
            function()
                require("flash").jump({
                    search = { mode = "search", max_length = 0, forward = false, wrap = false, multi_window = false },
                    label = { after = { 0, 0 } },
                    pattern = "^",
                })
            end,
            desc = "Jump to a backward line",
        },
        {
            "<leader>K",
            mode = { "n", "x", "o" },
            function()
                require("flash").jump({
                    search = { mode = "search", max_length = 0, forward = false, wrap = false, multi_window = false },
                    label = { after = { 0, 0 } },
                    pattern = "$",
                })
            end,
            desc = "Jump to a backward line end",
        },
        {
            "<leader>m",
            mode = { "n", "x", "o" },
            function()
                require("flash").jump({
                    search = {
                        mode = vim.fn["kensaku#query"],
                    },
                })
            end,
            desc = "search use migemo",
        },
        {
            "<leader>W",
            mode = { "n", "x", "o" },
            function()
                require("flash").jump({
                    pattern = ".", -- initialize pattern with any char
                    search = {
                        mode = function(pattern)
                            -- remove leading dot
                            if pattern:sub(1, 1) == "." then
                                pattern = pattern:sub(2)
                            end
                            -- return word pattern and proper skip pattern
                            return ([[\<%s\w*\>]]):format(pattern), ([[\<%s]]):format(pattern)
                        end,
                    },
                    -- select the range
                    jump = { pos = "range" },
                })
            end,
            desc = "Select any word",
        },
        {
            "<leader>w",
            mode = { "n", "x", "o" },
            function()
                local Flash = require("flash")

                ---@param opts Flash.Format
                local function format(opts)
                    -- always show first and second label
                    return {
                        { opts.match.label1, "FlashMatch" },
                        { opts.match.label2, "FlashLabel" },
                    }
                end
                Flash.jump({
                    search = { mode = "search" },
                    label = { after = false, before = { 0, 0 }, uppercase = false, format = format },
                    pattern = [[\<]],
                    action = function(match, state)
                        state:hide()
                        Flash.jump({
                            search = { max_length = 0 },
                            highlight = { matches = false },
                            label = { format = format },
                            matcher = function(win)
                                -- limit matches to the current label
                                return vim.tbl_filter(function(m)
                                    return m.label == match.label and m.win == win
                                end, state.results)
                            end,
                            labeler = function(matches)
                                for _, m in ipairs(matches) do
                                    m.label = m.label2 -- use the second label
                                end
                            end,
                        })
                    end,
                    labeler = function(matches, state)
                        local labels = state:labels()
                        for m, match in ipairs(matches) do
                            match.label1 = labels[math.floor((m - 1) / #labels) + 1]
                            match.label2 = labels[(m - 1) % #labels + 1]
                            match.label = match.label1
                        end
                    end,
                })
            end,
            desc = "2-char jump",
        },
        {
            "<leader>c",
            mode = { "n", "x", "o" },
            function()
                require("flash").jump({ continue = true })
            end,
            desc = "Continue last search",
        },
    },
}
