# Ścieżka źródłowa – folder z plikami ze skanera
$source = "D:\1\tes"

# Ścieżka docelowa – folder użytkownika
$destination = "D:\1\test"

# Główna pętla monitorująca
while ($true) {
    Get-ChildItem $source -File | ForEach-Object {
        try {
            $target = Join-Path $destination $_.Name
            Move-Item $_.FullName $target -Force
        } catch {
            Write-Output "Błąd przy przenoszeniu pliku: $_.Name"
        }
    }
    Start-Sleep -Seconds 5
}