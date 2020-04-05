#!/bin/sh
if [ $# != 3 ]
then
    echo "usage: $0 <kube-config-path> <work-dir-path> <gpg-dir-path>"
    exit 1
fi

kube_config_path=$(readlink -f "$1")
work_dir_path=$(readlink -f "$2")
gpg_dir_path=$(readlink -f "$3")
podman run -it --rm -v "$kube_config_path:/root/.kube/config:Z" -v "$work_dir_path:/config:Z" -v "$gpg_dir_path:/root/.gnupg:Z" helm-box:devel
