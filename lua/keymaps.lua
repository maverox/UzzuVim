-- [[ Basic Keymaps ]]
--  See `:help map()`
local map = vim.keymap.set
-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
map('n', '<leader>cs', '<cmd>nohlsearch<CR>')
map('n', ';', ':')
-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- map('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- map('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- map('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- map('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
-- markdown preview keymaps
map('n', '<leader>mp', '<cmd>MarkdownPreviewToggle<CR>', { desc = 'markdown preview' })
--  See `:help wincmd` for a list of all window commands
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

map('i', '<C-b>', '<ESC>^i', { desc = 'move beginning of line' })
map('i', '<C-e>', '<End>', { desc = 'move end of line' })
map('i', '<C-h>', '<Left>', { desc = 'move left' })
map('i', '<C-l>', '<Right>', { desc = 'move right' })
map('i', '<C-j>', '<Down>', { desc = 'move down' })
map('i', '<C-k>', '<Up>', { desc = 'move up' })

map('n', '<Esc>', '<cmd>noh<CR>', { desc = 'general clear highlights' })

map('n', '<C-h>', '<C-w>h', { desc = 'switch window left' })
map('n', '<C-l>', '<C-w>l', { desc = 'switch window right' })
map('n', '<C-j>', '<C-w>j', { desc = 'switch window down' })
map('n', '<C-k>', '<C-w>k', { desc = 'switch window up' })

map('n', '<C-s>', '<cmd>w<CR>', { desc = 'file save' })
-- map('n', '<C-c>', '<cmd>%y+<CR>', { desc = 'file copy whole' })

map('n', '<leader>n', '<cmd>set nu!<CR>', { desc = 'toggle line number' })
map('n', '<leader>rn', '<cmd>set rnu!<CR>', { desc = 'toggle relative number' })

-- global lsp mappings
map('n', '<leader>lf', vim.diagnostic.open_float, { desc = 'lsp floating diagnostics' })
map('n', '[d', vim.diagnostic.goto_prev, { desc = 'lsp prev diagnostic' })
map('n', ']d', vim.diagnostic.goto_next, { desc = 'lsp next diagnostic' })
map('n', '<leader>lq', vim.diagnostic.setloclist, { desc = 'lsp diagnostic loclist' })

-- -- tabufline navigation
-- map('n', '<tab>', '<cmd>BufferLineCycleNext<CR>', { desc = 'tabline next' })
-- map('n', '<S-tab>', '<cmd>BufferLineCyclePrev<CR>', { desc = 'tabline prev' })
-- map('n', '<leader>x', '<cmd>tabclose<CR>', { desc = 'tabline close' })
-- -- Comment
-- map('n', '<leader>/', function()
--   require('Comment.api').toggle.linewise.current()
-- end, { desc = 'comment toggle' })
--
-- map('v', '<leader>/', "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", { desc = 'comment toggle' })
--
-- telescope
map('n', '<leader>ma', '<cmd>Telescope marks<CR>', { desc = 'telescope find marks' })
map('n', '<leader>cm', '<cmd>Telescope git_commits<CR>', { desc = 'telescope git commits' })
map('n', '<leader>gt', '<cmd>Telescope git_status<CR>', { desc = 'telescope git status' })

-- terminal
-- map('t', '<C-x>', '<C-\\><C-N>', { desc = 'terminal escape terminal mode' })
map('n', '<leader>scm', '<cmd>Neogit<cr>', { desc = 'toggle neogit scm view' })
-- whichkey
map('n', '<leader>wK', '<cmd>WhichKey <CR>', { desc = 'whichkey all keymaps' })

map('n', '<leader>wk', function()
  vim.cmd('WhichKey ' .. vim.fn.input 'WhichKey: ')
end, { desc = 'whichkey query lookup' })

-- blankline
map('n', '<leader>cc', function()
  local config = { scope = {} }
  config.scope.exclude = { language = {}, node_type = {} }
  config.scope.include = { node_type = {} }
  local node = require('ibl.scope').get(vim.api.nvim_get_current_buf(), config)

  if node then
    local start_row, _, end_row, _ = node:range()
    if start_row ~= end_row then
      vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start_row + 1, 0 })
      vim.api.nvim_feedkeys('_', 'n', true)
    end
  end
end, { desc = 'blankline jump to current context' })
-- vim: ts=2 sts=2 sw=2 et
