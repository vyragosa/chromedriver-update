$ProgressPreference = 'SilentlyContinue'
$jsonUrl = "https://googlechromelabs.github.io/chrome-for-testing/last-known-good-versions-with-downloads.json"


# !!! Может отличаться от системы к системе. Если отличается, просто пропишите путь по папки !!!
$targetDirectory = Join-Path -Path $env:LOCALAPPDATA -ChildPath "Programs\RITA_worker\bin"

$platform = "win64"

$jsonContent = Invoke-RestMethod -Uri $jsonUrl
$latestChromedriverUrl = $jsonContent.channels.Stable.downloads.chromedriver | Where-Object { $_.platform -eq $platform } | Select-Object -ExpandProperty url
Write-Host "Downloading from: $latestChromedriverUrl"

$zipSavePath = Join-Path -Path $targetDirectory -ChildPath "chromedriver-$platform.zip"
Invoke-WebRequest -Uri $latestChromedriverUrl -OutFile $zipSavePath
Write-Host "Chromedriver zip downloaded to: $zipSavePath"

$extractedDirectory = Join-Path -Path $targetDirectory -ChildPath "chromedriver-$platform"
Expand-Archive -Path $zipSavePath -DestinationPath $targetDirectory -Force
$chromedriverTargetPath = Join-Path -Path $targetDirectory -ChildPath "chromedriver_win32.exe"
Move-Item -Path (Join-Path -Path $targetDirectory -ChildPath "chromedriver-$platform\chromedriver.exe") -Destination $chromedriverTargetPath -Force -Confirm:$false
Write-Host "chromedriver_win32.exe replaced with new chromedriver in: $chromedriverTargetPath"

Remove-Item -Path $zipSavePath -Force
Remove-Item -Path $extractedDirectory -Recurse -Force

$chromedriverVersion = $jsonContent.channels.Stable.version
Write-Host "Chromedriver version: $chromedriverVersion"
Write-Host "Platform: $platform"
