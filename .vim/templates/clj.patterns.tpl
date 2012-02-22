:iabbrev (     (!cursor!)<Esc>:call search('!cursor!', 'b')<cr>cf!
:iabbrev def(  (def !cursor!)<Esc>:call search('!cursor!', 'b')<cr>cf!
:iabbrev defn( (defn !cursor!<cr>"<+DocString+>"<cr>[<+ARGS+>]<cr><+BODY+>)<Esc>:call search('!cursor!', 'b')<cr>cf!
