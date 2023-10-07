This repo contains some basic dotfiles and config to set up a new machine for development. There's plenty here
that could be automated further, but I don't do this very often.

Below are the instructions for the manual actions that must be taken:

Ensure [homebrew](https://brew.sh) is installed.

Ensure Xcode developer tools are installed:
```sh
xcode-select --install
```

Install homebrew packages and relevant config setup.
```sh
sh brew.sh
```

To get the Terminal app's nord color theme working, follow [these install steps](https://github.com/nordtheme/terminal-app#installation).

To [get the tmux plugins (like powerline status bar) working](https://github.com/tmux-plugins/tpm#installing-plugins):
- Open a tmux session
- Press `prefix` + `I`. This will install plugins specified in `.tmux.conf`
