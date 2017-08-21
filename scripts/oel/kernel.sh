#!/bin/bash -eux
#===============================================================================
# vim: softtabstop=2 shiftwidth=2 expandtab fenc=utf-8 spelllang=en ft=sh
#===============================================================================

function echoinfo() {
  local BC="\033[1;34m"
  local EC="\033[0m"
  printf "${BC} ☆  INFO${EC}: %s\n" "$@";
}

function disable_transparent_hugepages() {
  echoinfo "Disabling transparent hugepages"
  sed -i 's/^GRUB_CMDLINE_LINUX.*quiet/& transparent_hugepages=never/' /etc/default/grub
  grub2-mkconfig -o /boot/grub2/grub.cfg
}

function disable_tuned() {
  echoinfo "Disabling the tuned service"
  systemctl stop tuned
  systemctl disable tuned
}

disable_transparent_hugepages
disable_tuned

echoinfo "Rebooting the machine"
reboot
sleep 60
