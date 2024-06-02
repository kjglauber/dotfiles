#!/bin/bash

pip3 install ansible

export PATH="$PATH:$HOME/.local/bin"
ansible-galaxy install -r requirements.yml
