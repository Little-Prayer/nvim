if vim.g.vscode then
    map("n", "gb", "<cmd>lua require('vscode').call('workbench.action.navigateBack')<cr>", opts)
    map("n", "<leader>e", "<cmd>lua require('vscode').call('workbench.files.action.focusFilesExplorer')<cr>", opts)
end