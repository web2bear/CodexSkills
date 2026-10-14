#Requires -Version 5.1
[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$Inbox,

    [Parameter(Mandatory = $true)]
    [string]$CatalogName,

    [switch]$DryRun,
    [switch]$Force
)

$ErrorActionPreference = "Stop"
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$OutputEncoding = [System.Text.Encoding]::UTF8

function Write-Section {
    param([string]$Title)
    Write-Output $Title
}

if (-not (Test-Path -LiteralPath $Inbox)) {
    Write-Error "Inbox not found: $Inbox"
    exit 1
}

$catalogPath = Join-Path $Inbox $CatalogName
if (-not (Test-Path -LiteralPath $catalogPath)) {
    Write-Error "Catalog not found: $catalogPath"
    exit 1
}

$content = [System.IO.File]::ReadAllText($catalogPath)
$titleToNum = @{}
$duplicates = New-Object System.Collections.Generic.List[string]

foreach ($m in [regex]::Matches($content, '\[(\d+)\\\.\s+([^\r\n]+)')) {
    $num = $m.Groups[1].Value
    $title = $m.Groups[2].Value.Trim()
    if ($titleToNum.ContainsKey($title) -and $titleToNum[$title] -ne $num) {
        [void]$duplicates.Add("$title : $($titleToNum[$title]) -> $num")
    }
    $titleToNum[$title] = $num
}

$renamed = New-Object System.Collections.Generic.List[string]
$unmatched = New-Object System.Collections.Generic.List[string]
$skipped = New-Object System.Collections.Generic.List[string]
$conflicts = New-Object System.Collections.Generic.List[string]

Get-ChildItem -LiteralPath $Inbox -Filter *.md | ForEach-Object {
    if ($_.Name -eq $CatalogName) {
        return
    }

    $stem = $_.BaseName
    $lookup = $stem
    $alreadyNumbered = $stem -match '^\d+\.\s+'

    if ($alreadyNumbered) {
        if (-not $Force) {
            [void]$skipped.Add($stem)
            return
        }
        $lookup = ($stem -replace '^\d+\.\s+', '').Trim()
    }

    if (-not $titleToNum.ContainsKey($lookup)) {
        [void]$unmatched.Add($stem)
        return
    }

    $num = $titleToNum[$lookup]
    $newName = "$num. $lookup$($_.Extension)"
    if ($_.Name -eq $newName) {
        [void]$skipped.Add($stem)
        return
    }

    $dest = Join-Path $_.DirectoryName $newName
    if (Test-Path -LiteralPath $dest) {
        [void]$conflicts.Add("$($_.Name) -> $newName")
        return
    }

    if (-not $DryRun) {
        Rename-Item -LiteralPath $_.FullName -NewName $newName
    }
    [void]$renamed.Add("$($_.Name) -> $newName")
}

$drySuffix = ""
if ($DryRun) {
    $drySuffix = " [dry-run]"
}

Write-Section "=== DUPLICATES IN CATALOG ($($duplicates.Count)) ==="
$duplicates | ForEach-Object { Write-Output $_ }
Write-Section "=== RENAMED ($($renamed.Count))$drySuffix ==="
$renamed | ForEach-Object { Write-Output $_ }
Write-Section "=== ALREADY NUMBERED ($($skipped.Count)) ==="
$skipped | ForEach-Object { Write-Output $_ }
Write-Section "=== CONFLICTS ($($conflicts.Count)) ==="
$conflicts | ForEach-Object { Write-Output $_ }
Write-Section "=== UNMATCHED ($($unmatched.Count)) ==="
$unmatched | ForEach-Object { Write-Output $_ }
