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
  return ':!rsync -avz --files-from=<(git ls-files) ./ wg.rails.deploy@dev1.policy.intranet.widegroup.eu:~/policy<CR>'
end

function rsync_and_build()
  return ":!rsync -avz --files-from=<(git ls-files) ./ wg.rails.deploy@dev1.policy.intranet.widegroup.eu:~/policy ; ssh dev \"bash -c -l 'cd policy/ ; /usr/bin/yarn build'\" ; swaymsg '[app_id=\"google-chrome\" workspace=\"2\"] focus' && wtype -k F5 <CR>"
end

vim.keymap.set('n', '<leader>t', rsync(), { noremap = true, silent = true, desc = 'Run ls in shell' })
vim.keymap.set('n', '<leader>r', rsync_and_build(), { noremap = true, silent = true, desc = 'Run ls in shell' })

-- in your nvim config
vim.filetype.add({
  extension = {
    jbuilder = "ruby",
  },
})

require'treesitter-context'.setup{
  enable = true,
  multiwindow = false,
  max_lines = 0,
  min_window_height = 0,
  line_numbers = true,
  multiline_threshold = 3,
  trim_scope = 'outer',
  mode = 'cursor', 
  separator = nil,
  zindex = 5,
  on_attach = nil,
}
