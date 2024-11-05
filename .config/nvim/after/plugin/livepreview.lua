require('livepreview').setup {
  commands = {
    start = 'LivePreview', -- Command to start the live preview server and open the default browser.
    stop = 'StopPreview', -- Command to stop the live preview.
  },
  port = 5500, -- Port to run the live preview server on.
  autokill = false, -- If true, the plugin will autokill other processes running on the same port (except for Neovim) when starting the server.
  browser = 'default', -- Terminal command to open the browser for live-previewing (eg. 'firefox', 'flatpak run com.vivaldi.Vivaldi'). By default, it will use the default browser.
  dynamic_root = false, -- If true, the plugin will set the root directory to the previewed file's directory. If false, the root directory will be the current working directory (`:lua print(vim.uv.cwd())`).
  sync_scroll = false, -- If true, the plugin will sync the scrolling in the browser as you scroll in the Markdown files in Neovim.
  telescope = {
    false, -- If true, the plugin will automatically load the `Telescope livepreview` extension.
  },
}
