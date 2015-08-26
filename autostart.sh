#!/bin/bash
#
# Vagrant start script
# Starts from symlinks in autostart folder.
#

vagrantdir=$HOME/vagrant/autostart
autostart=`find $vagrantdir -type l`

show_help() {
	echo -e "Autostart vagrant boxes in $vagrantdir."
	echo -e "Make sure you put symlinks to the boxes in $vagrantdir"
	echo -e "{start|stop}"
}


if [ $# -eq  0 ]; then
    show_help
    exit 1
fi

if [ $@ == 'start' ]; then
	command='up'
	show_status='starting'
elif [ $@ == 'stop' ]; then
	command='halt'
	show_status='stopping'
fi

if [[ ! $autostart ]]; then
	echo -e "Nothing to start..."
	show_help
	exit 1
fi

for host in $autostart; do
	hostname=`echo $host | sed 's/\/home\/.*\///'`
	cd $host
	echo -e "$show_status $hostname.."
	vagrant $command $host
	echo -e "\n"
	sleep 5
done
