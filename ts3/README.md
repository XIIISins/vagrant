Teamspeak 3 Server provisioned with Vagrant, Virtualbox and Ansible - Work in progress.

Why?

Rather than have a TS3 server sitting somewhere eating up resources - being I tended to use TS3 with the same people at the same time, this provides me the option to turn on a TS3 server as and when needed rather than have it sitting somewhere. 

It also served as a good real world use case for VBOX, Vagrant, Ansible and YAML.

How?

Quick and dirty.
This is working seamlessly now for me on the macbook, here is how I get it working on my Windows machine.

1. Download the report and put it wherever you store your vagrant VM' e.g: C:\vagrant-boxes\

2. Identify your network bridge name by going into the cmd prompt into 'c:\program files\Oracle\VirtualBox' and running the command 'VBoxManage.exe list bridgedifs'

3. inside the repo edit the file 'settings/vgt.settings.yml' - replace the bridge device name you recieved from VBoxManage.exe list bridgedifs (you will need to know which of the devices you want to use) and change the line from: bridge_int: "en0: Wifi (AirPort)" to "bridge_int: "Realtek PCIe GBE Family Controller" - replacing the Realtek name with the full name (including case of your device.

4. Back in the command line go into the repo (in the same directory as the Vagrantfile) and type 'vagrant up'

5. After about 4 mins the server should be ready and should have created a privileges token the the root of the repo dir.

6. connect your ts3 client to 192.168.0.66, all going welll, TS3 client should prompt you to enter the privileges file token.

7. Paste your token (everything in the token file after the '=' ) into the box and you should be good to go. 


Until I do more work on the README.md you will need to have an understanding of vagrant, TS3 and Ubuntu port forwarding concepts and your router of you want this to be accessed remotely - saying that, use this at your own risk the ubuntu image has not been harderned and should be considered insecure!!!.



To Do:
More stuff.
Password config stored in encrypted vault to reuse and manage a single password between all instances - this will be optional.
