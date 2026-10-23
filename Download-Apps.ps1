$ErrorActionPreference = 'Stop'
try {
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    $manifest = Get-Content -Raw -LiteralPath (Join-Path $PSScriptRoot 'releases.json') | ConvertFrom-Json
    $downloadDir = Join-Path $PSScriptRoot 'downloads'
    New-Item -ItemType Directory -Force -Path $downloadDir | Out-Null
    foreach ($app in $manifest) {
        $asset = $app.assets[0]
        $archive = Join-Path $downloadDir $asset.name
        Write-Host "Downloading $($app.app) $($app.version)..."
        $valid = (Test-Path -LiteralPath $archive) -and (('sha256:' + (Get-FileHash -LiteralPath $archive -Algorithm SHA256).Hash.ToLower()) -eq $asset.digest)
        if (-not $valid) {
            Invoke-WebRequest -UseBasicParsing -Uri $asset.browser_download_url -OutFile $archive
        }
        if (('sha256:' + (Get-FileHash -LiteralPath $archive -Algorithm SHA256).Hash.ToLower()) -ne $asset.digest) {
            throw "Download verification failed: $($app.app). Please run Download-Apps.cmd again."
        }
        $destination = Join-Path $PSScriptRoot ('installed\' + $app.app)
        $folder = $asset.name -replace '\.zip$', ''
        if (-not (Test-Path -LiteralPath (Join-Path $destination "$folder\$($app.app).exe"))) {
            if (-not (Test-Path -LiteralPath $destination)) { New-Item -ItemType Directory -Path $destination -Force | Out-Null }
            [IO.Compression.ZipFile]::ExtractToDirectory($archive, $destination)
        }
        Write-Host "Ready: $($app.app)"
    }
    Write-Host 'Done! Open Launchers and double-click the app you want.'
} catch {
    Write-Host ('Error: ' + $_.Exception.Message) -ForegroundColor Red
    exit 1
}
