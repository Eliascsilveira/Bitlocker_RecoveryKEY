$objComputer = Get-ADComputer WLGBROD0096I -Server DRIO01B1.linde.lds.grp
$Bitlocker_Object = Get-ADObject -Server DRIO01B1.linde.lds.grp -Filter {objectclass -eq 'msFVE-RecoveryInformation'}  -SearchBase $objComputer.DistinguishedName -Properties 'msFVE-RecoveryPassword' 
$Bitlocker_Object 

$LocalAdmin = $objComputer

$LocalAdmin.AdmPwd = $(Get-ADComputer $objComputer -Properties ms-MCS-AdmPwd | Select-Object -ExpandProperty ms-MCS-AdmPwd)

$comp =  Get-ADComputer $objComputer  -Property * | Format-Table ms-Mcs-AdmPwd, OperatingSystem, OperatingSystemVersion, DNSHostName, IPv4Address, primaryTelexNumber,  Description -Wrap -AutoSize

$Bitlocker_Object | Out-File -FilePath \\brariofs01\transfer\elias\BitLock.txt
$comp | Out-File -FilePath \\brariofs01\transfer\elias\senha.txt
