#!/usr/bin/env bash
set -xe

if [ -d "/k8s-host" ]; then
	rm -rf /k8s-host/usr/local/k8s-schd-extender
	mkdir -p /k8s-host/usr/local/k8s-schd-extender
	cp -r /schd-extender/* /k8s-host/usr/local/k8s-schd-extender
	chmod -R +x /k8s-host/usr/local/k8s-schd-extender/
	chroot /k8s-host /usr/local/k8s-schd-extender/schd-extender-k8s-on-host.sh "$@"
fi