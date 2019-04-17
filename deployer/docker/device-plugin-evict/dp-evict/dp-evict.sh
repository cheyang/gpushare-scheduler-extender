#!/usr/bin/env bash
set -xe

if [ -d "/k8s-host" ]; then
	rm -rf /k8s-host/usr/local/k8s-host
	mkdir -p /k8s-host/usr/local/k8s-host
	cp -r /dp-evict/* /k8s-host/usr/local/dp-evict
	chmod -R +x /k8s-host/usr/local/dp-evict
	chroot /k8s-host /usr/local/k8s-host/dp-evict-on-host.sh "$@"
	while sleep 3600; do :; done
fi