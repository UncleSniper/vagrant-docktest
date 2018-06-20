#!/bin/bash

if [ ! -x /usr/bin/python ]; then
	apt-get install -y python;
fi

if [ ! -x /usr/bin/ansible ]; then
	apt-get install -y software-properties-common
	apt-add-repository ppa:ansible/ansible
	apt-get update
	apt-get install -y ansible
	apt-get install -y libstdc++5
fi
