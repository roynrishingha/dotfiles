<h1 align="center">dotfiles</h1>

## HOW TO SETUP

```sh
# Remove PyCharm copr repo
sudo dnf copr remove phracek/PyCharm

# Add RPM fusion repos
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# I don't have nvidia and not usng steam. So delete these
sudo rm /etc/yum.repos.d/rpmfusion-nonfree-nvidia-driver.repo
sudo rm /etc/yum.repos.d/rpmfusion-nonfree-steam.repo

# Update system
sudo dnf update

# Install fish
sudo dnf install fish
# Make fish default shell
chsh -s /usr/bin/fish

# Change hostname
sudo hostnamectl set-hostname pavilion

# Install development packages for fedora
sudo dnf install cmake freetype-devel fontconfig-devel libxkbcommon-devel libxcb-devel libX11-devel g++
sudo dnf install @development-tools

# Install Rust using rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source "$HOME/.cargo/env"
set -x PATH $HOME/.cargo/bin $PATH
source ~/.config/fish/config.fish

# Setup Alacritty Terminal Emulator
git clone https://github.com/alacritty/alacritty.git
cd alacritty/

cargo build --release
infocmp alacritty
sudo cp target/release/alacritty  /usr/local/bin
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database
sudo mkdir -p /usr/local/share/man/man1
gzip -c extra/alacritty.man | sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null
gzip -c extra/alacritty-msg.man | sudo tee /usr/local/share/man/man1/alacritty-msg.1.gz > /dev/null

mkdir -p ~/.bash_completion
cp extra/completions/alacritty.bash ~/.bash_completion/alacritty
echo "source ~/.bash_completion/alacritty" >> ~/.bashrc
mkdir -p $fish_complete_path[1]
cp extra/completions/alacritty.fish $fish_complete_path[1]/alacritty.fish

alacritty --config-file ~/.config/alacritty/alacritty.yml

# Setup Hack Nerd Fonts
mkdir -p ~/.local/share/fonts
# download the zip file from official website of nerdfonts
unzip Hack.zip
# copy all ttf files
cp *.ttf ~/.local/share/fonts/
#cache fonts
fc-cache -f -v

# Install google-chrome-stable
sudo dnf install google-chrome-stable

# Install Visual Studion Code
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf install code

# Install starship
curl -sS https://starship.rs/install.sh | sh

# Install Zellij
cargo install --locked zellij

# Install exa
cargo install exa

# Install and Setup helix editor
git clone https://github.com/helix-editor/helix
cd helix/
cargo install --locked --path helix-term
mkdir ~/.config/helix
cp -r runtime ~/.config/helix/
touch ~/.config/helix/config.toml

# Install zoxide and fzf
sudo dnf install zoxide fzf

# Install fnm
curl -fsSL https://fnm.vercel.app/install | bash
set PATH "/home/royrustdev/.local/share/fnm" $PATH
fnm env | source
source /home/royrustdev/.config/fish/conf.d/fnm.fish

# Install pnpm
curl -fsSL https://get.pnpm.io/install.sh | sh -
source /home/royrustdev/.config/fish/config.fish

# setup git
git config --global user.name "royrustdev"
git config --global user.email "royrustdev@gmail.com"
git config --global core.editor hx
git config --global init.defaultBranch main

git config --list

# setup ssh keys
exa -al ~/.ssh
ssh-keygen -t ed25519 -C "royrustdev@gmail.com"
eval (ssh-agent -c)
ssh-add ~/.ssh/id_ed25519
# copy public key from terminal
cat ~/.ssh/id_ed25519.pub

```

## PACKAGES I USE

- bat
- broot 
- cargo-geiger 
- cargo-wipe 
- broot 
- ripgrep 
- tokei
- exa

