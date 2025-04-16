-- global variables
map = vim.api.nvim_set_keymap
opt = vim.opt
opts = { noremap = true, silent = true }

-- import setting
require("config.lazy")
require("config.keymap")
require("config.vscodeconf")
require("config.neovide")
require("config.notvscodeconf")
require("config.firenvimconf")

opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true

opt.langmenu = "en_US.UTF-8"
vim.cmd("language message en_US.UTF-8")
opt.clipboard = "unnamedplus"

-- フォーカスが外れたらInsertモードから抜け出す
vim.api.nvim_create_autocmd({"FocusLost","BufLeave"}, {
    callback = function()
        vim.cmd("stopinsert")
    end,
})
