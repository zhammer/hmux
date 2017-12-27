# tx.sh
#
# Sourceable bash functions / aliases for simplifying tmux shell commands.

# Attach to tmux session SESSION_NAME if it exists, otherwise create a new session.
tx () {
    SESSION_NAME=$1

    if [ $SESSION_NAME == "ls" ]; then
        tmux ls
        return
    fi

    tmux ls | grep "^${SESSION_NAME}:"
    if [ $? -ne 0 ]; then
        tmux new -s $SESSION_NAME
    else
        tmux attach -t $SESSION_NAME
    fi
}

alias txk='tmux kill-session -t'
