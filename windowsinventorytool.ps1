$paths = @(
    "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall",
    "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall"
)

Get-ChildItem $paths |
Get-ItemProperty |
Where-Object { $_.DisplayName } |
Select-Object DisplayName, DisplayVersion, Publisher |
Sort-Object DisplayName |
Export-Csv -Path ".\InstalledSoftwares.csv" -NoTypeInformation
