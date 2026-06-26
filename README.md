# Linux Administration Learning Portfolio

This repository documents my hands-on Linux administration practice while studying a complete Linux system administration course.  
The work here is not only a collection of commands, but a practical record of how I built, configured, tested, and documented real Linux services on CentOS Stream 9.

The goal of this portfolio is to show practical Linux administration skills across system management, networking, web services, monitoring, automation, provisioning, VPN access, databases, and troubleshooting.

---

## About This Portfolio

This repository follows a structured Linux administration learning path covering:

- Linux fundamentals and command-line usage
- File system navigation and file management
- Users, groups, permissions, and ownership
- Process and service management
- Shell scripting basics
- Networking and name resolution
- Package management and repositories
- Web server deployment
- Monitoring and logging
- Automation and provisioning
- VPN server configuration
- Database-backed web services
- Documentation and validation of real lab work

Each lab includes configuration files, command outputs, and validation evidence to demonstrate that the service was installed, configured, and tested successfully.

---

## Lab Environment

| Component | Details |
|---|---|
| Operating System | CentOS Stream 9 |
| Main Hostname | masterdns.lab.local |
| Main Server IP | 192.168.209.135 |
| Lab Network IP | 192.168.56.10 |
| Virtualization | VMware-based lab environment |
| Shell | Bash |
| Package Manager | DNF / YUM |
| Firewall | firewalld |
| Service Manager | systemd |
| Version Control | Git and GitHub |

---

## Repository Structure

```text
linux-admin-learning-portfolio/
├── 01-system-health-monitor/
├── 02-bind-dns-forward-reverse-lookup/
├── 03-nginx-static-web-server/
├── 04-nginx-reverse-proxy-single-vm/
├── 05-nagios-core-monitoring-server/
├── 06-linux-provisioning-automation-dhcp-kickstart-ansible/
├── 07-openvpn-secure-remote-access-lab/
├── 08-lamp-stack-web-server/
└── README.md
```

---

## Completed Labs

| No. | Lab | Summary |
|---|---|---|
| 01 | System Health Monitor | Built a Bash-based system health report script to collect system information, uptime, memory, disk usage, running processes, network details, listening ports, and recent system errors. |
| 02 | BIND DNS Forward and Reverse Lookup | Configured a local DNS server using BIND with forward and reverse zones, then validated name resolution using `dig` and zone-checking tools. |
| 03 | Nginx Static Web Server | Installed and configured Nginx to serve a static website from a custom web root, with firewall and service validation. |
| 04 | Nginx Reverse Proxy | Configured Nginx as a reverse proxy forwarding traffic from port 80 to a backend service running on port 8080 on the same VM. |
| 05 | Nagios Core Monitoring Server | Deployed Nagios Core to monitor Linux host and service availability, including configuration validation and web interface access. |
| 06 | DHCP, Kickstart, and Ansible Provisioning | Built an automated provisioning lab using DHCP, Kickstart, Apache HTTP server, and Ansible post-installation configuration. |
| 07 | OpenVPN Secure Remote Access | Configured an OpenVPN remote access server using Easy-RSA certificates, firewalld, IP forwarding, NAT masquerading, and VPN tunnel validation. |
| 08 | LAMP Stack Web Server | Installed and configured Apache, MariaDB, and PHP, then validated static web content, PHP execution, database creation, and PHP-to-MariaDB connectivity. |

---

## Course Topics Covered Through This Portfolio

### Linux Concepts and Installation

The learning path started with Linux basics, Linux distributions, virtual machines, CentOS installation, and the difference between Linux and Windows environments.

Practical coverage includes:

- Linux operating system concepts
- CentOS Stream installation and usage
- Virtual machine setup
- Hostname and network identity
- Linux server access through terminal and SSH

---

### File System and Command Line

The course introduced Linux file system structure, paths, file creation, directory navigation, links, wildcards, and command-line efficiency.

Practical coverage includes:

- File and directory navigation
- Absolute and relative paths
- File creation and editing
- Soft links and hard links
- Searching for files
- Working with command output
- Using common CLI tools safely and consistently

---

### Linux Fundamentals

The portfolio reflects practice with daily Linux administration commands and core system behavior.

Practical coverage includes:

- Permissions using `chmod`
- Ownership using `chown` and `chgrp`
- Text processing with `grep`, `awk`, `cut`, `sort`, `uniq`, and `wc`
- File comparison with `diff` and `cmp`
- Archiving and compression with `tar`, `gzip`, and `gunzip`
- Pipes and redirection
- Reading documentation with `man` and related help tools

---

### System Administration

Several labs focus on real system administration tasks, including service management, user awareness, process monitoring, logs, and troubleshooting.

Practical coverage includes:

- Managing services with `systemctl`
- Checking process activity with `ps` and `top`
- Scheduling concepts with `cron` and `at`
- System monitoring commands
- Hostname management
- OS information gathering
- Basic troubleshooting and validation
- Service status collection for documentation

---

### Shell Scripting

The first lab introduces Bash scripting for operational reporting and system checks.

Practical coverage includes:

