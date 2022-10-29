$user = Get-ADUser e1zq74  -Server DRIO01B1.linde.lds.grp -Properties * 

$user 
$user | Out-File -FilePath \\brariofs01\transfer\elias\usuario.txt

