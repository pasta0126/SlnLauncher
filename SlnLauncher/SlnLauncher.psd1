@{
    RootModule        = 'SlnLauncher.psm1'
    ModuleVersion     = '0.1.0'
    GUID              = 'fd87aaab-d7e2-5182-ba7d-c2ae0f791088'
    Author            = 'pasta0126'
    CompanyName       = 'More Than Void Company'
    Copyright         = '(c) pasta0126. All rights reserved.'
    Description       = 'Open the first (or selected) Visual Studio solution (.sln) found under the current directory.'
    PowerShellVersion = '5.1'

    FunctionsToExport = @('sln')
    CmdletsToExport   = @()
    VariablesToExport = @()
    AliasesToExport   = @()

    PrivateData = @{
        PSData = @{
            Tags       = @('visualstudio','sln','productivity','developer')
            LicenseUri = 'https://github.com/pasta0126/SlnLauncher/blob/main/LICENSE'
            ProjectUri = 'https://github.com/pasta0126/SlnLauncher'
            ReleaseNotes = 'Initial release.'
        }
    }
}
