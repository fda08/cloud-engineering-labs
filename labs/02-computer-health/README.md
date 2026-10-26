# Computer Health Report

## Goal
Use PowerShell to collect computer information and export a CSV report.

## What the script collects
- Computer name
- Windows edition and last boot time
- Manufacturer and model
- Installed RAM in GB
- C: drive capacity and free space in GB

## Run the script
Open PowerShell in this folder and run:

```powershell
.\Get-ComputerHealth.ps1
```

## Output
The script displays the results and saves ComputerHealth.csv beside the script.
Each run replaces the previous CSV report.

## Skills practiced
- Querying Windows with Get-CimInstance
- Storing results in variables
- Building a report with PSCustomObject
- Converting bytes to gigabytes
- Exporting data with Export-Csv
- Building file paths with PSScriptRoot and Join-Path