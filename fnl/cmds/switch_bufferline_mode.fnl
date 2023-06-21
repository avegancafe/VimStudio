(var BUFFER-CURRENT-TABMODE :buffers)

(fn []
  (if (= BUFFER-CURRENT-TABMODE :tabs)
      (do
        (print "switching to buffer mode")
        ((. (require :cmds/setup_bufferline) :setup) :buffers)
        (set BUFFER-CURRENT-TABMODE :buffers))
      (do
        (print "switching to tab mode")
        ((. (require :cmds/setup_bufferline) :setup) :tabs)
        (set BUFFER-CURRENT-TABMODE :tabs))))	
