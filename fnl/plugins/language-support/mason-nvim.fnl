(import-macros {: pack} :macros)

[(pack :williamboman/mason.nvim
       {:dependencies [:williamboman/mason-lspconfig.nvim]
        :config (fn []
                  (vim.cmd "autocmd FileType mason setlocal winblend=10")
                  (vim.api.nvim_create_autocmd [:BufEnter :BufWinEnter]
                                               {:pattern :*.yml
                                                :callback (fn []
                                                            (vim.diagnostic.hide))})
                  (require :initializers.lspconfig)
                  )})]
