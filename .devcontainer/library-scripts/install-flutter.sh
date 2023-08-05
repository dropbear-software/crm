#!/usr/bin/env bash
set -e

wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.10.6-stable.tar.xz -O /tmp/flutter.tar.xz
tar -xf /tmp/flutter.tar.xz -C $HOME