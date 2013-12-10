$package = 'sqlio'
$build = '1'
$guid='{DD971DE9-FAF0-4A15-9BE4-5D766B05D11E}'

try {
  
  if (Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$guid") {
    
    Uninstall-ChocolateyPackage $package 'msi' "$guid /quiet"
    Write-ChocolateySuccess $package

  } else {
    Write-ChocolateyFailure $package "$package is not installed!"
  }

} catch {

  Write-ChocolateyFailure $package "$($_.Exception.Message)"
  throw 

}

