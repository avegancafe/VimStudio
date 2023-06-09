(import-macros {: pack} :macros)

[(pack :nvim-telescope/telescope.nvim
       {:dependencies [:kyazdani42/nvim-web-devicons
                       :nvim-lua/plenary.nvim
                       :ribru17/bamboo.nvim]
        :config (fn []
                  (let [actions (require :telescope.actions)
                        trouble (require :trouble.providers.telescope)
                        telescope (require :telescope)
                        colors (require :bamboo.colors)]
                    (vim.api.nvim_set_hl 0 :TelescopeResultsBorder
                                         {:fg colors.grey})
                    (vim.api.nvim_set_hl 0 :TelescopePromptBorder
                                         {:fg colors.grey})
                    (vim.api.nvim_set_hl 0 :TelescopePreviewBorder
                                         {:fg colors.grey})
                    (telescope.setup {:defeaults {:mappings {:i {:<c-o> (fn [prompt_bufnr
                                                                             _mode]
                                                                          ((. (require :trouble.providers.telescope)
                                                                              :open_with_trouble) prompt_bufnr
                                                                                                                                                                                                                       _mode))
                                                                 :<c-j> actions.move_selection_next
                                                                 :<c-k> actions.move_selection_previous}
                                                             :n {:<c-t> trouble.open_with_trouble}}
                                                  :layout_config {:prompt_position :bottom}
                                                  :layout_strategy :bottom_pane
                                                  :path_display {:shorten {:len 2
                                                                           :exclude [-1
                                                                                     -2]}}}
                                      :pickers {:find_files {:find_command [:fd
                                                                            :--hidden
                                                                            :--glob
                                                                            ""
                                                                            :--type
                                                                            :file]}
                                                :live_grep {:file_ignore_patterns [:node_modules
                                                                                   :.git]
                                                            :theme :ivy
                                                            :layout_config {:prompt_position :bottom}
                                                            :layout_strategy :bottom_pane
                                                            :find_command :rg
                                                            :additional_args (fn []
                                                                               [:--no-heading
                                                                                :--with-filename
                                                                                :--line-number
                                                                                :--column
                                                                                :--hidden
                                                                                :--smart-case])}
                                                :buffers {:mappings {:i {:<c-q> (+ actions.delete_buffer
                                                                                   actions.move_to_top)}}}}
                                      :extensions {:workspaces {:keep_insert false}}})))})
 (pack :Shatur/neovim-session-manager
       {:config (fn []
                  (let [session-manager (require :session_manager)
                        config (require :session_manager.config)]
                    (session-manager.setup {:autoload_mode config.AutoloadMode.LastSession
                                            :max_path_length 0})))})
 (pack :kyazdani42/nvim-tree.lua
       {:dependencies :kyazdani42/nvim-web-devicons
        :config true
        :opts {:view {:float {:enable true
                              :open_win_config {:relative :editor
                                                :anchor :NE
                                                :row (- (vim.api.nvim_buf_line_count 0)
                                                        1)
                                                :col (- vim.go.columns 1)}}}}})]
