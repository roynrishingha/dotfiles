#!/bin/sh

# enable copr
sudo dnf copr enable atim/bottom -y

# install packages
sudo dnf install starship bat bottom exa fd-find ripgrep tokei zoxide

# cargo installs
cargo install broot cargo-geiger cargo-wipe
broot
