(loop [sym :in (all-bindings)]
  (print "syn keyword JanetCoreValue " (string/replace "|" "\\|" sym)))
