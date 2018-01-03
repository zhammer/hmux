# TODO
  * tx -- when in a tmux session -- should switch b/w sessions
  * Probably at some point should swithc to an emacs like config, where git clone to ~/.tmux.d and then symlink ~/.tmux.conf to ~/.tmux.d/.tmux.conf
  * Flexible status session name size -- right now gets cut off
      * Maybe just a little longer?
  * Copy/paste to system
  * C-x g: Can i use git status -vv with diff color?
  * Help doc generator
      * You have typed C-h, the help character. Type a Help option:
          * c     Commands
          * F     formats
          * show window options
          * show options
          * environment
          * hooks
      * Python script to gen
      * How would i quit out of this menu?
          * I could add a hook to send-keys 'q' for quit
          * Or just don't allow pressing keys from that window
