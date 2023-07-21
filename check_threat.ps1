# Function to get the currently logged-in user
function Get-CurrentLoggedInUser {
    # Get the username of the currently logged-in user from Win32_ComputerSystem
    $username = (Get-WmiObject -Class Win32_ComputerSystem).UserName

    if ($username -match "^(.+\\)?(.+)$") {
        return $matches[2]
    }

    return $null
}

# Function to check for threat detections in Windows Defender and generate an HTML report
function Check-UserThreatDetection {
    param (
        [Parameter(Mandatory = $true)]
        [string]$userName,
        [Parameter(Mandatory = $true)]
        [string]$outputFile
    )

    # Get the threat detections for the user
    $threatDetections = Get-MpThreatDetection | Where-Object {$_.UserName -eq $userName}

    if ($threatDetections) {
        $htmlReport = ConvertTo-Html -Property "ThreatID", "ThreatName", "Severity", "ActionTaken" -InputObject $threatDetections
    }
    else {
        # Create an empty table in the HTML report when no threat is detected
        $htmlReport = "<table><tr><th>No threat detected for user: $userName</th></tr></table>"
    }

    # Save the HTML report to the specified output file
    $htmlReport | Out-File -FilePath $outputFile

    if ($threatDetections) {
        Write-Host "Threat detected for user: $userName"
        Write-Host "Total threat detections: $($threatDetections.Count)"
    }
    else {
        Write-Host "No threat detected for user: $userName"
    }

    Write-Host "HTML report saved to: $outputFile"
}

# Main script

# Get the currently logged-in user
$currentUser = Get-CurrentLoggedInUser

if ($currentUser) {
    Write-Host "Current logged-in user: $currentUser"
    $targetUser = $currentUser

    # Specify the output HTML file path
    $outputFile = "C:\Users\pault\report.html"

    # Call the function to check for threat detections and generate the HTML report
    Check-UserThreatDetection -userName $targetUser -outputFile $outputFile
}
else {
    Write-Host "Unable to retrieve the currently logged-in user."
}
