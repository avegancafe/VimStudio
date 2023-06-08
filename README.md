<img src="https://github.com/avegancafe/VimStudio/raw/main/assets/logo.png"
/>

---

A simple neovim configuration with easy configuration via [fennel-lang](https://fennel-lang.org/) and lua.

To install, simply run the following:

```bash
$ brew install neovim
$ git clone git@github.com:avegancafe/VimStudio.git ~/.config/nvim
```

After cloning, you are good to run `vim`. It will bootstrap itself by installing all of its necessary
plugins. After finishing setting up Hotpot, lazy.nvim, and treesitter, it should
be ready to go!

## Installation

### Ubuntu
```bash
$ sudo apt install fdfind && sudo mv /usr/bin/fdfind /usr/bin/fd
$ curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
$ sudo apt install gcc cmake gettext nodejs npm
$ git clone https://github.com/neovim/neovim ~/neovim/
$ cd ~/neovim
$ make CMAKE_BUILD_TYPE=RelWithDebInfo
$ sudo make install
$ echo 'export PATH="$HOME/neovim/build/bin/:$PATH"' > ~/.bashrc # or equivalent in your shell of choice
```

### macOS

```bash
$ curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
$ brew install fd nodejs ripgrep ag neovim
# restart your terminal after installing everything
```
