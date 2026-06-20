# Linux Administration Learning Portfolio

This repository contains hands-on Linux administration labs completed as part of my learning journey toward Linux System Administration and Infrastructure Engineering.

The labs focus on real server administration tasks including system monitoring, DNS, web servers, monitoring, automated provisioning, VPN remote access, networking, firewalls, and service troubleshooting.

---

## Portfolio Labs

| # | Lab Name | Description |
|---|---|---|
| 01 | System Health Monitor | Bash script for checking Linux system health, including CPU, memory, disk usage, uptime, users, logs, network interfaces, and listening ports |
| 02 | BIND DNS Forward and Reverse Lookup | Configured BIND DNS server with forward and reverse lookup zones on CentOS Stream 9 |
| 03 | Nginx Static Web Server | Deployed and configured Nginx as a static web server and verified service, firewall, and web access |
| 04 | Nginx Reverse Proxy Single VM | Configured Nginx as a reverse proxy to forward client requests to a backend service on the same VM |
| 05 | Nagios Core Monitoring Server | Installed and configured Nagios Core to monitor Linux services and server health |
| 06 | Linux Provisioning Automation with DHCP, Kickstart, and Ansible | Automated CentOS Stream 9 provisioning using DHCP, Kickstart, Apache HTTP server, and Ansible post-installation configuration |
| 07 | OpenVPN Secure Remote Access Lab | Deployed and validated an OpenVPN remote access server using Easy-RSA certificates, firewalld, IP forwarding, NAT masquerading, and VPN tunnel verification |

---

## Repository Structure

linux-admin-learning-portfolio/
├── 01-system-health-monitor/
├── 02-bind-dns-forward-reverse-lookup/
├── 03-nginx-static-web-server/
├── 04-nginx-reverse-proxy-single-vm/
├── 05-nagios-core-monitoring-server/
├── 06-linux-provisioning-automation-dhcp-kickstart-ansible/
├── 07-openvpn-secure-remote-access-lab/
└── README.md

---

## Skills Practiced

- Linux command line administration
- Bash scripting
- System monitoring and troubleshooting
- Service management using systemd
- User, permission, and file management
- Network configuration using nmcli
- DNS server configuration using BIND
- Web server deployment using Nginx and Apache
- Reverse proxy configuration
- Firewall configuration using firewalld
- DHCP server configuration
- Automated OS installation using Kickstart
- Configuration management using Ansible
- OpenVPN remote access VPN deployment
- Easy-RSA certificate management
- IP forwarding and NAT masquerading
- Git and GitHub documentation workflow

---

## Environment Used

| Component | Details |
|---|---|
| Operating System | CentOS Stream 9 |
| Virtualization | VMware |
| Main Lab Server | masterdns.lab.local |
| Main Server User | marwa |
| Network Tools | nmcli, ip, ss, ping, curl |
| Service Tools | systemctl, journalctl, firewall-cmd |
| Version Control | Git and GitHub |

---

## Notes

Each lab folder contains its own README file, configuration files, command outputs, and verification evidence.

Sensitive files such as real private keys, real VPN client files, and passwords should not be uploaded to GitHub. Safe templates are used where needed.

---

## Goal

The purpose of this portfolio is to document practical Linux administration experience through real hands-on labs that demonstrate installation, configuration, validation, troubleshooting, and documentation skills.
