# Collect information about Windows, hardware, and storage.
$os = Get-CimInstance -ClassName Win32_OperatingSystem
$computer = Get-CimInstance -ClassName Win32_ComputerSystem
$disk = Get-CimInstance -ClassName Win32_LogicalDisk -Filter "DeviceID='C:'"

# Combine the information into one report.
$report = [PSCustomObject]@{
    ComputerName = $env:COMPUTERNAME
    Windows      = $os.Caption
    LastBoot     = $os.LastBootUpTime
    Manufacturer = $computer.Manufacturer
    Model        = $computer.Model
    MemoryGB     = [math]::Round($computer.TotalPhysicalMemory / 1GB, 1)
    DiskSizeGB   = [math]::Round($disk.Size / 1GB, 1)
    DiskFreeGB   = [math]::Round($disk.FreeSpace / 1GB, 1)
}

# Display the report.
$report | Format-List

# Save the report beside this script.
$reportPath = Join-Path -Path $PSScriptRoot -ChildPath "ComputerHealth.csv"

$report | Export-Csv -Path $reportPath -NoTypeInformation

Write-Host "Report saved to: $reportPath"