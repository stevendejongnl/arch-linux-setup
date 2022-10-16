#! /bin/sh

install () {
    mkdir -p $HOME/.config/scripts
    rsync -av --progress "$DIR/god-mode/dotconfig/scripts/" "$HOME/.config/scripts/"

    ln -sf "$HOME/.config/scripts/notifications-clear" "$HOME/.local/bin/notifications-clear"
    ln -sf "$HOME/.config/scripts/notifications-open-all" "$HOME/.local/bin/notifications-open-all"
}

if [ -n "$INSTALL_ALL" ]; then
    install
else
    read -r -p "Install scripts [y/N] " install_question
    if [[ "$install_question" =~ ^([yY][eE][sS]|[yY])$ ]]; then
        install
    fi
fi
