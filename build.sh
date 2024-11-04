#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

### Remove packages

rpm-ostree override remove \
  code

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/40/x86_64/repoview/index.html&protocol=https&redirect=1

rpm-ostree install \
  kitty \
  clang \
  ninja-build \
  vim-X11

### add 1password
chmod +x /tmp/1password.sh && \
  ONEPASSWORD_RELEASE_CHANNEL=beta \
  GID_ONEPASSWORD=1500 \
  GID_ONEPASSWORDCLI=1600 \
  /tmp/1password.sh
