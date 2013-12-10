$package = 'sqlio'
$build = '1'
$guid='{DD971DE9-FAF0-4A15-9BE4-5D766B05D11E}'

try {

  if (Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$guid") {
    Write-ChocolateyFailure $package "$package is already installed!"
  }
  else {
    $params = @{
      PackageName = $package;
      FileType = 'msi';
      SilentArgs = '/QUIET';
      Url = "http://download.microsoft.com/download/f/3/f/f3f92f8b-b24e-4c2e-9e86-d66df1f6f83b/SQLIO.msi";
    }

    Install-ChocolateyPackage @params
    Write-ChocolateySuccess $package
  }

} catch {

  Write-ChocolateyFailure $package "$($_.Exception.Message)"
  throw 

}

