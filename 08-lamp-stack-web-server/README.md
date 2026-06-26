# LAMP Stack Web Server Lab

## Objective

This lab demonstrates the installation and configuration of a basic LAMP stack on CentOS Stream 9.

LAMP stands for:

- Linux
- Apache
- MariaDB
- PHP

The lab validates that Apache can serve web pages, PHP can run server-side code, and PHP can connect to a MariaDB database.

---

## Environment

- Operating System: CentOS Stream 9
- Web Server: Apache HTTP Server
- Database Server: MariaDB
- Server-Side Language: PHP
- Hostname: masterdns.lab.local

---

## What I Configured

- Installed Apache, MariaDB, PHP, and PHP MySQL support.
- Enabled and started the `httpd` service.
- Enabled and started the `mariadb` service.
- Allowed HTTP traffic through firewalld.
- Created a basic Apache test page.
- Created a PHP test page using `phpinfo()`.
- Created a MariaDB database named `lamp_lab`.
- Created a MariaDB user named `lampuser`.
- Created a `students` table.
- Inserted test records into the database.
- Created a PHP page that connects to MariaDB and displays database records.

---

## Database Configuration

Database name:

```text
lamp_lab
```

Database user:

```text
lampuser
```

Table name:

```text
students
```

Sample records:

| ID | Name | Course |
|---|---|---|
| 1 | Hady | Linux Administration |
| 2 | Test User | LAMP Stack |

---

## Files Included

```text
08-lamp-stack-web-server/
├── configs
│   ├── db-test.php
│   ├── httpd.conf
│   ├── index.html
│   └── info.php
├── outputs
│   ├── apache-curl-test.txt
│   ├── database-query-test.txt
│   ├── firewall-config.txt
│   ├── httpd-status.txt
│   ├── installed-packages.txt
│   ├── mariadb-status.txt
│   ├── php-database-test.txt
│   └── php-test.txt
└── screenshots
```

---

## Validation Commands

Apache test:

```bash
curl http://localhost
```

PHP test:

```bash
curl -s http://localhost/info.php | head
```

MariaDB query test:

```bash
mysql -u lampuser -p -e "USE lamp_lab; SELECT * FROM students;"
```

PHP database connection test:

```bash
curl http://localhost/db-test.php
```

---

## Output Evidence

The following output files were collected:

| Output File | Purpose |
|---|---|
| `installed-packages.txt` | Confirms installed Apache, MariaDB, and PHP packages |
| `httpd-status.txt` | Confirms Apache service status |
| `mariadb-status.txt` | Confirms MariaDB service status |
| `firewall-config.txt` | Shows firewalld HTTP configuration |
| `apache-curl-test.txt` | Confirms Apache can serve web content |
| `php-test.txt` | Confirms PHP execution |
| `database-query-test.txt` | Confirms MariaDB database query |
| `php-database-test.txt` | Confirms PHP-to-MariaDB connection |

---

## Result

The LAMP stack was successfully installed and validated.

Apache served static web content, PHP executed correctly, MariaDB stored database records, and the PHP database test page connected to MariaDB and displayed table data successfully.
