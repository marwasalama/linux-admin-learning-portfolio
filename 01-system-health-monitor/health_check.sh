#!/bin/bash

REPORT_FILE="system_health_report.txt"

echo "====================================" > $REPORT_FILE
echo " Linux System Health Monitoring Report" >> $REPORT_FILE
echo "====================================" >> $REPORT_FILE
echo "" >> $REPORT_FILE

echo "Generated on:" >> $REPORT_FILE
date >> $REPORT_FILE
echo "" >> $REPORT_FILE

echo "===== System Information =====" >> $REPORT_FILE
hostnamectl >> $REPORT_FILE
echo "" >> $REPORT_FILE

echo "===== Kernel Version =====" >> $REPORT_FILE
uname -r >> $REPORT_FILE
echo "" >> $REPORT_FILE

echo "===== System Uptime =====" >> $REPORT_FILE
uptime >> $REPORT_FILE
echo "" >> $REPORT_FILE

echo "===== Logged-in Users =====" >> $REPORT_FILE
who >> $REPORT_FILE
echo "" >> $REPORT_FILE

echo "===== Memory Usage =====" >> $REPORT_FILE
free -h >> $REPORT_FILE
echo "" >> $REPORT_FILE

echo "===== Disk Usage =====" >> $REPORT_FILE
df -h >> $REPORT_FILE
echo "" >> $REPORT_FILE

echo "===== /var/log Directory Size =====" >> $REPORT_FILE
sudo du -sh /var/log 2>/dev/null >> $REPORT_FILE
echo "" >> $REPORT_FILE

echo "===== Top 10 CPU Consuming Processes =====" >> $REPORT_FILE
ps aux --sort=-%cpu | head -n 11 >> $REPORT_FILE
echo "" >> $REPORT_FILE

echo "===== Top 10 Memory Consuming Processes =====" >> $REPORT_FILE
ps aux --sort=-%mem | head -n 11 >> $REPORT_FILE
echo "" >> $REPORT_FILE

echo "===== Network Interfaces =====" >> $REPORT_FILE
ip addr >> $REPORT_FILE
echo "" >> $REPORT_FILE

echo "===== Listening Ports =====" >> $REPORT_FILE
ss -tuln >> $REPORT_FILE
echo "" >> $REPORT_FILE

echo "===== Recent System Errors =====" >> $REPORT_FILE
journalctl -p err -n 20 --no-pager >> $REPORT_FILE
echo "" >> $REPORT_FILE

echo "Report generated successfully: $REPORT_FILE"
