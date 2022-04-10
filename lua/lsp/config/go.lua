-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#sumneko_lua
local keybinding = require('keybindings')

-- 查看目录等信息
return {
    on_setup = function(server)
        server:setup({
            on_attach = function(client, bufnr)
                -- 禁用格式化功能，交给专门插件插件处理
                client.resolved_capabilities.document_formatting = false
                client.resolved_capabilities.document_range_formatting = false

                local function buf_set_keymap(...)
                    vim.api.nvim_buf_set_keymap(bufnr, ...)
                end
                -- 绑定快捷键
                keybinding.mapLSP(buf_set_keymap)
                -- 保存时自动格式化
                vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()')
            end
        })
    end
}
