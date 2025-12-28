function sln {
    param(
        [string]$Name
    )

    $root = (Get-Location).Path

    $pick = {
        param($items)

        if (-not $items -or $items.Count -eq 0) { return $null }
        if ($items.Count -eq 1) { return $items[0] }

        Write-Host "Multiple solutions found:" -ForegroundColor Yellow
        for ($i = 0; $i -lt $items.Count; $i++) {
            Write-Host ("[{0}] {1}" -f $i, $items[$i].FullName)
        }

        $choice = Read-Host "Select index"
        if ($choice -match '^\d+$' -and [int]$choice -ge 0 -and [int]$choice -lt $items.Count) {
            return $items[[int]$choice]
        }

        Write-Host "Invalid selection." -ForegroundColor Red
        return $null
    }

    $filter = if ([string]::IsNullOrWhiteSpace($Name)) { "*.sln" } else { "*$Name*.sln" }

    $solutions = Get-ChildItem -Path $root -Filter $filter -File -ErrorAction SilentlyContinue |
        Sort-Object FullName

    if (-not $solutions -or $solutions.Count -eq 0) {
        $common = @("src","code","solutions","solution","sln","build","dev","projects")
        foreach ($dir in $common) {
            $p = Join-Path $root $dir
            if (Test-Path $p) {
                $solutions = Get-ChildItem -Path $p -Filter $filter -File -Recurse -ErrorAction SilentlyContinue |
                    Sort-Object FullName
                if ($solutions -and $solutions.Count -gt 0) { break }
            }
        }
    }

    if (-not $solutions -or $solutions.Count -eq 0) {
        $solutions = Get-ChildItem -Path $root -Filter $filter -File -Recurse -ErrorAction SilentlyContinue |
            Sort-Object FullName
    }

    if (-not $solutions -or $solutions.Count -eq 0) {
        Write-Host "No .sln found under $root" -ForegroundColor Red
        return
    }

    $selected = & $pick $solutions
    if ($null -ne $selected) {
        Start-Process $selected.FullName
    }
}

Export-ModuleMember -Function sln
