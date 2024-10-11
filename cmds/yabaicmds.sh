# install yabai
brew install koekeishiya/formulae/yabai
# OR 
# curl -L https://raw.githubusercontent.com/koekeishiya/yabai/master/scripts/install.sh | sh /dev/stdin ~/.local/bin ~/.local/man

# disable system integrity https://github.com/koekeishiya/yabai/wiki/Disabling-System-Integrity-Protection
# power down, hold power button until startup options appear, login to authorized user > utilities > terminal
csrutil enable --without fs --without debug --without nvram

# after reboot
sudo nvram boot-args=-arm64e_preview_abi

# reboot again and then run
csrutil status

# should say System Integrity Protection: unknown or disabled

# allow for user to load-sa on startup
echo "$(whoami) ALL=(root) NOPASSWD: sha256:$(shasum -a 256 $(which yabai) | cut -d " " -f 1) $(which yabai) --load-sa" | sudo tee /private/etc/sudoers.d/yabai

