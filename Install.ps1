param(
    [string]$InstallDirectory = (Join-Path $env:LOCALAPPDATA 'AdobeClone'),
    [string]$StartMenuDirectory = (Join-Path ([Environment]::GetFolderPath('Programs')) 'AdobeClone'),
    [string]$DesktopDirectory = [Environment]::GetFolderPath('Desktop')
)
$ErrorActionPreference = 'Stop'
try {
    $apps = @(
        @{ Id='photocraft'; Name='PhotoCraft' },
        @{ Id='vectorcraft'; Name='VectorCraft' },
        @{ Id='pdfcraft'; Name='PdfCraft' },
        @{ Id='lightcraft'; Name='LightCraft' },
        @{ Id='filmcraft'; Name='FilmCraft' },
        @{ Id='effectcraft'; Name='EffectCraft' },
        @{ Id='designcraft'; Name='DesignCraft' }
    )
    $manifest = Get-Content -Raw -LiteralPath (Join-Path $PSScriptRoot 'releases.json') | ConvertFrom-Json
    $missing = $false
    foreach ($app in $manifest) {
        $folder = $app.assets[0].name -replace '\.zip$', ''
        if (-not (Test-Path -LiteralPath (Join-Path $PSScriptRoot "installed\$($app.app)\$folder\$($app.app).exe"))) { $missing = $true }
    }
    if ($missing) {
        & (Join-Path $PSScriptRoot 'Download-Apps.ps1')
        if ($LASTEXITCODE -and $LASTEXITCODE -ne 0) { throw 'Download failed.' }
    }
    New-Item -ItemType Directory -Force -Path $InstallDirectory,$StartMenuDirectory,$DesktopDirectory | Out-Null
    $shell = New-Object -ComObject WScript.Shell
    foreach ($app in $apps) {
        $release = $manifest | Where-Object app -EQ $app.Id | Select-Object -First 1
        $folder = $release.assets[0].name -replace '\.zip$', ''
        $source = Join-Path $PSScriptRoot "installed\$($app.Id)\$folder"
        $destination = Join-Path $InstallDirectory "installed\$($app.Id)\$folder"
        New-Item -ItemType Directory -Force -Path $destination | Out-Null
        # Copy only release files; retain any data belonging to an existing installation.
        foreach ($file in (Get-ChildItem -LiteralPath $source -Force)) {
            Copy-Item -LiteralPath $file.FullName -Destination $destination -Recurse -Force
        }
        $exe = Join-Path $destination ($app.Id + '.exe')
        if (-not (Test-Path -LiteralPath $exe)) { throw "Missing application: $($app.Name)" }
        foreach ($shortcutDirectory in @($StartMenuDirectory,$DesktopDirectory)) {
            $shortcut = $shell.CreateShortcut((Join-Path $shortcutDirectory ($app.Name + '.lnk')))
            $shortcut.TargetPath = $exe
            $shortcut.WorkingDirectory = $destination
            $shortcut.IconLocation = "$exe,0"
            $shortcut.Description = $app.Name
            $shortcut.Save()
        }
        Write-Host "Installed: $($app.Name)"
    }
    Write-Host ''
    Write-Host 'Done! Press Windows and type PhotoCraft, FilmCraft, etc.' -ForegroundColor Green
    Write-Host 'Desktop shortcuts are also ready. Windows Search may take a moment to update.'
    Write-Host "Apps are stored in: $InstallDirectory"
    Write-Host 'You can now delete the downloaded ZIP and extracted folder.'
} catch {
    Write-Host ('Error: ' + $_.Exception.Message) -ForegroundColor Red
    exit 1
}
