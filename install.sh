#!/usr/bin/env bash
#
# Install hmux's config file by creating a symlink from
# ~/.tmux.conf -> $GIT_DIR/.tmux.conf.
# If there is already a ~/.tmux.conf file, save that config
# in $GIT_DIR/old-config. (If the current ~/.tmux.conf is a
# symlink, the symlinks target file will be copied.)

GIT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

USER_TMUX_CONF=~/.tmux.conf
HMUX_CONF="$GIT_DIR/.tmux.conf"

# ~/.tmux.conf exists, and it is a symlink
if [ -h $USER_TMUX_CONF ]; then
    mkdir $GIT_DIR/old-config
    TARGET_FILE=$(readlink $USER_TMUX_CONF)
    cp $TARGET_FILE $GIT_DIR/old-config/.tmux.conf.old
    rm -f $USER_TMUX_CONF
# ~/.tmux.conf exists, and it is not a symlink
elif [ -e $USER_TMUX_CONF ]; then
    mkdir $GIT_DIR/old-config
    mv $USER_TMUX_CONF $GIT_DIR/old-config/.tmux.conf.old
fi

ln -s $GIT_DIR/.tmux.conf ~/.tmux.conf
