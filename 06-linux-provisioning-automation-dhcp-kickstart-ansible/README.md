# Linux Provisioning Automation with DHCP, Kickstart, and Ansible

## Objective

This lab demonstrates how to automate the provisioning of a CentOS Stream 9 client machine using DHCP, Kickstart, and Ansible.

The goal is to simulate a real infrastructure provisioning workflow where a server provides network configuration, hosts an unattended installation file, and applies post-installation configuration management.

## Lab Components

| Component | Purpose |
|---|---|
| DHCP Server | Provides automatic IP addresses to the client VM |
| Apache HTTP Server | Hosts the Kickstart configuration file |
| Kickstart | Automates the CentOS Stream 9 installation |
| Ansible | Applies post-installation configuration to the client |
| SSH | Allows Ansible to manage the client remotely |

## Lab Topology

Server VM: masterdns.lab.local

- ens160: NAT / Internet network
- ens224: 192.168.56.10/24
- DHCP Server
- Apache HTTP Server
- Kickstart file: /var/www/html/ks.cfg
- Ansible Control Node

Client VM: kickstart-client.lab.local

- Network: Host-only
- IP from DHCP: 192.168.56.51/24
- Installed automatically using Kickstart
- Configured after installation using Ansible

## Server Network Configuration

The server was configured with two network interfaces:

| Interface | IP Address | Purpose |
|---|---|---|
| ens160 | 192.168.209.135/24 | NAT / Internet access |
| ens224 | 192.168.56.10/24 | Private lab network |

The DHCP service was configured to listen on the lab network interface `ens224`.

## DHCP Configuration

The DHCP server was configured to provide IP addresses from the following range:

192.168.56.50 - 192.168.56.100

The client received the following IP address from DHCP:

192.168.56.51/24

DHCP configuration file:

configs/dhcpd.conf

## Kickstart Configuration

The Kickstart file was hosted through Apache at:

http://192.168.56.10/ks.cfg

The Kickstart file automated the following installation tasks:

- Language and keyboard configuration
- Timezone configuration
- Root password setup
- User creation
- DHCP network configuration
- Hostname configuration
- Automatic disk partitioning
- Package installation
- SSH enablement
- Post-installation validation file creation

Kickstart configuration file:

configs/ks.cfg

## Kickstart Boot Option

The client VM was booted from the CentOS Stream 9 ISO, and the following boot option was added to the GRUB `linuxefi` line:

inst.ks=http://192.168.56.10/ks.cfg

This allowed the Anaconda installer to download the Kickstart file and perform the installation automatically.

## Ansible Configuration

After the client installation was completed, Ansible was used from the server VM to configure the client.

Ansible inventory file:

ansible/inventory.ini

Ansible playbook file:

ansible/playbook.yml

The playbook performed the following tasks:

- Ensured the SSH service was enabled and running
- Copied a login message to `/etc/motd`
- Created an Ansible validation file under `/root`

## Verification

The following checks were performed and saved under the `outputs/` directory:

| Output File | Purpose |
|---|---|
| server-network-interfaces.txt | Server network interface verification |
| server-nmcli-device-status.txt | Server NetworkManager device status |
| server-nmcli-connections.txt | Server NetworkManager connection profiles |
| dhcp-package-version.txt | DHCP package version |
| dhcpd-status.txt | DHCP service status |
| dhcpd-interface-binding.txt | DHCP interface binding configuration |
| httpd-package-version.txt | Apache package version |
| httpd-status.txt | Apache service status |
| http-port-listening.txt | HTTP port listening verification |
| firewall-services.txt | Firewall service verification |
| kickstart-url-test.txt | Kickstart URL accessibility test |
| client-ping-test.txt | Ping test from server to client |
| client-hostnamectl.txt | Client hostname verification |
| client-ip-address.txt | Client DHCP IP verification |
| client-basic-user-check.txt | Client user environment verification |
| client-kickstart-post-validation.txt | Kickstart post-install validation |
| client-installed-packages.txt | Client package verification |
| client-sshd-status.txt | SSH service status on client |
| ansible-version.txt | Ansible version verification |
| ansible-ping.txt | Ansible connectivity test |
| ansible-playbook-output.txt | Ansible playbook execution output |
| ansible-validation-file.txt | Ansible post-configuration validation |
| ansible-motd-validation.txt | MOTD configuration validation |

## Key Results

- DHCP successfully assigned an IP address to the client.
- The Kickstart file was successfully downloaded from the HTTP server.
- CentOS Stream 9 was installed automatically.
- The client hostname was configured as `kickstart-client.lab.local`.
- SSH was enabled and running on the client.
- Ansible successfully connected to the client.
- The Ansible playbook completed with `failed=0`.
- Ansible created a validation file on the client.
- Ansible configured the client login message.

## Important Notes

The client VM was connected to a Host-only network. Because of that, it did not have direct Internet access during the Ansible stage.

For this reason, the final Ansible playbook focused on post-installation configuration tasks that did not require external package repositories.

During the first Ansible run, the package installation task was removed because the client did not have access to external repositories through the Host-only network.

## Skills Practiced

- Linux network configuration
- DHCP server configuration
- Apache HTTP server usage
- Kickstart automated installation
- Anaconda installer boot options
- SSH remote access
- Ansible inventory configuration
- Ansible playbook execution
- Linux service management with systemd
- Firewall configuration
- Lab documentation and output collection
