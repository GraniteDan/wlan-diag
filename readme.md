#wlan-diag.cmd
This is a basic windows command shell script.  It runs a number of built-in commands to collect various network data and build a Wifi diagnostic package on a Windows 10 based system.  This Script will colled

1. Network Adapter Mac Addresses
2. IPConfig Data
3. DNS Resolver Cache
4. ARP Cache
5. Local Routing Table
6. Application Event Log
7. System Event Log
8. Security Event Log
9. netsh WLAN-Report.html

## Command Usage:
Simply Save the CMD file to your system.  Right click and run-as administrator
Once the data has been collected a zip file diagnostic package is created at the root of C:
This Zip Package will be open when the script is completed, or users can be instructed to submit to technical support via a ticketing system.