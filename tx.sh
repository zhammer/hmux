# tx.sh
#
# Sourceable bash functions / aliases for simplifying tmux shell commands.

# A shortcut function for easy tmux navigation.
#
# tx ls will give a list of active tmux sessions.
# tx {session_name} behaves differently depending on whether the user is inside a tmux session.
# if outside tmux:
#    tx {session_name} will attach to {session_name} if it exists, else will create {session_name}
# if inside tmux:
#    tx {session_name} will switch to {session_name} if it exists, else will print an error message.
tx () {
    SESSION_NAME=$1

    if [ $SESSION_NAME == "ls" ]; then
        tmux ls
        return
    fi

    # If we are 'in' tmux, try to switch to the target session, fail if session doesn't exit.
    if [ ! -z $TMUX ]; then
        tmux switch-client -t $SESSION_NAME
        return $?
    fi

    # If we are outside of tmux, attach to the session if it exists, otherwise create it and attach.
    tmux ls | grep "^${SESSION_NAME}:" -q
    if [ $? -eq 0 ]; then
        tmux attach -t $SESSION_NAME
    else
        tmux new -s $SESSION_NAME
    fi
}

alias txk='tmux kill-session -t'
