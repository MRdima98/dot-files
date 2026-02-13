local conform = require 'conform'

conform.setup {
  notify_on_error = false,
  formatters_by_ft = {
    lua = { 'stylua' },
    json = { 'deno_fmt' },
    sql = { 'sql_formatter' },
    javascript = { 'prettierd', 'prettier', stop_after_first = true },
  },
}
