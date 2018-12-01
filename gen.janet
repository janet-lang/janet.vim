(loop [sym :in (all-symbols)]
  (print "syn keyword JanetCoreValue " (string/replace "|" "\\|" sym)))
