# TODO
  * Bugs with M-t tmux-conf now
      * This is due to tmux caching previous shell call...
  * C-g universal cancel
  * C-1 close all other panes
  * Fix switch to number window
  * Fixup mouse stuff
  * Copy/paste to system
  * Better adaptation of pencil light to tmux
  * C-x g:  Bold man-page style dividor for GIT DIFF and GIT STATUS
  * M-t tmux conf: if-shell tmux-conf is a symlink
      * Maybe add a hard-install option?
  * Help doc generator
      * You have typed C-h, the help character. Type a Help option:
          * c     Commands
          * F     formats
      * Python script to gen
      * How would i quit out of this menu?
          * I could add a hook to send-keys 'q' for quit
          * Or just don't allow pressing keys from that window
