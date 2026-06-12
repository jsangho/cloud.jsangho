# Obsidian Graph colorGroups 복구
# Obsidian UI에서 Groups를 건드리면 graph.json이 덮어씌워질 수 있음.
$graphPath = Join-Path $PSScriptRoot ".." ".obsidian" "graph.json"
$backupPath = Join-Path $PSScriptRoot ".." ".obsidian" "graph.color-groups.backup.json"

if (-not (Test-Path $backupPath)) {
    Write-Error "백업 없음: $backupPath"
    exit 1
}

$graph = Get-Content $graphPath -Raw -Encoding UTF8 | ConvertFrom-Json
$colorGroups = Get-Content $backupPath -Raw -Encoding UTF8 | ConvertFrom-Json
$graph.colorGroups = $colorGroups
$graph.'collapse-color-groups' = $false
$graph | ConvertTo-Json -Depth 10 | Set-Content $graphPath -Encoding UTF8
Write-Host "colorGroups 복구 완료: $graphPath"
Write-Host "Obsidian Graph 뷰를 닫았다가 다시 여세요."
