# dotfiles

## Installation

1. Stow

Managing dotfiles by [GNU Stow](https://www.gnu.org/software/stow/)

`brew install stow`

1. Install package

```sh
cd ~
git clone git@github.com:elic-eon/dotfiles.git
cd dotfiles
stow zsh_zim
```

1. Uninstall package

```sh
cd ~/dotfiles
stow -D zsh_zim
```
