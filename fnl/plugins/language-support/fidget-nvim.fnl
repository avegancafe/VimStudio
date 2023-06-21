(import-macros {: pack} :macros)

(pack :j-hui/fidget.nvim
      {:tag :legacy
       :config true
       :opts {:text {:spinner :dots :done "✓"} :timer {:spinner_rate 50}}})
