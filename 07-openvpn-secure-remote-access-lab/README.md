# Lab 07 - OpenVPN Secure Remote Access Lab

## Objective

This lab demonstrates how to deploy and validate an OpenVPN remote access server on CentOS Stream 9 using Easy-RSA certificates, firewall rules, IP forwarding, and a client VPN profile.

The goal is to understand how VPN clients securely connect to a Linux server using certificates and encrypted tunnels.

---

## Lab Environment

| Component | Details |
|---|---|
| Server OS | CentOS Stream 9 |
| Server Hostname | masterdns.lab.local |
| Server NAT Interface | ens160 - 192.168.209.135/24 |
| Server Lab Interface | ens224 - 192.168.56.10/24 |
| OpenVPN Port | UDP 1194 |
| VPN Network | 10.8.0.0/24 |
| OpenVPN Server VPN IP | 10.8.0.1 |
| Test Client Profile | client1 |
| Tools Used | OpenVPN, Easy-RSA, firewalld, sysctl |

---

## Lab Topology

VPN Client Profile: client1
        |
        | UDP 1194
        |
OpenVPN Server: 192.168.56.10
        |
        | VPN Tunnel
        |
VPN Network: 10.8.0.0/24

---

## Main Steps

1. Created the lab folder structure.
2. Verified server and client network connectivity.
3. Installed OpenVPN and Easy-RSA.
4. Initialized Easy-RSA PKI.
5. Created a Certificate Authority.
6. Generated and signed the server certificate.
7. Generated and signed the client certificate.
8. Generated Diffie-Hellman parameters and TLS auth key.
9. Copied server certificates and keys to /etc/openvpn/server.
10. Created the OpenVPN server configuration file.
11. Enabled IPv4 forwarding.
12. Configured firewalld for UDP 1194 and masquerading.
13. Started and verified the OpenVPN server.
14. Created a client VPN profile.
15. Tested VPN connection locally.
16. Verified VPN tunnel and status logs.

---

## OpenVPN Server Configuration

The OpenVPN server was configured using:

/etc/openvpn/server/server.conf

Important configuration lines:

port 1194
proto udp
dev tun
server 10.8.0.0 255.255.255.0
tls-auth ta.key 0
status /var/log/openvpn-status.log

---

## VPN Verification

The OpenVPN service started successfully and showed:

Initialization Sequence Completed

The server created a VPN tunnel interface:

tun0  10.8.0.1

A test VPN client connection was created and another tunnel interface appeared:

tun1  10.8.0.6

The VPN client successfully reached the OpenVPN server VPN IP:

ping 10.8.0.1
4 packets transmitted, 4 received, 0% packet loss

The OpenVPN status log confirmed that client1 connected successfully:

CLIENT_LIST,client1,...,10.8.0.6,...,AES-256-GCM

---

## Security Note

The real client .ovpn file contains private key material and must not be uploaded to GitHub.

For this reason, the repository includes a safe template file:

configs/client1-template.ovpn

The real file was kept outside the repository at:

/home/marwa/client1.ovpn

---

## Files Included

configs/
  server.conf
  client1-template.ovpn

outputs/
  openvpn-packages.txt
  easy-rsa-pki-files.txt
  ca-files.txt
  server-certificate-files.txt
  client-certificate-files.txt
  openvpn-security-keys.txt
  openvpn-server-files.txt
  openvpn-server-config.txt
  ip-forwarding-config.txt
  ip-forwarding-status.txt
  firewall-openvpn-port.txt
  firewall-openvpn-config.txt
  openvpn-server-status.txt
  openvpn-tun-interface.txt
  openvpn-listening-port.txt
  client-openvpn-test-log.txt
  vpn-client-test-interface.txt
  client-vpn-connection-success.txt
  vpn-server-ping-test.txt
  openvpn-status-log.txt

---

## Skills Practiced

- OpenVPN server deployment
- Easy-RSA certificate management
- CA, server, and client certificate generation
- Linux firewall configuration using firewalld
- IP forwarding and NAT masquerading
- VPN tunnel verification
- Secure handling of private keys
- Linux service management using systemd
- GitHub portfolio documentation
