# BIND DNS Forward and Reverse Lookup Lab

## Objective

The objective of this lab is to configure a DNS server on a CentOS Stream 9 virtual machine using BIND.
The lab includes forward lookup configuration, reverse lookup configuration, DNS service management, and DNS testing using `dig`.

## Lab Environment

| Item                | Value               |
| ------------------- | ------------------- |
| Operating System    | CentOS Stream 9     |
| DNS Software        | BIND                |
| DNS Service         | named               |
| DNS Server Hostname | masterdns.lab.local |
| DNS Server IP       | 192.168.209.135     |
| Domain Name         | lab.local           |
| Forward Zone File   | forward.lab         |
| Reverse Zone File   | reverse.lab         |

## Tools and Commands Used

* `dnf`
* `rpm`
* `hostnamectl`
* `vi`
* `systemctl`
* `named-checkconf`
* `named-checkzone`
* `dig`
* `chgrp`
* `chown`

## Lab Steps

### 1. Installed BIND and DNS Utilities

BIND and its utilities were installed using:

```bash
sudo dnf install bind bind-utils -y
```

The installed packages were verified using:

```bash
rpm -qa | grep bind
```

### 2. Configured the Server Hostname

The server hostname was changed to:

```bash
masterdns.lab.local
```

Command used:

```bash
sudo hostnamectl set-hostname masterdns.lab.local
```

### 3. Updated the Local Hosts File

The following entry was added to `/etc/hosts`:

```text
192.168.209.135   masterdns.lab.local masterdns
```

This allows the machine to resolve its own hostname locally.

### 4. Configured BIND Main Configuration File

The main BIND configuration file `/etc/named.conf` was updated to define:

* Forward lookup zone
* Reverse lookup zone
* DNS listening address
* Allowed query network

The forward zone used in this lab is:

```text
lab.local
```

The reverse zone used in this lab is:

```text
209.168.192.in-addr.arpa
```

### 5. Created the Forward Zone File

The forward zone file was created at:

```text
/var/named/forward.lab
```

This file maps hostnames to IP addresses.

Example records:

```text
masterdns.lab.local → 192.168.209.135
clienta.lab.local   → 192.168.209.136
clientb.lab.local   → 192.168.209.137
```

### 6. Created the Reverse Zone File

The reverse zone file was created at:

```text
/var/named/reverse.lab
```

This file maps IP addresses back to hostnames.

Example records:

```text
192.168.209.135 → masterdns.lab.local
192.168.209.136 → clienta.lab.local
192.168.209.137 → clientb.lab.local
```

### 7. Validated BIND Configuration

The main configuration file was checked using:

```bash
sudo named-checkconf /etc/named.conf
```

The forward zone was checked using:

```bash
sudo named-checkzone lab.local /var/named/forward.lab
```

The reverse zone was checked using:

```bash
sudo named-checkzone 209.168.192.in-addr.arpa /var/named/reverse.lab
```

Both zone files returned `OK`.

### 8. Adjusted Ownership and Permissions

The zone files were assigned to the `named` group:

```bash
sudo chgrp named -R /var/named
```

The main BIND configuration file ownership was set to `root:named`:

```bash
sudo chown root:named /etc/named.conf
```

This allows the `named` DNS service to read the required configuration and zone files.

### 9. Started and Enabled the DNS Service

The DNS service was started using:

```bash
sudo systemctl start named
```

The service was enabled to start automatically on boot:

```bash
sudo systemctl enable named
```

The service status was verified using:

```bash
sudo systemctl status named
```

The service was active and running.

## Testing

### Forward Lookup Test

Forward lookup was tested using:

```bash
dig @192.168.209.135 masterdns.lab.local
dig @192.168.209.135 clienta.lab.local
dig @192.168.209.135 clientb.lab.local
```

Successful results:

```text
masterdns.lab.local → 192.168.209.135
clienta.lab.local   → 192.168.209.136
clientb.lab.local   → 192.168.209.137
```

### Reverse Lookup Test

Reverse lookup was tested using:

```bash
dig @192.168.209.135 -x 192.168.209.135
dig @192.168.209.135 -x 192.168.209.136
dig @192.168.209.135 -x 192.168.209.137
```

Successful results:

```text
192.168.209.135 → masterdns.lab.local
192.168.209.136 → clienta.lab.local
192.168.209.137 → clientb.lab.local
```

## Repository Structure

```text
02-bind-dns-forward-reverse-lookup/
├── README.md
├── config-files/
│   ├── named.conf
│   ├── forward.lab
│   └── reverse.lab
└── outputs/
    ├── service-status.txt
    ├── zone-checks.txt
    ├── forward-lookup-tests.txt
    └── reverse-lookup-tests.txt
```

## Skills Practiced

* Linux package installation
* DNS server configuration
* BIND administration
* Forward DNS lookup
* Reverse DNS lookup
* Zone file creation
* Linux service management using `systemctl`
* DNS troubleshooting using `dig`
* Configuration validation using `named-checkconf` and `named-checkzone`

## Notes

This lab was completed using one CentOS Stream 9 virtual machine.
The same VM was used as the DNS server and for local DNS testing.

