#!/bin/bash

# fail on first error
set -e

rootdir=$(pwd)

export architecture=amd64
export channel=daily
export codename=jammy
export packages="systemd-sysv linux-image-generic grub-pc ostree-boot elementary-minimal elementary-desktop elementary-standard"
export version=7
export flatpak_architecture=x86_64
export ostree_branch="io.elementary.desktop/${flatpak_architecture}/${version}"

builddir=artifacts/${ostree_branch}
ostree_repo_dir=artifacts/ostree

mkdir -p ${builddir}

export LC_ALL=C
export DEBIAN_FRONTEND=noninteractive

# Install dependencies in host system
apt-get update
apt-get install -y --no-install-recommends ubuntu-keyring ca-certificates debootstrap ostree uuid-runtime ostree-boot grub-pc-bin

# Bootstrap an ubuntu minimal system
debootstrap --arch ${architecture} ${codename} ${builddir} http://archive.ubuntu.com/ubuntu
