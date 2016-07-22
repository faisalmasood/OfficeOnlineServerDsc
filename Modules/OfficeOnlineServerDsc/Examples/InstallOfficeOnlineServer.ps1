﻿Configuration InstallOOS
{
    Import-DscResource -ModuleName OfficeOnlineServerDsc

    node localhost
    {
        WindowsFeature Web-Server
        {
            Name = 'Web-Server'
            Ensure = 'Present'
        }

        WindowsFeature Web-Asp-Net45
        {
            Name = 'Web-Asp-Net45'
            Ensure = 'Present'
        }

        OfficeOnlineServerInstall Install
        {
            Path = 'C:\InstallBits\Setup.exe'
            DependsOn = '[WindowsFeature]Web-Server','[WindowsFeature]Web-Asp-Net45'
        }
    }
}

InstallOOS -OutputPath C:\DSC

Start-DscConfiguration -Path C:\DSC -Force -Wait -Verbose