- Bash script structure
- Variables
- Command output collection
- Conditional checks
- Report generation
- Basic automation logic
- Script-based documentation of system state

---

### Networking and Server Services

A major part of this portfolio focuses on Linux networking and server services.

Practical coverage includes:

- IP addressing and interface validation
- DNS using BIND
- Web services using Nginx and Apache
- Firewall configuration using firewalld
- HTTP service validation using `curl`
- DNS testing using `dig`
- Remote access concepts
- VPN access using OpenVPN
- Network troubleshooting commands

---

### Package Management and Repositories

The labs required installing and validating multiple Linux packages and services.

Practical coverage includes:

- Installing packages with `dnf`
- Checking installed packages with `rpm`
- Managing services after installation
- Validating configuration files
- Keeping evidence of installed components

---

### Monitoring and Logging

Monitoring was practiced through the Nagios Core lab and system health reporting.

Practical coverage includes:

- Host and service monitoring
- Nagios configuration files
- Monitoring status validation
- System health reporting
- Firewall and service state collection
- Output-based documentation

---

### Automation and Provisioning

The provisioning lab demonstrates how Linux installations and post-installation configuration can be automated.

Practical coverage includes:

- DHCP-based network boot support
- Kickstart automated installation
- Apache-hosted Kickstart file delivery
- Ansible inventory configuration
- Ansible connectivity testing
- Post-installation configuration using playbooks

---

### Security and Remote Access

The OpenVPN lab demonstrates secure remote access concepts and Linux network security configuration.

Practical coverage includes:

- Certificate authority setup with Easy-RSA
- Server and client certificate generation
- OpenVPN server configuration
- Client profile generation
- IP forwarding
- NAT masquerading
- Firewall rules
- VPN tunnel verification

---

### Web and Database Services

The LAMP stack lab connects Linux web hosting with database-backed application behavior.

Practical coverage includes:

- Apache HTTP Server
- MariaDB database server
- PHP runtime
- PHP MySQL support
- Database and user creation
- Table creation and test records
- PHP-to-MariaDB connection testing

---

## Technologies Practiced

| Category | Tools / Services |
|---|---|
| Operating System | CentOS Stream 9 |
| Web Servers | Nginx, Apache HTTP Server |
| DNS | BIND, dig, named-checkzone |
| Monitoring | Nagios Core |
| Automation | Ansible |
| Provisioning | DHCP, Kickstart, Apache HTTP delivery |
| VPN | OpenVPN, Easy-RSA |
| Database | MariaDB |
| Web Runtime | PHP |
| Firewall | firewalld |
| Security | SELinux basics, firewall rules, VPN certificates |
| Scripting | Bash |
| Version Control | Git, GitHub |
| Troubleshooting | systemctl, curl, ss, ping, dig, rpm, journalctl |

---

## Skills Demonstrated

- Linux server installation and configuration
- Command-line administration
- Service deployment and validation
- DNS forward and reverse lookup configuration
- Web server hosting and reverse proxy setup
- Monitoring server deployment
- Automated Linux provisioning
- Configuration management with Ansible
- VPN server setup and secure client access
- LAMP stack deployment
- MariaDB database administration basics
- PHP database connectivity
- Firewall service management
- Troubleshooting using Linux tools
- Writing structured technical documentation
- Maintaining a clean GitHub-based technical portfolio

---

## Documentation Standard

Each lab is documented with a consistent structure:

```text
Lab Folder/
├── configs/
├── outputs/
├── screenshots/
└── README.md
```

### configs/

Contains important configuration files used during the lab.

### outputs/

Contains command outputs used as evidence that the service was installed, configured, and tested successfully.

### screenshots/

Reserved for visual proof such as web interfaces, browser tests, or service dashboards.

### README.md

Explains the lab objective, environment, configuration steps, validation commands, and final result.

---

## Validation Approach

I validate each lab using practical command-line checks instead of only describing the setup.

Examples include:

```bash
systemctl status service-name --no-pager
curl http://localhost
dig example.local
firewall-cmd --list-all
rpm -qa | grep package-name
ss -tulnp
ansible all -m ping
mysql -u user -p -e "SQL_QUERY"
```

This makes each lab easier to review, repeat, and troubleshoot.

---

## Current Progress

The portfolio currently includes eight completed hands-on labs:

```text
01 - System Health Monitor
02 - BIND DNS Forward and Reverse Lookup
03 - Nginx Static Web Server
04 - Nginx Reverse Proxy
05 - Nagios Core Monitoring Server
06 - DHCP, Kickstart, and Ansible Provisioning
07 - OpenVPN Secure Remote Access
08 - LAMP Stack Web Server
```

More labs may be added as the course progresses, especially around storage management, LVM, RAID, Samba, advanced firewalling, backups, and additional automation.

---

## Purpose

This repository is part of my Linux administration learning journey.  
It is designed to show real practical work, not only course notes.

The main focus is to demonstrate that I can:

- Build Linux services from scratch
- Understand what each component does
- Validate configurations with real commands
- Troubleshoot common issues
- Keep clean documentation
- Use GitHub to present technical work professionally

---

## Author

**Marwa Salama**  
GitHub: `marwasalama`

