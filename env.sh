#!/bin/bash
set -a

MAIN_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
ANSIBLE_CONFIG=${MAIN_DIR}/setup/ansible/ansible.cfg
ANSIBLE_INVENTORY=${MAIN_DIR}/setup/ansible/inventory.py
AGRANT_CWD=${MAIN_DIR}
VAGRANT_VAGRANTFILE=${MAIN_DIR}/Vagrantfile
