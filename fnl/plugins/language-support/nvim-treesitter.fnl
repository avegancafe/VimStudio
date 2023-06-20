(import-macros {: pack} :macros)

(pack :nvim-treesitter/nvim-treesitter
      {:build ":TSUpdate"
       :config (fn []
                 (vim.api.nvim_create_autocmd [:BufEnter
                                               :BufAdd
                                               :BufNew
                                               :BufNewFile
                                               :BufWinEnter]
                                              {:group (vim.api.nvim_create_augroup :TS_FOLD_WORKAROUND
                                                                                   {})
                                               :callback (fn []
                                                           (tset vim.opt
                                                                 :foldmethod
                                                                 :expr)
                                                           (tset vim.opt
                                                                 :foldexpr
                                                                 "nvim_treesitter#foldexpr()"))})
                 ((. (require :nvim-treesitter.configs) :setup) {:ensure_installed :all
                                                                 :highlight {:enable true
                                                                             :additional_vim_regex_highlighting true}}))})
