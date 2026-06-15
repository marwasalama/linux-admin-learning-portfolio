# Lab 04 - Nginx Reverse Proxy Simulation on a Single CentOS VM

## Objective

Configure Nginx as a reverse proxy on CentOS to forward client requests from port 80 to a backend website running on port 8080 on the same VM.

## Lab Environment

| Item | Details |
|---|---|
| Operating System | CentOS Stream 9 |
| Web Server | Nginx |
| Server IP | 192.168.209.135 |
| Reverse Proxy Port | 80 |
| Backend Port | 8080 |
| Backend Address | 127.0.0.1:8080 |

## Lab Architecture

    Client Browser / curl
            |
            v
    http://192.168.209.135:80
            |
            v
    Nginx Reverse Proxy
            |
            v
    http://127.0.0.1:8080
            |
            v
    Backend Website

## What I Did

- Created a backend website directory under /var/www/nginx-backend-lab/html.
- Created a custom backend index.html page.
- Configured an Nginx server block to serve the backend website on port 8080.
- Configured another Nginx server block as a reverse proxy on port 80.
- Forwarded requests from port 80 to the backend service on 127.0.0.1:8080.
- Tested the backend directly using curl.
- Tested the reverse proxy using curl and a web browser.
- Enabled the SELinux boolean httpd_can_network_connect to allow Nginx to connect to the backend service.
- Verified Nginx listening ports using ss.

## Backend Website Directory

    /var/www/nginx-backend-lab/html

## Backend Nginx Configuration

File:

    /etc/nginx/conf.d/backend-8080.conf

Configuration:

    server {
        listen 8080;
        server_name localhost;

        root /var/www/nginx-backend-lab/html;
        index index.html;

        location / {
            try_files $uri $uri/ =404;
        }
    }

## Reverse Proxy Configuration

File:

    /etc/nginx/conf.d/reverse-proxy.conf

Configuration:

    server {
        listen 80;
        server_name 192.168.209.135;

        location / {
            proxy_pass http://127.0.0.1:8080;
        }
    }

## SELinux Configuration

The reverse proxy initially returned 502 Bad Gateway because SELinux prevented Nginx from connecting to the backend network service.

The following command was used:

    sudo setsebool -P httpd_can_network_connect 1

This allows Nginx/httpd services to make network connections to backend services.

## Testing Commands

    nginx -t
    curl http://127.0.0.1:8080
    curl http://192.168.209.135
    ss -tulnp | grep nginx
    getsebool httpd_can_network_connect

## Result

The reverse proxy successfully forwarded client requests from port 80 to the backend website running on port 8080.

Expected backend content through reverse proxy:

    Hello from Backend Server
    This page is served from the backend website on port 8080.

## Files Included

| Path | Description |
|---|---|
| backend-html/index.html | Backend HTML page |
| nginx-config/backend-8080.conf | Backend server block configuration |
| nginx-config/reverse-proxy.conf | Reverse proxy server block configuration |
| outputs/nginx-config-test.txt | Nginx configuration test result |
| outputs/backend-curl-test.txt | Direct backend curl test |
| outputs/reverse-proxy-curl-test.txt | Reverse proxy curl test |
| outputs/nginx-listening-ports.txt | Nginx listening ports |
| outputs/selinux-boolean.txt | SELinux boolean status |
