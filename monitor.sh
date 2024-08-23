#!/bin/bash


command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Check for required commands
for cmd in ps df netstat ifconfig uptime mpstat free swapon systemctl; do
    if ! command_exists "$cmd"; then
        echo "$cmd command not found, please install it."
        exit 1
    fi
done

# Check if the script is run as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script as root"
    exit 1
fi



function top_apps() {
    echo "Top 10 Applications by CPU and Memory Usage:"
    ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 11
    echo ""
}


function network_monitor() {
    echo "Network Monitoring:"
    echo "Number of Concurrent Connections:"
    netstat -an | grep ESTABLISHED | wc -l
    echo "Packet Drops:"
    netstat -s | grep "packet receive errors"
    echo "MII in and out:"
    ifconfig | grep 'RX packets\|TX packets'
    echo ""
}


function disk_usage() {
    echo "Disk Usage by Mounted Partitions:"
    df -h | awk '$5 > 80 {print $0 " - Warning: High usage!"}' || df -h
    echo ""
}

function system_load() {
    echo "System Load:"
    uptime
    echo "CPU Usage Breakdown:"
    mpstat | grep "all"
    echo ""
}


function memory_usage() {
    echo "Memory Usage:"
    free -h
    echo "Swap Memory Usage:"
    swapon --show
    echo ""
}


function process_monitor() {
    echo "Process Monitoring:"
    echo "Number of Active Processes:"
    ps aux --no-heading | wc -l
    echo "Top 5 Processes by CPU and Memory Usage:"
    ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 6
    echo ""
}


function service_monitor() {
    echo "Service Monitoring:"
    for service in sshd nginx apache2 iptables; do
        if systemctl is-active --quiet $service; then
            echo "$service is running"
        else
            echo "$service is not running"
        fi
    done
    echo ""
}


function full_dashboard() {
    clear
    top_apps
    network_monitor
    disk_usage
    system_load
    memory_usage
    process_monitor
    service_monitor
}

# Parsing command-line arguments
if [ $# -eq 0 ]; then
    # No arguments provided, show the full dashboard
    while true; do
        full_dashboard
        sleep 5
    done
else
    # Show specific parts of the dashboard based on arguments
    while true; do
        for arg in "$@"; do
            case $arg in
                top_apps)
                    top_apps
                    ;;
                network)
                    network_monitor
                    ;;
                disk)
                    disk_usage
                    ;;
                load)
                    system_load
                    ;;
                memory)
                    memory_usage
                    ;;
                process)
                    process_monitor 
                    ;;
                services)
                    service_monitor
                    ;;
                *)
                    echo "Invalid option: $arg"
                    ;;
            esac
        done
        sleep 5
    done
fi
