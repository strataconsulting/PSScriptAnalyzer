FROM mcr.microsoft.com/powershell:lts-debian-buster-slim

SHELL [ "pwsh", "-Command" ]

RUN \
    # Sets values for a registered module repository
    Set-PSRepository \
      -ErrorAction Stop           <# Action to take if a command fails #> \
      -InstallationPolicy Trusted <# Installation policy (Trusted, Untrusted) #> \
      -Name PSGallery             <# Name of the repository #> \
      -Verbose;                   <# Write verbose output #> \
    # Install PSScriptAnalyzer module (https://github.com/PowerShell/PSScriptAnalyzer/tags)
    Install-Module \
      -ErrorAction Stop \
      -Name PSScriptAnalyzer    <# Name of modules to install from the online gallery #> \
      -RequiredVersion 1.21.0   <# Exact version of a single module to install #> \
      -Verbose;

# Switch back to the default Linux shell as we are using a Linux Docker image for now
SHELL [ "/bin/sh" , "-c" ]
