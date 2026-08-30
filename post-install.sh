#!/usr/bin/env bash
set -euo pipefail

# Edit this array to suit your setup
PACKAGES=(
  "sshfs"
  "curl"
  "wget"
  "git"
  "vim"
  "htop"
  "tree"
  "build-essential"
  "software-properties-common"
  "ca-certificates"
  "gnupg"
  "openssh-client"
  "openssh-server"
  "net-tools"
  "dnsutils"
  "nmap"
  "python3"
  "python3-pip"
  "python3-venv"
)

die() {
  printf 'Error: %s\n' "$*" >&2
  exit 1
}

echo "Updating package lists..."
[[ $(sudo apt update) ]] || die "Could not update Packages"
echo "Upgrading existing packages..."
[[ $(sudo apt upgrade -y) ]] || die "Could not upgrade existing packages"
echo "Installing packages..."
[[ $(sudo apt install -y "${PACKAGES[@]}") ]] || die "Install failed"
echo "Removing unused packages..."
sudo apt autoremove -y
echo "Done."
