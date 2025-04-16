if not vim.g.vscode then
    map("i", "jj", "<esc>", opts)
    map("i", "jk", "<esc>", opts)
    opt.termguicolors = true
    vim.cmd([[colorscheme NeoSolarized]])
    opt.shell = "git-bash.exe"
    opt.laststatus = 3
end
