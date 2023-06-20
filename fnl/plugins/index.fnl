(var plugins [[:rktjmp/hotpot.nvim]])
(local fnl-definition-paths (.. (vim.fn.stdpath :config) :/fnl/plugins))

(if (vim.loop.fs_stat fnl-definition-paths)
    (each [file (vim.fs.dir fnl-definition-paths { :depth 3 })]
      (when (and (not= file :index.fnl) (file:match "^(.*)%.fnl$"))
        (table.insert plugins
                      (require (.. :plugins. (file:match "^(.*)%.fnl$")))))))

((. (require :lazy) :setup) plugins {:ui {:border :rounded}})
