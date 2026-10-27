# Collect information about this Windows computer
$computer = Get-CimInstance -ClassName Win32_ComputerSystem
$os = Get-CimInstance -ClassName Win32_OperatingSystem

# Build a readable summary
[PSCustomObject]@{
    Manufacturer    = $computer.Manufacturer
    Model           = $computer.Model
    RAM_GB          = [math]::Round($computer.TotalPhysicalMemory / 1GB, 2)
    OperatingSystem = $os.Caption
    WindowsVersion  = $os.Version
    LastBootTime    = $os.LastBootUpTime
    PowerShell      = $PSVersionTable.PSVersion.ToString()
}