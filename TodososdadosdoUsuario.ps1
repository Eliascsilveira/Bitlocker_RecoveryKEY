$user = Get-ADUser h1th25  -Server DRIO01B1.linde.lds.grp -Properties * 

$user 
$user | Out-File -FilePath \\brariofs01\transfer\elias\usuario.txt

