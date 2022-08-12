#!/bin/sh

# install fish shell
sudo dnf insatll fish

echo "installing rust..."
# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
echo "rust instalation complete..."

echo "installing fnm..."
# install fnm for nodejs install
curl -fsSL https://fnm.vercel.app/install | bash
echo "fnm instalation complete..."

echo "installing pnpm..."
# install pnpm
curl -fsSL https://get.pnpm.io/install.sh | sh -
echo "pnpm instalation complete..."
