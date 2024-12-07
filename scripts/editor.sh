if ! command -v dconf &> /dev/null; then
    echo "dconf is not installed. Installing..."
    sudo apt update
    sudo apt install -y dconf-cli
fi

dconf write /org/mate/terminal/profiles/default/run-command-as-login-shell true
dconf write /org/mate/terminal/profiles/default/login-shell true

echo "MATE Terminal is now set to run as a login shell."

killall mate-terminal || true

echo "MATE Terminals killed for changes to apply"