#!/usr/bin/env bash
#
# Install hmux's config file by creating a symlink from
# ~/.tmux.conf -> ~/.tmux.d/.tmux.conf.
# If there is already a ~/.tmux.conf file, rename it
# to ~/.tmux.conf.old.{timestamp}

if [ ! -e ~/.tmux.d/.tmux.conf ]; then
    echo "hmux must be cloned into ~/.tmux.d for install.sh to work."
    return
fi

OLD_TMUX_RENAME=~/.tmux.conf.old.$(date +%Y%m%d%H%M%S)
if [ -e ~/.tmux.conf ]; then
    mv ~/.tmux.conf $OLD_TMUX_RENAME
    echo "Renamed existing '~/.tmux.conf' to '$OLD_TMUX_RENAME'."
fi

ln -s ~/.tmux.d/.tmux.conf ~/.tmux.conf

echo
echo "hmux installation complete!"
echo "Source '~/.tmux.d/tx.sh' or append it to '~/.bash_profile' for some extra tmux shortcuts."
