#!/bin/bash 
echo "======================================"
echo "         SERVER PERFORMANCE STATS     "
echo "======================================"
# --- OS Version ---
echo -e "\n OS Version:"
if [ -f /etc/os-release ]; then 
   grep '^PRETTY_NAME' /etc/os-release | cut -d= -f2 | tr -d '"'
else
  uname -a
fi
echo -e "\n Uptime:"
uptime -p
# --- Load Average ---
echo -e "\n Load average (1, 5, 15 min):"
uptime | awk -F'load average:' '{print $2}' | sed 's/^ //'

# --- Logged In Users ---
echo -e "\n Currently logged in users:"
who
echo -e "\n Total CPU usage:"
cpu_idle=$(top -bn1 | grep "Cpu(s)" | awk '{print $8}' | cut -d'.' -f1)
cpu_used=$((100 - cpu_idle))
echo "CPU Used: ${cpu_used}%"
# --- Memory Usage ---
echo -e "\n Total memory usage:"
free -h
mem_used_percent=$(free | awk '/Mem:/ {printf "%.2f", $3/$2 * 100}')
echo "Memory Used: ${mem_used_percent}%"
# --- Disk Usage ---
echo -e "\n🗄️ Total disk usage:"
df -h --total | grep 'total'
disk_used_percent=$(df --total | grep 'total' | awk '{print $5}')
echo "Disk Used: ${disk_used_percent}"
# --- Top 5 Processes by CPU Usage ---
echo -e "\n🔥 Top 5 processes by CPU usage:"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6

# --- Top 5 Processes by Memory Usage ---
echo -e "\n💡 Top 5 processes by memory usage:"
ps -eo pid,comm,%mem --sort=-%mem | head -n 6

echo -e "\n======================================"
echo "       End of server stats report     "
echo "======================================"