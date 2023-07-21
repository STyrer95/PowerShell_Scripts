$ComputerInfo = Get-ComputerInfo

$HtmlTemplate = @"
<!DOCTYPE html>
<html>
<head>
<title>Computer Information</title>
<style>
    body {
        font-family: Arial, sans-serif;
    }
    table {
        border-collapse: collapse;
        width: 100%;
    }
    th, td {
        padding: 8px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }
    th {
        background-color: #f2f2f2;
    }
</style>
</head>
<body>
<h1>Computer Information</h1>
<table>
    <tr>
        <th>Property</th>
        <th>Value</th>
    </tr>
    $(
        foreach ($property in $ComputerInfo.PSObject.Properties) {
            "<tr><td>$($property.Name)</td><td>$($property.Value)</td></tr>"
        }
    )
</table>
</body>
</html>
"@

$HtmlFilePath = "ComputerInfo.html"
$HtmlTemplate | Out-File -FilePath $HtmlFilePath

Write-Host "Computer information exported to: $HtmlFilePath"
