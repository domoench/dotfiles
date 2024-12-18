This repo contains some basic dotfiles and config to set up a new machine (MacOS) for development.
There's plenty here that can be automated further, but I don't do this very often.

Below are the instructions for the manual actions that must be taken:

**OS-level dev env**

Ensure [homebrew](https://brew.sh) is installed.

Ensure Xcode developer tools are installed:
```sh
xcode-select --install
```

Install homebrew packages and relevant config setup.
```sh
sh brew.sh
```

**Terminal setup**

To get the Terminal app's nord color theme working, follow [these install steps](https://github.com/nordtheme/terminal-app#installation).

To [get the tmux plugins (like powerline status bar) working](https://github.com/tmux-plugins/tpm#installing-plugins):
- Open a tmux session
- Press `prefix` + `I`. This will install plugins specified in `.tmux.conf`

**Neovim setup**

Vim config:
- Copy this repo's `init.vim` to `~/.config/nvim/init.vim`.

To enable ALE linting of python code in vim:
- Ensure `flake8` and `jedi-language-server` are available in the context of the project:
Either install in the local python project virtual env, or in the global pyenv-managed python's packages.
