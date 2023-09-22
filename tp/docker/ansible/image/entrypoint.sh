#!/bin/bash
chmod go-rwx /home/demo/.ssh/id_rsa*
sudo chown demo:demo /home/demo/.ssh
exec $*
