#!/bin/bash -eux
#===============================================================================
# vim: softtabstop=2 shiftwidth=2 expandtab fenc=utf-8 spelllang=en ft=sh
#===============================================================================

declare -a additional_packages=("vim-enhanced" "htop" "jq" "python-pip" "PyYAML" "python-requests")

function echoinfo() {
  local BC="\033[1;34m"
  local EC="\033[0m"
  printf "${BC} ☆  INFO${EC}: %s\n" "$@";
}

function update_packages() {
  echoinfo "Updating installed packages"
  sudo yum update -y
}

function install_additional_packages() {
  echoinfo "Installing additional packages"
  for package in "${additional_packages[@]}"; do
    echodebug "Installing ${package}"
    sudo yum install -y "${package}"
  done
}

update_packages
install_additional_packages
