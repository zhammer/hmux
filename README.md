# hmux (hammermux)
An ```emacs```-inspired configuration of ```tmux```.

### Overview
```hmux``` is an ```emacs```-inspired configuration of ```tmux``` that also comes along with a few bash functions to make ```tmux``` more accessible. If you use ```vim``` or another editor and want an easy-to-switch-to ```tmux```, ```hmux```'s [.tmux.conf](.tmux.conf) file should be good a starting place to start switching over useful ```tmux``` commands to your familiar bindings.

While ```tmux``` is not nearly as customizable as ```emacs```, ```tmux``` does come with a surprising amount of customizable variables, hooks and bindings. The ```C-h``` help prefix key should come in handy for anyone who wants to play around with their ```tmux``` conf.

### Installation
```git clone https://github.com/zhammer/hmux.git ~/.tmux.d ; ~/.tmux.d/install.sh``` should be all you need to install ```hmux``` and be able to pull from and push to github.

### Bash functions ([tx.sh](tx.sh))
* ```tx ls```
    * List all sessions on the default tmux server (```tmux ls```).
* ```tx {session_name}```
    * If called from outside a tmux client:
         * Attach to ```{session_name}``` if it exists, otherwise create a new session called ```{session_name}``` and attach to it.
    * If called from inside a tmux client:
         * Switch to ```{session_name}``` if it exists, otherwise print an error message.
* ```txk {session_name}```
    * Kill ```{session_name}```.

### Emacs-inspired bindings
* ```C-x-``` global prefix key
    * In ```hmux```, the default ```tmux``` prefix key is switched from ```C-b``` to ```C-x``` to match the prefix key of ```emacs```.
    * *(This means that using ```emacs``` in the shell requires an extra ```C-x``` to send the prefix key, though I dont know many people who use ```emacs``` in ```-nw``` mode)*
* ```C-h-``` help prefix key
    * Prefix command for accessing information on active ```tmux``` key bindings and environment variables as well as ```tmux``` man-page documentation.
    * ```C-h-?``` for more info (in progress)
* ```C-x 0``` delete current pane
    * Delete the current pane. Fails if there is only one pane in the current window.
* ```C-x 1``` delete other panes in window
    * Delete all panes in the current window besides the active pane.
* ```C-x 2``` split pane below
    * Split the current pane vertically so that the new pane below is in the current pane's directory.
* ```C-x 3``` split pane right
    * Split the current pane horizontally so that the new pane to the right is in the current pane's directory.
* ```C-x k``` kill pane (y/n)
* ```M-x AND M-:``` command prompt
* ```C-x g``` magit-lite
    * If inside a git repo, view the colorized git diff and status in a new window.

### Custom hmux bindings / shortcuts
* ```C-x r``` re-source ~/.tmux.conf file
* ```M-[``` copy mode
* ```M-]``` paste buffer
* ```C-x M-(Up|Down|Left|Right)``` quick resize
* ```M-t``` open new window in ~/.tmux.d
* ```C-b [0-9]``` switch to window [0-9]
    * (Emacs bindings overwrite some of the default * ```C-x 0-9``` bindings)

### Helpful tmux bindings / commands
* ```C-x s``` choose session
    * Open the list of active sessions in an interactive pane
    * tmux command: ```choose-tree -s```
* ```C-x z``` zoom pane
    * 'Zoom in' on the current pane, making it full screen until the ```C-x z``` is entered again
    * tmux command: ```resize-pane -Z```
