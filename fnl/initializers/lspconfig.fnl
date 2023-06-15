(import-macros {: deepcopy} :macros)

(local nvim-lsp (require :lspconfig))
(fn on-attach [client bufnr]
  ((. (require :lsp_signature) :on_attach) {:bind true
                                            :floating_window false
                                            :handler_opts {:border :rounded}
                                            :toggle_key :<c-h>}
                                           bufnr)
  (when (= client.name :yamlls)
    (local ns (vim.lsp.diagnostic.get_namespace client.id))
    (vim.diagnostic.disable nil ns))

  (fn buf-set-keymap [...] (vim.api.nvim_buf_set_keymap bufnr ...))

  (fn buf-set-option [...] (vim.api.nvim_buf_set_option bufnr ...))

  (buf-set-option :omnifunc "v:lua.vim.lsp.omnifunc")
  (buf-set-keymap :n :K "<CMD>lua vim.lsp.buf.hover()<CR>"
                  {:noremap true :silent true})
  (buf-set-keymap :n :KK "<CMD>Lspsaga show_cursor_diagnostics<CR>"
                  {:noremap true :silent true})
  (buf-set-keymap :n :<leader>lh "<CMD>lua vim.lsp.buf.hover()<CR>"
                  {:noremap true :silent true})
  (buf-set-keymap :n :<leader>ld "<CMD>Lspsaga lsp_finder<CR>"
                  {:noremap true :silent true})
  (buf-set-keymap :n :<leader>li "<CMD>Lspsaga lsp_finder<CR>"
                  {:noremap true :silent true})
  (buf-set-keymap :n :<leader>lr ":IncRename " {:noremap true :silent true})
  (buf-set-keymap :n :<leader>la "<CMD>Lspsaga code_action<CR>"
                  {:noremap true :silent true})
  (buf-set-keymap :n :<leader>lu "<CMD>Lspsaga lsp_finder<CR>"
                  {:noremap true :silent true})
  (buf-set-keymap :n :<leader>lo "<CMD>Lspsaga outline<CR>"
                  {:noremap true :silent true}))

(local capabilities
       ((. (require :cmp_nvim_lsp) :default_capabilities) (vim.lsp.protocol.make_client_capabilities)))

(set capabilities.textDocument.foldingRange
     {:dynamicRegistration false :lineFoldingOnly true})

(local opts
       {: capabilities
        :flags {:debounce_text_changes 150}
        :handlers {:textDocument/hover (vim.lsp.with vim.lsp.handlers.hover
                                         {:border :rounded})}
        :on_attach on-attach
        :root_dir (nvim-lsp.util.root_pattern :.git)
        :settings {:Lua {:diagnostics {:globals [:vim]}
                         :runtime {:version :LuaJIT}
                         :telemetry {:enable false}
                         :workspace {:checkThirdParty false
                                     :library (vim.api.nvim_get_runtime_file ""
                                                                             true)}}
                   :fennel {:diagnostics {:globals [:vim]}
                            :workspace {:library (vim.api.nvim_list_runtime_paths)}}}})

(vim.cmd " do User LspAttachBuffers ")
((. (require :mason) :setup))
((. (. (require :lspconfig) :vtsls) :setup) opts)
(local servers [])

(lambda check-bin [binary-name]
  (let [handle (io.popen (.. "which " binary-name))
               result (handle:read "*a")] (handle:close)
    (> (length result) 0)))
(if (check-bin :cargo) (table.insert servers :fennel_language_server) (print "[CONFIG] install rust in order to use fennel_language_server"))
(if (check-bin :go) (do (table.insert servers :gopls) (table.insert servers :bufls)) (print "[CONFIG] install go in order to use LSPs"))
(if (check-bin :npm) (do (table.insert servers :bashls) (table.insert servers :cssls) (table.insert servers :solidity) (table.insert servers :tailwindcss) (table.insert servers :vtsls) (table.insert servers :vtsls)) (print "[CONFIG] install node/npm to use LSPs"))
(if (check-bin :brew) (table.insert servers :lua_ls) (print "[CONFIG] install homebrew in order to use LSPs"))


((. (require :mason-lspconfig) :setup) {:ensure_installed servers})
((. (require :mason-lspconfig) :setup_handlers) {1 (fn [server-name]
                                                     ((. (. (require :lspconfig)
                                                            server-name)
                                                         :setup) opts))
                                                 :gopls (fn []
                                                          (local gopls-opts
                                                                 (deepcopy opts))
                                                          (local util
                                                                 (require :lspconfig/util))
                                                          (set gopls-opts.root_dir
                                                               (util.root_pattern :go.mod))
                                                          ((. (. (require :lspconfig)
                                                                 :gopls)
                                                              :setup) gopls-opts))})
