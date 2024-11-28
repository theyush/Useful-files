# Define the source folder containing the ZIP files
$sourceFolder = "F:\OOOOO\man"

# Define the destination folder where the files will be extracted
$destinationFolder = "F:\OOOOO\man\00"

# Create the destination folder if it doesn't exist
if (!(Test-Path $destinationFolder)) {
    New-Item -ItemType Directory -Path $destinationFolder
}

# Get all ZIP files in the source folder
$zipFiles = Get-ChildItem -Path $sourceFolder -Filter "*.zip"

# Loop through each ZIP file and extract it to the destination folder
foreach ($zipFile in $zipFiles) {
    $zipPath = $zipFile.FullName
    $extractPath = Join-Path $destinationFolder -ChildPath $zipFile.BaseName
    
    # Create a folder for each zip file if you want to extract into individual folders
    if (!(Test-Path $extractPath)) {
        New-Item -ItemType Directory -Path $extractPath
    }
    
    # Extract the ZIP file
    Expand-Archive -Path $zipPath -DestinationPath $extractPath -Force
}

Write-Output "Extraction completed!"
