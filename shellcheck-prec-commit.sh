#!/bin/bash



#TODO: Install shellcheck utility
if ! command -v shellcheck > /dev/null ; then
SHELLCHECK_V="shellcheck-v0.9.0"
BINARY_SHELLCHECK="/tmp/${SHELLCHECK_V}/shellcheck"

if [[! -f ${BINARY_SHELLCHECK} ]]
wget -q https://github.com/koalaman/shellcheck/releases/download/v0.9.0/${SHELLCHECK_V}.linux.x86_64.tar.xz -O /tmp/${SHELLCHECK_V}.tar.xz


tar -xvf /tmp/${SHELLCHECK_V}.tar.xz -C /tmp > /dev/null
rm -f /tmp/${SHELLCHECK_V}.tar.xz
fi 
 else 
 SHELL_B=$( command -v shellcheck )


#TODO: run against all .sh files or shellscripts
${BINARY_SHELLCHECK} csp-authentication.sh --severity=warning