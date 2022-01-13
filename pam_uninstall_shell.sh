#!/bin/bash

echo "start uninstall ..."

sed -i 's#^ChallengeResponseAuthentication yes#ChallengeResponseAuthentication no#' /etc/ssh/sshd_config
sed -i '/pam_tg_auth/d' /etc/pam.d/sshd
rm -rf /usr/lib64/security/pam_python.so
rm -rf /usr/lib64/security/pam_tg_auth.py
rm -rf pam-python-1.0.7
rm -rf pam-python-1.0.7.tar.gz
systemctl restart sshd

echo "ok..."