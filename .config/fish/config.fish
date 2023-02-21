abbr -a c cargo
abbr -a cb 'cargo build'
abbr -a cbr 'cargo build --release'
abbr -a cc 'cargo check'
abbr -a cf 'cargo fmt'
abbr -a ci 'cargo init'
abbr -a ck 'cargo clippy'
abbr -a ct 'cargo test'
abbr -a cn 'cargo new'
abbr -a cnl 'cargo new --lib'

abbr -a e hx

abbr -a g git
abbr -a gb 'git branch'
abbr -a gc 'git commit'
abbr -a gcf 'git commit --amend --no-edit && git push --force-with-lease origin main'
abbr -a gs 'git status'
abbr -a gp 'git push'
abbr -a ga 'git add'

abbr -a pn pnpm

if command -v exa > /dev/null
	abbr -a l 'exa'
	abbr -a ls 'exa'
	abbr -a ll 'exa -l'
	abbr -a lll 'exa -la'
else
	abbr -a l 'ls'
	abbr -a ll 'ls -l'
	abbr -a lll 'ls -la'
end


# No fish greeting
set fish_greeting ""

starship init fish | source
zoxide init fish | source

# pnpm
set -gx PNPM_HOME "/home/royrustdev/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end