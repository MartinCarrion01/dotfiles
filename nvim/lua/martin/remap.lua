vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", ":Explore<CR>")
vim.keymap.set("i", "jj", "<Esc>", options)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww /home/usuario/.config/scripts/tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set("v", "<leader>f", vim.lsp.buf.format)

--replace all ocurrences of current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

--close buffer
vim.keymap.set("n", "<leader>bc", ":bd<CR>")

--commands to move inside quickfix list
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

--move between buffers
vim.keymap.set("n", "<leader>h" , "<C-w>h")
vim.keymap.set("n", "<leader>l" , "<C-w>l")
vim.keymap.set("n", "<leader>j" , "<C-w>j")
vim.keymap.set("n", "<leader>k" , "<C-w>k")

--split buffers vertically and horizontally
vim.keymap.set("n", "<leader>cv", "<C-w>v")
vim.keymap.set("n", "<leader>cb", "<C-w>s")
