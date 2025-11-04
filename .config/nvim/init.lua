require 'dima.set'
require 'dima.remap'
require 'dima.lazy'

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

function rsync()
  return ':!rsync -avz --files-from=<(git ls-files) ./ dumitru.frunza@policy-dev.widegroup.eu:~/policyDima<CR>'
end

function rsync_and_build()
  return ":!rsync -avz --files-from=<(git ls-files) ./ dumitru.frunza@policy-dev.widegroup.eu:~/policyDima ; ssh dev 'cd policyDima/ ; source /usr/local/nvm/nvm.sh ; yarn build' <CR>"
end

vim.keymap.set('n', '<leader>t', rsync(), { noremap = true, silent = true, desc = 'Run ls in shell' })
vim.keymap.set('n', '<leader>r', rsync_and_build(), { noremap = true, silent = true, desc = 'Run ls in shell' })

-- in your nvim config
vim.filetype.add({
  extension = {
    jbuilder = "ruby",
  },
})
