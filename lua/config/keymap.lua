-- ノーマルモード
map("n", "<S-h>", "^", opts)
map("n", "<S-l>", "$", opts)
map("n", "+", "<C-a>", opts)
map("n", "-", "<C-x>", opts)
map("n", "<C-n>", "<cmd>nohl<cr>", opts)
map("n", "<cr>", "i<cr><esc>^k", opts)
map("n", "<S-k>", "o<esc>", opts)
--
-- 削除時にレジスタに格納しない
map("n", "d", '"_d', opts)
map("n", "D", '"_D', opts)
map("n", "c", '"_c', opts)
map("n", "C", '"_C', opts)
map("n", "x", '"_x', opts)
map("n", "s", '"_s', opts)

-- ビジュアルモード
map("v", "p", '"_dP', opts)
map("v", "d", '"_d', opts)
map("v", "<S-h>", "^", opts)
map("v", "<S-l>", "$", opts)