# Get Windows Defender properties
$defender = Get-MpComputerStatus

# Create an HTML table with properties
$html = @"
<!DOCTYPE html>
<html>
<head>
    <style>
        table {
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid black;
            padding: 8px;
        }
        th {
            background-color: #dddddd;
        }
    </style>
</head>
<body>
    <h2>Windows Defender Properties</h2>
    <table>
        <tr>
            <th>Property</th>
            <th>Value</th>
        </tr>
        <tr>
            <td>Real-time Protection Enabled</td>
            <td>$($defender.RealTimeProtectionEnabled)</td>
        </tr>
        <tr>
            <td>Antivirus Signature Version</td>
            <td>$($defender.AntivirusSignatureVersion)</td>
        </tr>
        <tr>
            <td>Last Full Scan Time</td>
            <td>$($defender.LastFullScanTime)</td>
        </tr>
        <tr>
            <td>Last Quick Scan Time</td>
            <td>$($defender.LastQuickScanTime)</td>
        </tr>
        <tr>
            <td>Engine Version</td>
            <td>$($defender.EngineVersion)</td>
        </tr>
        <tr>
            <td>Engine Updates Available</td>
            <td>$($defender.EngineUpdatesAvailable)</td>
        </tr>
    </table>
</body>
</html>
"@

# Export HTML content to a file
$html | Out-File -FilePath "DefenderProperties.html"
# Get Windows Security properties
$security = Get-MpComputerStatus

# Create an HTML table with properties
$html = @"
<!DOCTYPE html>
<html>
<head>
    <style>
        table {
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid black;
            padding: 8px;
        }
        th {
            background-color: #dddddd;
        }
    </style>
</head>
<body>
    <h2>Windows Security Properties</h2>
    <table>
        <tr>
            <th>Property</th>
            <th>Value</th>
        </tr>
        <tr>
            <td>Real-time Protection Enabled</td>
            <td>$($security.RealTimeProtectionEnabled)</td>
        </tr>
        <tr>
            <td>Antivirus Signature Version</td>
            <td>$($security.AntivirusSignatureVersion)</td>
        </tr>
        <tr>
            <td>Last Full Scan Time</td>
            <td>$($security.LastFullScanTime)</td>
        </tr>
        <tr>
            <td>Last Quick Scan Time</td>
            <td>$($security.LastQuickScanTime)</td>
        </tr>
        <tr>
            <td>Engine Version</td>
            <td>$($security.EngineVersion)</td>
        </tr>
        <tr>
            <td>Engine Updates Available</td>
            <td>$($security.EngineUpdatesAvailable)</td>
        </tr>
    </table>
</body>
</html>
"@

# Export HTML content to a file
$html | Out-File -FilePath "SecurityProperties.html"
