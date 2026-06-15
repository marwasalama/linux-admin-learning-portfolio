# Lab 05 - Nagios Core Monitoring Server on CentOS

## Objective

Install and configure Nagios Core on CentOS Stream 9 to monitor Linux hosts and services through a web-based monitoring interface.

## Lab Environment

| Item | Details |
|---|---|
| Operating System | CentOS Stream 9 |
| Monitoring Tool | Nagios Core |
| Nagios Core Version | 4.5.13 |
| Nagios Plugins Version | 2.4.9 |
| Web Server | Apache httpd |
| Server IP | 192.168.209.135 |
| Web Interface | http://192.168.209.135/nagios |

## What I Did

- Installed required packages for Nagios Core.
- Created Nagios user and command group.
- Downloaded and extracted Nagios Core source code.
- Compiled and installed Nagios Core from source.
- Installed Nagios web configuration for Apache.
- Downloaded and installed Nagios Plugins.
- Created the Nagios web login user nagiosadmin.
- Opened HTTP service in the firewall.
- Started and enabled httpd and nagios services.
- Added a custom monitored host configuration.
- Added a PING service check for the monitored host.
- Verified the Nagios configuration.
- Confirmed access to the Nagios web dashboard.

## Architecture

    Browser
       |
       v
    Apache httpd
       |
       v
    Nagios Web Interface
       |
       v
    Nagios Core Monitoring Engine
       |
       v
    Host and Service Checks

## Installed Components

| Component | Purpose |
|---|---|
| Nagios Core | Monitoring engine |
| Nagios Plugins | Provides check commands such as check_ping |
| Apache httpd | Hosts the Nagios web interface |
| PHP | Supports web interface functionality |
| firewalld | Allows HTTP access securely |

## Important Paths

| Path | Description |
|---|---|
| /usr/local/nagios | Main Nagios installation directory |
| /usr/local/nagios/etc/nagios.cfg | Main Nagios configuration file |
| /usr/local/nagios/etc/objects/hosts.cfg | Custom host and service configuration |
| /etc/httpd/conf.d/nagios.conf | Apache configuration for Nagios |
| /usr/local/nagios/libexec | Nagios plugins directory |

## Monitored Host Configuration

A custom host was added:

    Host name: CentosServer
    Alias: Nagios Lab CentOS Server
    Address: 192.168.209.135

## Monitored Service

A PING check was configured for the host:

    Service description: PING
    Check command: check_ping!100.0,20%!500.0,60%

## Firewall Configuration

Instead of disabling the firewall, HTTP traffic was allowed using firewalld:

    firewall-cmd --permanent --add-service=http
    firewall-cmd --reload

## Validation

The Nagios configuration was verified using:

    /usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg

The Nagios and Apache services were checked using:

    systemctl status nagios
    systemctl status httpd

## Result

Nagios Core was installed successfully and accessed from the browser using:

    http://192.168.209.135/nagios

The dashboard showed the Nagios daemon running successfully and displayed monitored host and service status.

## Files Included

| Path | Description |
|---|---|
| configs/hosts.cfg | Custom host and service monitoring configuration |
| configs/nagios.cfg | Main Nagios configuration file copy |
| outputs/nagios-config-check.txt | Nagios configuration validation output |
| outputs/nagios-status.txt | Nagios service status |
| outputs/httpd-status.txt | Apache service status |
| outputs/firewall-services.txt | Enabled firewall services |
| outputs/nagios-version.txt | Installed Nagios version |
| screenshots/ | Nagios web interface screenshots |
