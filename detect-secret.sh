#!/bin/bash

DETECT_SECRETS=$(command -v detect-secrets)

# installing python3
if [[ -z $"{DETECT_SECRETS}" ]] ; then
sudo at install python3 python3-pip -y > /dev/null

# install detect secrets using pip
pip install detect-secrets

    if ${DETECT_SECRETS} ; then
# Add detect secret path to shell path variable 
  echo PATH=$PATH:~/.local/bin >> ~/.bashrc
    DETECT_SECRETS=~/.local/bin/detect-secrets
    fi
fi    
 
detect-secrets scan | jq -r '.results | .[]'