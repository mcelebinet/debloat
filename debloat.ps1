 
# Mustafa Celebi Debloater & Chocolatey Software Installer
# Author Mustafa Celebi (info@mcelebi.net)
# All rights reserved. Copyright Mustafa Celebi
#


Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()
$Button = [System.Windows.Forms.MessageBoxButtons]::YesNoCancel
$ErrorIco = [System.Windows.Forms.MessageBoxIcon]::Error
$ErrorActionPreference = 'SilentlyContinue'
$wshell = New-Object -ComObject Wscript.Shell

$Ask = 'Do you want to run this as an Administrator?
        Select "Yes" to Run as an Administrator
        Select "No" to not run this as an Administrator

        Select "Cancel" to stop the script.'

If (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]'Administrator')) {
    $Prompt = [System.Windows.MessageBox]::Show($Ask, "Run as an Administrator or not?", $Button, $ErrorIco)
    Switch ($Prompt) {
        #This will debloat Windows 10
        Yes {
            Write-Host "You didn't run this script as an Administrator. This script will self elevate to run as an Administrator and continue."
            Start-Process PowerShell.exe -ArgumentList ("-NoProfile -ExecutionPolicy Bypass -File `"{0}`"" -f $PSCommandPath) -Verb RunAs
            Exit
        }
        No {
            Break
        }
    }
}
$Form = New-Object system.Windows.Forms.Form
$Form.ClientSize = New-Object System.Drawing.Point(700, 480)
$Form.text = "Mustafa - Windows 10 Install Helper"
$Form.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen
$Form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedDialog
$Form.ControlBox = $false
$Form.TopMost = $false
$Form.CancelButton = $endButton

$Label3 = New-Object system.Windows.Forms.Label
$Label3.text = "Mustafa Celebi"
$Label3.AutoSize = $true
$Label3.width = 25
$Label3.height = 10
$Label3.location = New-Object System.Drawing.Point(190, 18)
$Label3.Font = New-Object System.Drawing.Font('Tahoma', 20, [System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))

$Label4 = New-Object system.Windows.Forms.Label
$Label4.text = "Windows 10 Install Helper"
$Label4.AutoSize = $true
$Label4.width = 25
$Label4.height = 10
$Label4.location = New-Object System.Drawing.Point(190, 58)
$Label4.Font = New-Object System.Drawing.Font('Tahoma', 20, [System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))

$PictureBox1 = New-Object system.Windows.Forms.PictureBox
$PictureBox1.width = 113
$PictureBox1.height = 83
$PictureBox1.location = New-Object System.Drawing.Point(30, 13)
$PictureBox1.imageLocation = "https://1.mcelebi.net/d/mc.png"
$PictureBox1.SizeMode = [System.Windows.Forms.PictureBoxSizeMode]::zoom


$Label1 = New-Object system.Windows.Forms.Label
$Label1.text = "Uninstalled Windows Apps"
$Label1.AutoSize = $true
$Label1.width = 25
$Label1.height = 10
$Label1.location = New-Object System.Drawing.Point(30, 100)
$Label1.Font = New-Object System.Drawing.Font('Tahoma', 8, [System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))

$DebloatList = New-Object system.Windows.Forms.CheckedListBox
$DebloatList.text = "DebloatList"
$DebloatList.width = 200
$DebloatList.height = 300
$DebloatList.CheckOnClick = $true
$DebloatList.location = New-Object System.Drawing.Point(30, 120)

$Label5 = New-Object system.Windows.Forms.Label
$Label5.text = "Windows Tweaks"
$Label5.AutoSize = $true
$Label5.width = 25
$Label5.height = 1
$Label5.location = New-Object System.Drawing.Point(250, 100)
$Label5.Font = New-Object System.Drawing.Font('Tahoma', 8, [System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))

$TweakList = New-Object system.Windows.Forms.CheckedListBox
$TweakList.text = "TweakList"
$TweakList.width = 200
$TweakList.height = 300
$TweakList.CheckOnClick = $true
$TweakList.location = New-Object System.Drawing.Point(250, 120)

$Label2 = New-Object system.Windows.Forms.Label
$Label2.text = "Installed Apps"
$Label2.AutoSize = $true
$Label2.width = 25
$Label2.height = 10
$Label2.location = New-Object System.Drawing.Point(470, 100)
$Label2.Font = New-Object System.Drawing.Font('Tahoma', 8, [System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))

$InstalledAppList = New-Object system.Windows.Forms.CheckedListBox
$InstalledAppList.text = "InstalledAppList"
$InstalledAppList.width = 200
$InstalledAppList.height = 300
$InstalledAppList.CheckOnClick = $true
$InstalledAppList.location = New-Object System.Drawing.Point(470, 120)

$startButton = New-Object system.Windows.Forms.Button
$startButton.text = "Start"
$startButton.width = 100
$startButton.height = 30
$startButton.location = New-Object System.Drawing.Point(460, 430)
$startButton.Font = New-Object System.Drawing.Font('Microsoft Sans Serif', 12)

$startButton.Add_Click( {
        Start-QT-Actions
    })

$endButton = New-Object system.Windows.Forms.Button
$endButton.text = "Close"
$endButton.width = 100
$endButton.height = 30
$endButton.location = New-Object System.Drawing.Point(570, 430)
$endButton.Font = New-Object System.Drawing.Font('Microsoft Sans Serif', 12)

$endButton.Add_Click( {
        $Form.Dispose()
    })

$Label6 = New-Object system.Windows.Forms.Label
$Label6.text = "All Rights Reserved. The user is responsible for any problems that may occur."
$Label6.AutoSize = $true
$Label6.width = 25
$Label6.height = 10
$Label6.location = New-Object System.Drawing.Point(20, 430)
$Label6.Font = New-Object System.Drawing.Font('Tahoma', 8, [System.Drawing.FontStyle]([System.Drawing.FontStyle]::Normal))

$Label7 = New-Object System.Windows.Forms.LinkLabel
$Label7.text = "Mustafa Celebi"

$Label7.AutoSize = $true
$Label7.width = 25
$Label7.height = 10
$Label7.location = New-Object System.Drawing.Point(20, 450)
$Label7.Font = New-Object System.Drawing.Font('Tahoma', 8, [System.Drawing.FontStyle]([System.Drawing.FontStyle]::Normal))

$Label7.Add_Click( {
        Start-Process "https://mcelebi.net"
    })

$chkDebloatApps = New-Object System.Windows.Forms.CheckBox
$chkDebloatApps.location = New-Object System.Drawing.Point(217, 97)
$chkDebloatApps.ThreeState = $true
$chkDebloatApps.CheckState = "Indeterminate"
$chkDebloatApps.Add_CheckStateChanged( {
        Write-Host $chkDebloatApps.CheckState
        if ($chkDebloatApps.CheckState -eq "Checked") {
            For ($i = 0; $i -lt $DebloatList.Items.count; $i++) {
                $DebloatList.SetItemchecked($i, $true)
            }
        }
        if ($chkDebloatApps.CheckState -eq "Unchecked") {
            For ($i = 0; $i -lt $DebloatList.Items.count; $i++) {
                $DebloatList.SetItemchecked($i, $false)
            }
        }
        if ($chkDebloatApps.CheckState -eq "Indeterminate") {
            $DebloatList.Items.Clear()
            foreach ($Bloat in $Bloatware) {
                if ($Bloat.StartsWith("@") -or $Bloat -eq "---------") {
                    [void] $DebloatList.Items.Add($Bloat.Remove(0, 1), $false)
                }
                else {
                    [void] $DebloatList.Items.Add($Bloat, $true)
                }
            }
        }
    })

$chkTweaks = New-Object System.Windows.Forms.CheckBox
$chkTweaks.location = New-Object System.Drawing.Point(437, 97)
$chkTweaks.ThreeState = $true
$chkTweaks.CheckState = "Indeterminate"
$chkTweaks.Add_CheckStateChanged( {
        if ($chkTweaks.CheckState -eq "Checked") {
            For ($i = 0; $i -lt $TweakList.Items.count; $i++) {
                $TweakList.SetItemchecked($i, $true)
            }
        }
        if ($chkTweaks.CheckState -eq "Unchecked") {
            For ($i = 0; $i -lt $TweakList.Items.count; $i++) {
                $TweakList.SetItemchecked($i, $false)
            }
        }
        if ($chkTweaks.CheckState -eq "Indeterminate") {
            $TweakList.Items.Clear()
            foreach ($Tweak in $Tweaks) {
                if ($Tweak.StartsWith("@") -or $Tweak -eq "---------") {
                    [void] $TweakList.Items.Add($Tweak.Remove(0, 1), $false)
                }
                else {
                    [void] $TweakList.Items.Add($Tweak, $true)
                }
            }
        }
    })

$chkInstalledApps = New-Object System.Windows.Forms.CheckBox
$chkInstalledApps.location = New-Object System.Drawing.Point(657, 97)
$chkInstalledApps.ThreeState = $true
$chkInstalledApps.CheckState = "Indeterminate"
$chkInstalledApps.Add_CheckStateChanged( {
        if ($chkInstalledApps.CheckState -eq "Checked") {
            For ($i = 0; $i -lt $InstalledAppList.Items.count; $i++) {
                $InstalledAppList.SetItemchecked($i, $true)
            }
        }
        if ($chkInstalledApps.CheckState -eq "Unchecked") {
            For ($i = 0; $i -lt $InstalledAppList.Items.count; $i++) {
                $InstalledAppList.SetItemchecked($i, $false)
            }
        }
        if ($chkInstalledApps.CheckState -eq "Indeterminate") {
            $InstalledAppList.Items.Clear()
            foreach ($App in $Apps) {
                if ($App.StartsWith("@")) {
                    [void] $InstalledAppList.Items.Add($App.Remove(0, 1), $false)
                }
                elseif ($App.StartsWith("#")) {
                    [void] $InstalledAppList.Items.Add($App, $false)
                }
                else {
                    [void] $InstalledAppList.Items.Add($App, $true)
                }
            }
        }
    })

$Form.controls.AddRange(@($InstalledAppList, $Label2, $DebloatList, $Label1, $PictureBox1, $Label3, $Label4, $Label5, $TweakList, $startButton, $Label6, $Label7, $endButton, $chkDebloatApps, $chkTweaks, $chkInstalledApps))

$Bloatware = @(

    #Unnecessary Windows 10 AppX Apps
    "Microsoft.3DBuilder"
    "Microsoft.AppConnector"
    "Microsoft.BingFinance"
    "Microsoft.BingNews"
    "Microsoft.BingSports"
    "Microsoft.BingTranslator"
    "Microsoft.BingWeather"
    "Microsoft.GetHelp"
    "Microsoft.Getstarted"
    "@Microsoft.Messaging"
    "Microsoft.Microsoft3DViewer"
    "Microsoft.MicrosoftSolitaireCollection"
    "Microsoft.NetworkSpeedTest"
    "Microsoft.News"
    "Microsoft.Office.Lens"
    "Microsoft.Office.Sway"
    "Microsoft.OneConnect"
    "Microsoft.People"
    "Microsoft.Print3D"
    "@Microsoft.SkypeApp"
    "Microsoft.StorePurchaseApp"
    "Microsoft.Wallet"
    "Microsoft.Whiteboard"
    "Microsoft.WindowsAlarms"
    "microsoft.windowscommunicationsapps"
    "Microsoft.WindowsFeedbackHub"
    "Microsoft.WindowsMaps"
    "Microsoft.WindowsSoundRecorder"
    "Microsoft.ZuneMusic"
    "Microsoft.ZuneVideo"

    #Sponsored Windows 10 AppX Apps
    #Add sponsored/featured apps to remove in the "*AppName*" format
    "*EclipseManager*"
    "*ActiproSoftwareLLC*"
    "*AdobeSystemsIncorporated.AdobePhotoshopExpress*"
    "*Duolingo-LearnLanguagesforFree*"
    "*PandoraMediaInc*"
    "*CandyCrush*"
    "*BubbleWitch3Saga*"
    "*Wunderlist*"
    "*Flipboard*"
    "*Twitter*"
    "*Facebook*"
    "*Royal Revolt*"
    "*Sway*"
    "*Speed Test*"
    "@*Dolby*"
    "*Viber*"
    "*ACGMediaPlayer*"
    "*Netflix*"
    "*OneCalendar*"
    "*LinkedInforWindows*"
    "*HiddenCityMysteryofShadows*"
    "*Hulu*"
    "*HiddenCity*"
    "*AdobePhotoshopExpress*"
    #Optional: Typically not removed but you can if you need to for some reason
    "@*Microsoft.Advertising.Xaml_10.1712.5.0_x64__8wekyb3d8bbwe*"
    "@*Microsoft.Advertising.Xaml_10.1712.5.0_x86__8wekyb3d8bbwe*"
    "@*Microsoft.BingWeather*"
    "@*Microsoft.MSPaint*"
    "@*Microsoft.MicrosoftStickyNotes*"
    "@*Microsoft.Windows.Photos*"
    "@*Microsoft.WindowsCalculator*"
    "@*Microsoft.WindowsStore*"
)

foreach ($Bloat in $Bloatware) {
    if ($Bloat.StartsWith("@") -or $Bloat -eq "---------") {
        [void] $DebloatList.Items.Add($Bloat.Remove(0, 1), $false)
    }
    else {
        [void] $DebloatList.Items.Add($Bloat, $true)
    }
}

$Tweaks = @(
    "Disable Bing on Start Menu",
    "@Disable Windows Search",
    "Hide Taskbar Search Bar",
    "Disable Background Apps",
    "Disable Cortana",
    "---------",
    "@Low UAC Level",
    "@Disable Windows Defender",
    "@Disable Windows Defender Cloud",
    "@Disable MRT",
    "---------",
    "Disable Action Center",
    "Adjust VFX for Performance",
    "Remove OneDrive",
    "@Dark Mode"
    "---------",
    "Apply O&O Shutup",
    "Disable Telemetry",
    "Disable Application Suggestions",
    "Disable Activity History",
    "Disable Location Tracking",
    "Disable Automatic Maps Updates",
    "Disable Feedback",
    "Disable Tailored Experiences",
    "Disable Advertising ID",
    "Disable Error reporting",
    "Restricting Windows Update P2P",
    "Disable Diagnostics Tracking Service",
    "Disable WAP Push Service",
    "Enabling F8 Boot Menu",
    "Disable Home Groups Services",
    "Disable Remote Assistance",
    "Disable Storage Sense",
    "Disable Superfetch Service",
    "Set BIOS time to UTC",
    "@Disable Hibernation",
    "Enable Task Manager Details",
    "Enable File Operations Details",
    "Hide Task View Button",
    "Hide People Icon",
    "Show All Tray Icons",
    "Enable NumLock After Startup",
    "Change Default Explorer View to This PC",
    "@Disable Edge PDF Viewer",
    "Remove Paint3D",
    "Enable Windows Media Player"
)

foreach ($Tweak in $Tweaks) {
    if ($Tweak.StartsWith("@") -or $Tweak -eq "---------") {
        [void] $TweakList.Items.Add($Tweak.Remove(0, 1), $false)
    }
    else {
        [void] $TweakList.Items.Add($Tweak, $true)
    }
}

$Apps = @(
    "### Web Browsers ###",
    "googlechrome",
    "brave",
    "@firefox",
    "@opera",
    "@safari",
    "### Messaging ###",
    "@discord",
    "@pidgin",
    "@thunderbird",
    "@trillian",
    "@zoom",
    "@whatsapp",
    "@franz",
    "@slack",
    "@webex-teams",
    "@microsoft-teams",
    "@mailspring",
    "### Multimedia ###",
    "@aimp",
    "@audacity",
    "@gimp",
    "@gom-player",
    "@irfanview",
    "@itunes",
    "@k-litecodecpackfull",
    "@spotify",
    "@stremio",
    "vlc",
    "@winamp",
    "### Runtimes ###",
    "@adobeair",
    "dotnetfx",
    "@jre8",
    "@silverlight",
    "vcredist140",
    "### Office ###",
    "@adobereader",
    "@foxitreader",
    "@freeoffice",
    "@libreoffice",
    "@openoffice",
    "@sumartapdf",
    "### Remote Connection ###",
    "@ammyy-admin",
    "@anydesk",
    "@filezilla",
    "@putty.install",
    "@teamviewer",
    "@ultravnc",
    "@vnc-viewer",
    "@winscp",
    "### Dev Tools ###",
    "@android-sdk",
    "@androidstudio",
    "@eclipse",
    "@git",
    "@gitkraken",
    "@heidisql",
    "@jdk11",
    "@jdk8",
    "@mysql",
    "@mysql-odbc",
    "@mysql.workbench",
    "notepadplusplus.install",
    "@python",
    "@sql-server-express",
    "@sql-server-management-studio",
    "@sublimetext2",
    "@vim",
    "@vscode",
    "@winmerge",
    "### Utilities ###",
    "@7zip.install",
    "@ccleaner",
    "@cdburnerxp",
    "@classic-shell",
    "@cpu-z.install",
    "@imgburn",
    "@microsoft-windows-terminal",
    "@qbittorrent",
    "@recuva",
    "@revo-uninstaller",
    "sysinternals",
    "@teracopy",
    "@windirstat",
    "winrar",
    "### Windows Subsystem Linux ###",
    "@wsl",
    "@wsl2",
    "@wsl-alpine",
    "@wsl-archlinux",
    "@wsl-debiangnulinux",
    "@wsl-kalilinux",
    "@wsl-opensuse",
    "@wsl-ubuntu-1804",
    "@wsl-ubuntu-2004",
    "### Other ###",
    "@avastfreeantivirus",
    "@avgantivirusfree",
    "@dropbox",
    "@evernote",
    "@everything",
    "@google-backup-and-sync",
    "@googleearth",
    "@keepass",
    "@malwarebytes",
    "@steam-client",
    "@ubiquiti-unifi-controller",
    "@virtualbox"
)

foreach ($App in $Apps) {
    if ($App.StartsWith("@")) {
        [void] $InstalledAppList.Items.Add($App.Remove(0, 1), $false)
    }
    elseif ($App.StartsWith("#")) {
        [void] $InstalledAppList.Items.Add($App, $false)
    }
    else {
        [void] $InstalledAppList.Items.Add($App, $true)
    }
}

function Start-QT-Actions {
    $startButton.Enabled = $false

    # Actions Bloatwares
    foreach ($Bloat in $DebloatList.CheckedItems) {
        Get-AppxPackage -Name $Bloat | Remove-AppxPackage
        Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like $Bloat | Remove-AppxProvisionedPackage -Online
        Write-Host "Trying to remove $Bloat."
    }

    # Apply Tweaks
    if ($TweakList.CheckedItems.Count -gt 0) {
        Write-Host "Creating Restore Point incase something bad happens"
        Enable-ComputerRestore -Drive "C:\"
        Checkpoint-Computer -Description "RestorePoint1" -RestorePointType "MODIFY_SETTINGS"
    }
    foreach ($Tweak in $TweakList.CheckedItems) {
        Write-Host "Applying $Tweak..." -NoNewline
        switch ($Tweak) {
            "Disable Bing on Start Menu" {
                Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" -Name "BingSearchEnabled" -Type DWord -Value 0
                Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" -Name "CortanaConsent" -Type DWord -Value 0
                If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search")) {
                    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Force | Out-Null
                }
                Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Name "DisableWebSearch" -Type DWord -Value 1
                Break
            }
            "@Disable Windows Search" {
                Stop-Service "WSearch" -WarningAction SilentlyContinue
                Set-Service "WSearch" -StartupType Disabled
                Break
            }
            "Hide Taskbar Search Bar" {
                Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" -Name "SearchboxTaskbarMode" -Type DWord -Value 0
                Break
            }
            "Disable Background Apps" {
                Get-ChildItem -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" -Exclude "Microsoft.Windows.Cortana*" | ForEach {
                    Set-ItemProperty -Path $_.PsPath -Name "Disabled" -Type DWord -Value 1
                    Set-ItemProperty -Path $_.PsPath -Name "DisabledByUser" -Type DWord -Value 1
                }
                Break
            }
            "Disable Cortana" {
                If (!(Test-Path "HKCU:\SOFTWARE\Microsoft\Personalization\Settings")) {
                    New-Item -Path "HKCU:\SOFTWARE\Microsoft\Personalization\Settings" -Force | Out-Null
                }
                Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Personalization\Settings" -Name "AcceptedPrivacyPolicy" -Type DWord -Value 0
                If (!(Test-Path "HKCU:\SOFTWARE\Microsoft\InputPersonalization")) {
                    New-Item -Path "HKCU:\SOFTWARE\Microsoft\InputPersonalization" -Force | Out-Null
                }
                Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\InputPersonalization" -Name "RestrictImplicitTextCollection" -Type DWord -Value 1
                Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\InputPersonalization" -Name "RestrictImplicitInkCollection" -Type DWord -Value 1
                If (!(Test-Path "HKCU:\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore")) {
                    New-Item -Path "HKCU:\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore" -Force | Out-Null
                }
                Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore" -Name "HarvestContacts" -Type DWord -Value 0
                If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search")) {
                    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Force | Out-Null
                }
                Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Name "AllowCortana" -Type DWord -Value 0
                Break
            }
            "Low UAC Level" {
                Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "ConsentPromptBehaviorAdmin" -Type DWord -Value 0
                Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "PromptOnSecureDesktop" -Type DWord -Value 0
                Break
            }
            "Disable Windows Defender" {
                If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender")) {
                    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender" -Force | Out-Null
                }
                Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender" -Name "DisableAntiSpyware" -Type DWord -Value 1
                If ([System.Environment]::OSVersion.Version.Build -eq 14393) {
                    Remove-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" -Name "WindowsDefender" -ErrorAction SilentlyContinue
                }
                ElseIf ([System.Environment]::OSVersion.Version.Build -ge 15063) {
                    Remove-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" -Name "SecurityHealth" -ErrorAction SilentlyContinue
                }
                Break
            }
            "Disable Windows Defender Cloud" {
                If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet")) {
                    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" -Force | Out-Null
                }
                Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" -Name "SpynetReporting" -Type DWord -Value 0
                Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" -Name "SubmitSamplesConsent" -Type DWord -Value 2
                Remove-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\QualityCompat" -Name "cadca5fe-87d3-4b96-b7fb-a231484277cc" -ErrorAction SilentlyContinue
                Break
            }
            "Disable MRT" {
                If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\MRT")) {
                    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\MRT" | Out-Null
                }
                Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\MRT" -Name "DontOfferThroughWUAU" -Type DWord -Value 1
                Break
            }
            "Disable Action Center" {
                If (!(Test-Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\Explorer")) {
                    New-Item -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\Explorer" | Out-Null
                }
                Set-ItemProperty -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\Explorer" -Name "DisableNotificationCenter" -Type DWord -Value 1
                Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\PushNotifications" -Name "ToastEnabled" -Type DWord -Value 0
                Break
            }
            "Adjust VFX for Performance" {
                Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "DragFullWindows" -Type String -Value 0
                Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "MenuShowDelay" -Type String -Value 200
                Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "UserPreferencesMask" -Type Binary -Value ([byte[]](144, 18, 3, 128, 16, 0, 0, 0))
                Set-ItemProperty -Path "HKCU:\Control Panel\Desktop\WindowMetrics" -Name "MinAnimate" -Type String -Value 0
                Set-ItemProperty -Path "HKCU:\Control Panel\Keyboard" -Name "KeyboardDelay" -Type DWord -Value 0
                Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ListviewAlphaSelect" -Type DWord -Value 0
                Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ListviewShadow" -Type DWord -Value 0
                Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarAnimations" -Type DWord -Value 0
                Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" -Name "VisualFXSetting" -Type DWord -Value 3
                Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\DWM" -Name "EnableAeroPeek" -Type DWord -Value 0
                Break
            }
            "Remove OneDrive" {
                Stop-Process -Name "OneDrive" -ErrorAction SilentlyContinue
                Start-Sleep -s 2
                $onedrive = "$env:SYSTEMROOT\SysWOW64\OneDriveSetup.exe"
                If (!(Test-Path $onedrive)) {
                    $onedrive = "$env:SYSTEMROOT\System32\OneDriveSetup.exe"
                }
                Start-Process $onedrive "/uninstall" -NoNewWindow -Wait
                Start-Sleep -s 2
                Stop-Process -Name "explorer" -ErrorAction SilentlyContinue
                Start-Sleep -s 2
                Remove-Item -Path "$env:USERPROFILE\OneDrive" -Force -Recurse -ErrorAction SilentlyContinue
                Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\OneDrive" -Force -Recurse -ErrorAction SilentlyContinue
                Remove-Item -Path "$env:PROGRAMDATA\Microsoft OneDrive" -Force -Recurse -ErrorAction SilentlyContinue
                Remove-Item -Path "$env:SYSTEMDRIVE\OneDriveTemp" -Force -Recurse -ErrorAction SilentlyContinue
                If (!(Test-Path "HKCR:")) {
                    New-PSDrive -Name HKCR -PSProvider Registry -Root HKEY_CLASSES_ROOT | Out-Null
                }
                Remove-Item -Path "HKCR:\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" -Recurse -ErrorAction SilentlyContinue
                Remove-Item -Path "HKCR:\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" -Recurse -ErrorAction SilentlyContinue
                Break
            }
            "Dark Mode" {
                Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name AppsUseLightTheme -Value 0
                Break
            }
            "Apply OO Shutup" {
                Import-Module BitsTransfer
                choco install shutup10 -y
                Start-BitsTransfer -Source "https://raw.githubusercontent.com/ChrisTitusTech/win10script/master/ooshutup10.cfg" -Destination ooshutup10.cfg
                OOSU10 ooshutup10.cfg /quiet
                Start-BitsTransfer -Source "https://dl5.oo-software.com/files/ooshutup10/OOSU10.exe" -Destination OOSU10.exe
                ./OOSU10.exe ooshutup10.cfg /quiet
                Break
            }
            "Disable Telemetry" {
                Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" -Name "AllowTelemetry" -Type DWord -Value 0
                Set-ItemProperty -Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Policies\DataCollection" -Name "AllowTelemetry" -Type DWord -Value 0
                Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "AllowTelemetry" -Type DWord -Value 0
                Disable-ScheduledTask -TaskName "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" | Out-Null
                Disable-ScheduledTask -TaskName "Microsoft\Windows\Application Experience\ProgramDataUpdater" | Out-Null
                Disable-ScheduledTask -TaskName "Microsoft\Windows\Autochk\Proxy" | Out-Null
                Disable-ScheduledTask -TaskName "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" | Out-Null
                Disable-ScheduledTask -TaskName "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" | Out-Null
                Disable-ScheduledTask -TaskName "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" | Out-Null
                Break
            }
            "Disable Application Suggestions" {
                Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "ContentDeliveryAllowed" -Type DWord -Value 0
                Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "OemPreInstalledAppsEnabled" -Type DWord -Value 0
                Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "PreInstalledAppsEnabled" -Type DWord -Value 0
                Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "PreInstalledAppsEverEnabled" -Type DWord -Value 0
                Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SilentInstalledAppsEnabled" -Type DWord -Value 0
                Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-338387Enabled" -Type DWord -Value 0
                Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-338388Enabled" -Type DWord -Value 0
                Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-338389Enabled" -Type DWord -Value 0
                Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-353698Enabled" -Type DWord -Value 0
                Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SystemPaneSuggestionsEnabled" -Type DWord -Value 0
                If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent")) {
                    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent" -Force | Out-Null
                }
                Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent" -Name "DisableWindowsConsumerFeatures" -Type DWord -Value 1
                Break
            }
            "Disable Activity History" {
                Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "EnableActivityFeed" -Type DWord -Value 0
                Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "PublishUserActivities" -Type DWord -Value 0
                Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "UploadUserActivities" -Type DWord -Value 0
                Break
            }
            "Disable Location Tracking" {
                If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location")) {
                    New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" -Force | Out-Null
                }
                Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" -Name "Value" -Type String -Value "Deny"
                Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Overrides\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" -Name "SensorPermissionState" -Type DWord -Value 0
                Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\lfsvc\Service\Configuration" -Name "Status" -Type DWord -Value 0
                Break
            }
            "Disable Automatic Maps Updates" {
                Set-ItemProperty -Path "HKLM:\SYSTEM\Maps" -Name "AutoUpdateEnabled" -Type DWord -Value 0
                Break
            }
            "Disable Feedback" {
                If (!(Test-Path "HKCU:\SOFTWARE\Microsoft\Siuf\Rules")) {
                    New-Item -Path "HKCU:\SOFTWARE\Microsoft\Siuf\Rules" -Force | Out-Null
                }
                Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Siuf\Rules" -Name "NumberOfSIUFInPeriod" -Type DWord -Value 0
                Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "DoNotShowFeedbackNotifications" -Type DWord -Value 1
                Disable-ScheduledTask -TaskName "Microsoft\Windows\Feedback\Siuf\DmClient" -ErrorAction SilentlyContinue | Out-Null
                Disable-ScheduledTask -TaskName "Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload" -ErrorAction SilentlyContinue | Out-Null
                Break
            }
            "Disable Tailored Experiences" {
                If (!(Test-Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\CloudContent")) {
                    New-Item -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\CloudContent" -Force | Out-Null
                }
                Set-ItemProperty -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\CloudContent" -Name "DisableTailoredExperiencesWithDiagnosticData" -Type DWord -Value 1
                Break
            }
            "Disable Advertising ID" {
                If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo")) {
                    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" | Out-Null
                }
                Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" -Name "DisabledByGroupPolicy" -Type DWord -Value 1
                Break
            }
            "Disable Error reporting" {
                Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\Windows Error Reporting" -Name "Disabled" -Type DWord -Value 1
                Disable-ScheduledTask -TaskName "Microsoft\Windows\Windows Error Reporting\QueueReporting" | Out-Null
                Break
            }
            "Restricting Windows Update P2P" {
                If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config")) {
                    New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" | Out-Null
                }
                Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" -Name "DODownloadMode" -Type DWord -Value 1
                Break
            }
            "Disable Diagnostics Tracking Service" {
                Stop-Service "DiagTrack" -WarningAction SilentlyContinue
                Set-Service "DiagTrack" -StartupType Disabled
                Break
            }
            "Disable WAP Push Service" {
                Stop-Service "dmwappushservice" -WarningAction SilentlyContinue
                Set-Service "dmwappushservice" -StartupType Disabled
                Break
            }
            "Enabling F8 Boot Menu" {
                bcdedit /set `{current`} bootmenupolicy Legacy | Out-Null
                Break
            }
            "Disable Home Groups Services" {
                Stop-Service "HomeGroupListener" -WarningAction SilentlyContinue
                Set-Service "HomeGroupListener" -StartupType Disabled
                Stop-Service "HomeGroupProvider" -WarningAction SilentlyContinue
                Set-Service "HomeGroupProvider" -StartupType Disabled
                Break
            }
            "Disable Remote Assistance" {
                Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Remote Assistance" -Name "fAllowToGetHelp" -Type DWord -Value 0
                Break
            }
            "Disable Storage Sense" {
                Remove-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy" -Recurse -ErrorAction SilentlyContinue
                Break
            }
            "Disable Superfetch Service" {
                Stop-Service "SysMain" -WarningAction SilentlyContinue
                Set-Service "SysMain" -StartupType Disabled
                Break
            }
            "Set BIOS time to UTC" {
                Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\TimeZoneInformation" -Name "RealTimeIsUniversal" -Type DWord -Value 1
                Break
            }
            "Disable Hibernation" {
                Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Session Manager\Power" -Name "HibernteEnabled" -Type Dword -Value 0
                If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings")) {
                    New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings" | Out-Null
                }
                Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings" -Name "ShowHibernateOption" -Type Dword -Value 0
                Break
            }
            "Enable Task Manager Details" {
                $taskmgr = Start-Process -WindowStyle Hidden -FilePath taskmgr.exe -PassThru
                Do {
                    Start-Sleep -Milliseconds 100
                    $preferences = Get-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\TaskManager" -Name "Preferences" -ErrorAction SilentlyContinue
                } Until ($preferences)
                Stop-Process $taskmgr
                $preferences.Preferences[28] = 0
                Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\TaskManager" -Name "Preferences" -Type Binary -Value $preferences.Preferences
                Break
            }
            "Enable File Operations Details" {
                If (!(Test-Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\OperationStatusManager")) {
                    New-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\OperationStatusManager" | Out-Null
                }
                Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\OperationStatusManager" -Name "EnthusiastMode" -Type DWord -Value 1
                Break
            }
            "Hide Task View Button" {
                Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowTaskViewButton" -Type DWord -Value 0
                Break
            }
            "Hide People Icon" {
                If (!(Test-Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People")) {
                    New-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" | Out-Null
                }
                Break
            }
            "Show All Tray Icons" {
                Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" -Name "EnableAutoTray" -Type DWord -Value 0
                Break
            }
            "Enable NumLock After Startup" {
                If (!(Test-Path "HKU:")) {
                    New-PSDrive -Name HKU -PSProvider Registry -Root HKEY_USERS | Out-Null
                }
                Set-ItemProperty -Path "HKU:\.DEFAULT\Control Panel\Keyboard" -Name "InitialKeyboardIndicators" -Type DWord -Value 2147483650
                Add-Type -AssemblyName System.Windows.Forms
                If (!([System.Windows.Forms.Control]::IsKeyLocked('NumLock'))) {
                    $wsh = New-Object -ComObject WScript.Shell
                    $wsh.SendKeys('{NUMLOCK}')
                }
                Break
            }
            "Change Default Explorer View to This PC" {
                Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "LaunchTo" -Type DWord -Value 1
                Break
            }
            "Disable Edge PDF Viewer" {
                # Identify the edge application class
                $Packages = "HKCU:SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\Repository\Packages"
                $edge = Get-ChildItem $Packages -Recurse -include "MicrosoftEdge"

                # Specify the paths to the file and URL associations
                $FileAssocKey = Join-Path $edge.PSPath Capabilities\FileAssociations
                $URLAssocKey = Join-Path $edge.PSPath Capabilities\URLAssociations

                # get the software classes for the file and URL types that Edge will associate
                $FileTypes = Get-Item $FileAssocKey
                $URLTypes = Get-Item $URLAssocKey

                $FileAssoc = Get-ItemProperty $FileAssocKey
                $URLAssoc = Get-ItemProperty $URLAssocKey

                $Associations = @()
                $Filetypes.Property | ForEach-Object { $Associations += $FileAssoc.$_ }
                $URLTypes.Property | ForEach-Object { $Associations += $URLAssoc.$_ }

                foreach ($Association in $Associations) {
                    $Class = Join-Path HKCU:SOFTWARE\Classes $Association
                    Set-ItemProperty $Class -Name NoOpenWith -Value ""
                    Set-ItemProperty $Class -Name NoStaticDefaultVerb -Value ""
                }
                Break
            }
            "Remove Paint3D" {
                Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" -Recurse -ErrorAction SilentlyContinue
                $Paint3Dstuff = @(
                    "HKCR:\SystemFileAssociations\.3mf\Shell\3D Edit"
                    "HKCR:\SystemFileAssociations\.bmp\Shell\3D Edit"
                    "HKCR:\SystemFileAssociations\.fbx\Shell\3D Edit"
                    "HKCR:\SystemFileAssociations\.gif\Shell\3D Edit"
                    "HKCR:\SystemFileAssociations\.jfif\Shell\3D Edit"
                    "HKCR:\SystemFileAssociations\.jpe\Shell\3D Edit"
                    "HKCR:\SystemFileAssociations\.jpeg\Shell\3D Edit"
                    "HKCR:\SystemFileAssociations\.jpg\Shell\3D Edit"
                    "HKCR:\SystemFileAssociations\.png\Shell\3D Edit"
                    "HKCR:\SystemFileAssociations\.tif\Shell\3D Edit"
                    "HKCR:\SystemFileAssociations\.tiff\Shell\3D Edit"
                )
                #Rename reg key to remove it, so it's revertible
                foreach ($Paint3D in $Paint3Dstuff) {
                    If (Test-Path $Paint3D) {
                        $rmPaint3D = $Paint3D + "_"
                        Set-Item $Paint3D $rmPaint3D
                    }
                }
                Break
            }
            "Enable Windows Media Player" {
                Enable-WindowsOptionalFeature -Online -FeatureName "WindowsMediaPlayer" -NoRestart -WarningAction SilentlyContinue | Out-Null
                Break
            }
        }
        Write-Host " OK!"
    }

    # Install Apps
    if ($InstalledAppList.CheckedItems.Count -gt 0) {
        Write-Host "Installing Chocolatey..." -NoNewline
        Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
        Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex
        choco upgrade
        choco install chocolatey-core.extension -y
        Write-Host " OK!"
    }
    foreach ($App in $InstalledAppList.CheckedItems) {
        if ($App.StartsWith("#")) {
            Continue
        }
        Write-Host "Install $App..." -NoNewline
        choco install $App -y
        Write-Host " OK!"
    }

    $startButton.Enabled = $true
    $wshell.Popup("Operation Completed", 0, "Done", 0x0)
}

[void]$Form.ShowDialog()
