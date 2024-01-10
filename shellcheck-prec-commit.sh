#!/bin/bash



#TODO: Install shellcheck utility
if ! command -v shellcheck > /dev/null; then
SHELLCHECK_V="shellcheck-v0.9.0"
BINARY_SHELLCHECK="/tmp/${SHELLCHECK_V}/shellcheck"

  if [[ ! -f ${BINARY_SHELLCHECK} ]]; then
    wget -q https://github.com/koalaman/shellcheck/releases/download/v0.9.0/${SHELLCHECK_V}.linux.x86_64.tar.xz -O /tmp/${SHELLCHECK_V}.tar.xz


    tar -xvf /tmp/${SHELLCHECK_V}.tar.xz -C /tmp > /dev/null
    rm -f /tmp/${SHELLCHECK_V}.tar.xz
  fi
else 
  SHELL_B="$(command -v shellcheck)"
fi
    # run against all .sh files or shellscripts ending with .sh
SHELL_FILES=$(git diff --cached --name-only | grep -E '.sh$')

if [[ -n ${SHELL_FILES} ]] ; then  
 ${BINARY_SHELLCHECK} $(echo ${SHELL_FILES}) --severity=warning
 
  if [[ $? -ne 0  ]]; then 
   echo -e "\nERROC CHECK : check script for ERROR or Warnings" 
   exit 1
  fi
fi  