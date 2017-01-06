# To reload profile in an active terminal
# . $profile

##PATH
$env:Path += ";C:\dev\bin\git\bin\"

#################################################
# Functions
#
# Implement the functionality of the unix touch command
# http://superuser.com/questions/502374/equivalent-of-linux-touch-to-create-an-empty-file-with-powershell
# Answer by LittleBoyLost
Function Touch-File
{
    $file = $args[0]
    if($file -eq $null) {
        throw "No filename supplied"
    }

    if(Test-Path $file) {
		#File exists, so update date
        (Get-ChildItem $file).LastWriteTime = Get-Date
    }
    else {
        echo $null > $file
    }
}

# http://windows-powershell-scripts.blogspot.co.uk/2009/07/cd-change-to-previous-working-directory.html
# Original code modified based on comments on page
# Used to change to previous directory
Function cd_dash 
{
    if ($args[0] -eq '-') {
        $pwd=$previous_directory;
    } else {
        $pwd=$args[0];
    }
    
    $tmp=pwd;
    
    if ($pwd) {
        Set-Location $pwd;
    }
    
    Set-Variable -Name previous_directory -Value $tmp -Scope global;
}

# http://stackoverflow.com/questions/63805/equivalent-of-nix-which-command-in-powershell
# Reponse from Eld
Function which($name)
{
    Get-Command $name | Select-Object -ExpandProperty Definition
}

Function ls-Force($args)
{
	ls -Force $args
}

# Function Aliases
Set-Alias touch Touch-File
Set-Alias cd cd_dash -Option AllScope
Set-Alias la ls-Force

#Folder aliases
Function cd_src { cd c:\dev\src }
Set-Alias src cd_src

##Application Aliases
Set-Alias chrome "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
Set-Alias npp "C:\dev\bin\notepad++\notepad++.exe"
Set-Alias charm "C:\dev\bin\jetbrains\PyCharm 2016.3.2\bin\pycharm.exe"