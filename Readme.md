# System Monitoring Script

## Overview

This Bash script provides real-time insights into various system resources by presenting them in a dashboard format. The script can be run to monitor different aspects of the system such as CPU usage, memory, network statistics, disk usage, and more. It supports individual sections of the dashboard through command-line switches.

## Features

- **Top 10 Most Used Applications**: Displays the top 10 applications consuming the most CPU and memory.
- **Network Monitoring**: Shows the number of concurrent connections, packet drops, and network interface statistics.
- **Disk Usage**: Displays disk space usage by mounted partitions and highlights partitions with high usage.
- **System Load**: Shows the current system load averages.
- **Memory Usage**: Provides details about total, used, and free memory, as well as swap memory.
- **Process Monitoring**: Lists active processes and the top 5 processes by CPU and memory usage.
- **Service Monitoring**: Checks the status of essential services like `sshd`, `nginx`, `apache2`, etc.

## Usage

### Running the Script

To run the script and see the full dashboard, execute the following command:

```bash
bash monitor.sh
```
## Calling Individual Sections
You can call specific parts of the dashboard by using command-line switches. Here are the available options:

Top 10 Most Used Applications: 
```bash 
    bash monitor.sh apps
```
#### Network Monitoring
``` bash 
    bash monitor.sh network
```
#### Disk Usage:

```bash
bash monitor.sh disk
```
#### System Load:
```bash
bash monitor.sh load
```
#### Memory Usage:
```bash
bash monitor.sh memory
```
#### Process Monitoring:

```bash
bash monitor.sh process
```
#### Service Monitoring:

```bash
bash monitor.sh services
```
## Script Details

### Top 10 Most Used Applications
#### Displays the top 10 applications consuming the most CPU and memory.

#### Network Monitoring
##### Number of Concurrent Connections:
    Counts the number of established network connections.
##### Packet Drops:
Shows packet receive errors.
##### MII in and out:
Lists the network statistics for each interface.
#### Disk Usage

Shows the disk space usage by mounted partitions and highlights partitions using more than 80% of the space.

#### System Load
Displays the current load average and system load details.

#### Memory Usage
Provides a breakdown of CPU usage and shows total, used, and free memory, as well as swap memory details.

#### Process Monitoring
Number of Active Processes: Counts the number of active processes.\
Top 5 Processes: Lists the top 5 processes by CPU and memory usage.
#### Service Monitoring
Checks if essential services like sshd, nginx, and apache2 are running.

### Dependencies
```Bash
`ps` command
`df` command
`netstat` command
`systemctl` command
```
### Troubleshooting 
If you encounter any issues with the script:


Ensure that all required commands (ps, df, netstat, systemctl) are installed and available on your system.
Verify that the script has execute permissions. You can set execute permissions using:
```bash
chmod +x monitor.sh
```
## Participate and Contribute
Contributions are welcome! Please submit a pull request with your changes or improvements. Ensure that your changes are well-tested and documented.




Check for any syntax errors in the script or ensure the correct service names are used.
### License
This script is provided under the MIT License. See LICENSE for details.