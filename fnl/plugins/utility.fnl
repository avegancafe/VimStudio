(import-macros {: pack} :macros)

[
(pack :RRethy/vim-illuminate
      {:config (fn []
                 (let [illuminate (require :illuminate)]
                   (illuminate.configure {:filetypes_denylist [:dashboard
                                                               :lspsagaoutline
                                                               :NvimTree]})))})
(pack :frazrepo/vim-rainbow)
(pack :folke/which-key.nvim {:config true :opts {:window {:border :rounded}}})
(pack :kevinhwang91/nvim-ufo
      {:dependencies [:kevinhwang91/promise-async
                      (pack :luukvbaal/statuscol.nvim
                            {:config (fn []
                                       (let [statuscol (require :statuscol)
                                             builtin (require :statuscol.builtin)]
                                         (statuscol.setup {:foldfunc :builtin
                                                           :setopt true
                                                           :relculright true
                                                           :segments [{:text [builtin.foldfunc]
                                                                       :click "v:lua.ScFa"}
                                                                      {:text ["%s"]
                                                                       :click "v:lua.ScSa"}
                                                                      {:text [builtin.lnumfunc
                                                                              " "]
                                                                       :click "v:lua.ScLa"}]})))})]
       :init (fn []
               (set vim.o.foldcolumn :1)
               (set vim.o.foldlevel 99)
               (set vim.o.foldenable true)
               (set vim.o.fillchars
                    "eob: ,fold: ,foldopen:,foldsep: ,foldclose:"))
       :config true
       :opts {:provider_selector (fn []
                                   [:treesitter :indent])}})
(pack :Yggdroot/indentLine
      {:config (fn []
                 (tset vim.g :indentLine_fileTypeExclude [:dashboard :fennel :mason :text])
                 (tset vim.g :indentLine_concealcursor :n)
                 (tset vim.g :indentLine_char_list ["|" "¦" "┆" "┊"]))})
(pack :lewis6991/gitsigns.nvim {:dependencies [:nvim-lua/plenary.nvim]
                                :config true})
(pack :akinsho/bufferline.nvim
      {:dependencies [:ribru17/bamboo.nvim]
       :config (fn []
                 ((. (require :cmds.setup_bufferline) :setup) :buffers))})
 ]
