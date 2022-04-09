local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
    vim.notify("没有找到 nvim-treesitter")
    return
end

treesitter.setup({
  -- 安装 language parser
  -- :TSInstallInfo 命令查看支持的语言
  ensure_installed = { 
	  "json", "json5", "yaml",
	  "html", "css",
	  "javascript", "typescript", "tsx" ,
	  "vim", 
	  "lua", 
	  "go","gomod",
	  "python",
	  "php"
	},
  -- 启用代码高亮模块
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  -- 启用增量选择模块
  incremental_selection = {
	enable = true,
	keymaps = {
	  init_selection = "<CR>",
	  node_incremental = "<CR>",
	  node_decremental = "<BS>",
	  scope_incremental = "<TAB>",
	},
      },
})

-- :TSInstallInfo 查看有哪些高亮
-- :TSInstall <language_to_install>