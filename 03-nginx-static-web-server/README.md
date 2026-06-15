# Lab 03 - Nginx Static Web Server on CentOS

## Objective

Configure Nginx as a static web server on CentOS to serve a custom HTML page through HTTP.

## Lab Environment

| Item | Details |
|---|---|
| Operating System | CentOS Stream 9 |
| Web Server | Nginx |
| Server IP | 192.168.209.135 |
| Protocol | HTTP |
| Port | 80 |

## What I Did

- Installed Nginx using dnf.
- Enabled and started the Nginx service.
- Allowed HTTP traffic through the firewall.
- Created a custom website directory under /var/www/nginx-static-lab/html.
- Created a custom index.html page.
- Configured Nginx to serve the custom HTML page.
- Tested the Nginx configuration using nginx -t.
- Reloaded Nginx to apply the new configuration.
- Verified the website using curl and a web browser.

## Website Directory

    /var/www/nginx-static-lab/html

## Nginx Configuration File

    /etc/nginx/conf.d/nginx-static-lab.conf

## Configuration Used

    server {
        listen 80;
        server_name 192.168.209.135;

        root /var/www/nginx-static-lab/html;
        index index.html;

        location / {
            try_files $uri $uri/ =404;
        }
    }

## Testing Commands

    nginx -t
    systemctl status nginx
    curl http://192.168.209.135
    firewall-cmd --list-services

## Result

The custom HTML page was successfully served by Nginx through HTTP.

Expected page content:

    Hello from Nginx Static Web Server
    This page is served directly by Nginx on CentOS.

## Troubleshooting Notes

### Nginx is not running

Check the service status:

    systemctl status nginx

### Configuration error

Test the Nginx configuration:

    nginx -t

Common causes include missing semicolons, wrong paths, or missing closing braces.

### Website does not open from browser

Check the firewall:

    firewall-cmd --list-services

Make sure http is listed.

### 403 Forbidden

Possible causes:

- Wrong file permissions
- SELinux context issue
- Nginx cannot read the website directory

Useful checks:

    ls -l /var/www/nginx-static-lab/html
    sestatus
    ls -Z /var/www/nginx-static-lab/html

### 404 Not Found

Possible causes:

- Wrong root path in the Nginx configuration
- Missing index.html file

Useful checks:

    cat /etc/nginx/conf.d/nginx-static-lab.conf
    ls /var/www/nginx-static-lab/html

## Files Included

| Path | Description |
|---|---|
| nginx-config/nginx-static-lab.conf | Nginx server block configuration |
| html/index.html | Custom HTML page |
| outputs/nginx-status.txt | Nginx service status |
| outputs/nginx-config-test.txt | Nginx configuration test result |
| outputs/curl-test.txt | Website test using curl |
| outputs/firewall-services.txt | Firewall allowed services |
