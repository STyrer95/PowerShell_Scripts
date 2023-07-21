# PowerShell_Scripts

# Threat Detection Report Script

This PowerShell script is designed to check for threat detections in Windows Defender and generate an HTML report for the currently logged-in user. The script consists of two main functions: `Get-CurrentLoggedInUser` and `Check-UserThreatDetection`. Additionally, it includes a main script that utilizes these functions to generate the report.

## Function: Get-CurrentLoggedInUser

This function retrieves the username of the currently logged-in user from the `Win32_ComputerSystem` WMI class. It handles domain-based usernames and extracts the user's actual username, which is then returned.

## Function: Check-UserThreatDetection

This function is responsible for checking for threat detections in Windows Defender for a specified user and generating an HTML report based on the findings. It takes two parameters:

- `userName`: The username of the user whose threat detections are to be checked.
- `outputFile`: The path of the output HTML report file to be generated.

The function uses the `Get-MpThreatDetection` cmdlet to fetch the threat detections and filters them to include only the detections related to the specified user. It then converts the threat detections into an HTML table using the `ConvertTo-Html` cmdlet and saves the table to the specified output file using `Out-File`.

If no threat is detected for the user, an empty table is included in the HTML report to indicate that there were no threats found.

## Main Script

The main script begins by calling the `Get-CurrentLoggedInUser` function to retrieve the currently logged-in user's username. If successful, it proceeds to display the logged-in user's name and then sets the `targetUser` variable to the same username.

Next, it specifies the path for the output HTML report file using the variable `$outputFile`.

Finally, the script calls the `Check-UserThreatDetection` function, passing the `targetUser` and `outputFile` variables as arguments. This function checks for threat detections for the specified user and generates the HTML report accordingly.

The script provides informative messages during its execution, such as whether threats were detected or not, and the total number of threat detections if any were found.

## Usage

1. Save the script in a `.ps1` file, e.g., `ThreatDetectionReport.ps1`.
2. Open a PowerShell window and navigate to the folder containing the script.
3. Execute the script by running `.\ThreatDetectionReport.ps1`.

Please note that the script requires appropriate permissions to access Windows Defender threat detection data and to write the HTML report to the specified output file. It is recommended to run the script with elevated privileges or an account with sufficient permissions for accurate results.

The HTML report will be generated in the specified location (`C:\Users\pault\report.html` in this case), providing valuable insights into any threats detected for the currently logged-in user by Windows Defender.
