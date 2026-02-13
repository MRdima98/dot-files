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

require'treesitter-context'.setup{
  enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
  multiwindow = false, -- Enable multiwindow support.
  max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
  min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
  line_numbers = true,
  multiline_threshold = 20, -- Maximum number of lines to show for a single context
  trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
  mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
  -- Separator between context and content. Should be a single character string, like '-'.
  -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
  separator = nil,
  zindex = 20, -- The Z-index of the context window
  on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
}
