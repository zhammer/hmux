# TODO
  * Help mode
  * Bugs with M-t tmux-conf now
      * This is due to tmux caching previous shell call...
  * Join window to previous window (if only one pane)
  * C-g universal cancel
  * C-1 close all other panes
  * Fix switch to number window
  * Fixup mouse stuff
  * Copy/paste to system
  * -Help System-
      * custom key table 'help'
      * C-h switch to mode, display 'C-h .. ?'
      * All keys set to exit mode, except for specific keys that exit mode then jump to sections in man or to list-keys
          * Unknown key: exit mode (return to prev if possible), print "key sequence doesnt exist"
          * Known key: exit mode (return to prev if possible), open new window w/ man page or list-keys
          * C-g: exit cleanly
      * man -P 'less -p ^ENVIRONMENT' tmux
