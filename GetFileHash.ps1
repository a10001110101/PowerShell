Clear-Host
$filePathInput = Read-Host "Please enter in a file name"
function getAlgoType {
  do {
    Write-Host "`nPlease choose an algorithm:"
    Write-Host "'1' SHA1"
    Write-Host "'2' SHA256"
    Write-Host "'3' SHA384"
    Write-Host "'4' SHA512"
    Write-Host "'5' MD5"
    $choice = Read-Host "`nEnter in choice"
  } until (($choice -eq '1') -or ($choice -eq '2') -or ($choice -eq '3') -or ($choice -eq '4') -or ($choice -eq '5') )
  switch ($choice) {
    '1' {"SHA1"}
    '2' {"SHA256"}
    '3' {"SHA384"}
    '4' {"SHA512"}
    '5' {"MD5"}
  }
}
$fileAlgoType = getAlgoType
$fileDrive = "D:\Downloads\"
Get-FileHash $fileDrive$filePathInput -Algorithm $fileAlgoType | Format-List -Property Algorithm, Hash | Out-File "D:\Downloads\SHA.txt"
Invoke-Item "D:\Downloads\SHA.txt"
Clear-Host