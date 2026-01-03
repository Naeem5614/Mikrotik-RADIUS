1. Steps Taken to Complete the Task
   
 Configured a MikroTik CHR in VirtualBox with two network adapters: Adapter 1 (Bridged/NAT) for management and Adapter 2 (Host-only) for the Hotspot network.

 Wrote an Ansible playbook (RADIUS.yml) to automatically add a RADIUS client with the address 35.227.71.209 and secret testing123.

 Successfully executed the playbook from an Ubuntu terminal, confirming a changed=1 status for the router at 192.168.18.97.

 Assigned the IP address 192.168.88.1/24 to the ether2 interface via WinBox.

 Used the Hotspot Setup wizard in WinBox to create the server, DHCP pool, and firewall rules on ether2.

 Manually enabled the "Use RADIUS" option in the Hotspot Server Profile to link the automated RADIUS client to the Hotspot service.

 Generated the final chr.rsc configuration file using the /export command in the MikroTik terminal.

2. Challenges Encountered
   
 Ansible initially failed to connect because the MikroTik's SSH key was not trusted. This was bypassed by using the environment variable ANSIBLE_HOST_KEY_CHECKING=False.

 Encountered errors regarding the paramiko and pylibssh modules on Ubuntu 24.04. This was resolved by installing python3-paramiko through the package manager to satisfy Ansible's requirements.

 The Hotspot server initially appeared red/invalid in WinBox because it lacked a corresponding IP address and DHCP pool on the interface. Running the automated wizard resolved these dependencies.

 3. References and Resources
    
 Official guides for Hotspot Setup and RADIUS Client configuration also youtube.

 Documentation for the community.routeros collection.

 Documentation on Host-only vs Bridged adapter modes for lab environments. ( because I am WMWare fan ).
