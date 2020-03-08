$TERMINAL_CONFIG_PATH='C:\Users\'+$env:UserName+'\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\profiles.json'
$configFileContent = Get-Content $TERMINAL_CONFIG_PATH -raw
$configJson = $configFileContent -replace '(?m)(?<=^([^"]|"[^"]*")*)//.*' -replace '(?ms)/\*.*?\*/' | ConvertFrom-Json



#Add Scheme 
$oneHalfDarkSchemeJson = '{
      "name": "OneHalfDark",
      "black": "#282c34",
      "red": "#e06c75",
      "green": "#98c379",
      "yellow": "#e5c07b",
      "blue": "#61afef",
      "purple": "#c678dd",
      "cyan": "#56b6c2",
      "white": "#dcdfe4",
      "brightBlack": "#282c34",
      "brightRed": "#e06c75",
      "brightGreen": "#98c379",
      "brightYellow": "#e5c07b",
      "brightBlue": "#61afef",
      "brightPurple": "#c678dd",
      "brightCyan": "#56b6c2",
      "brightWhite": "#dcdfe4",
      "background": "#282c34",
      "foreground": "#dcdfe4"
    }' | ConvertFrom-Json

$purplepeterSchemeJson= '
{
  "name": "purplepeter",
  "black": "#0a0520",
  "red": "#ff796d",
  "green": "#99b481",
  "yellow": "#efdfac",
  "blue": "#66d9ef",
  "purple": "#e78fcd",
  "cyan": "#ba8cff",
  "white": "#ffba81",
  "brightBlack": "#100b23",
  "brightRed": "#f99f92",
  "brightGreen": "#b4be8f",
  "brightYellow": "#f2e9bf",
  "brightBlue": "#79daed",
  "brightPurple": "#ba91d4",
  "brightCyan": "#a0a0d6",
  "brightWhite": "#b9aed3",
  "background": "#2a1a4a",
  "foreground": "#ece7fa"
}' | ConvertFrom-Json

$configJson.schemes += $oneHalfDarkSchemeJson
$configJson.schemes += $purplepeterSchemeJson

#Add Key Bindings

$keyBindingsJson = '[
	{
      "command": "copy",
      "keys": [
        "ctrl+shift+c"
      ]
    },
    {
      "command": "paste",
      "keys": [
        "ctrl+shift+v"
      ]
    },
    {
      "command": "splitHorizontal",
      "keys": [ "alt+shift+h" ]
    },
    {
      "command": "splitVertical",
      "keys": [ "alt+shift+v" ]
    },
    {
      "command": {
        "action": "moveFocus",
        "direction": "down"
      },
      "keys": [ "alt+down" ]
    },
    {
      "command": {
        "action": "moveFocus",
        "direction": "left"
      },
      "keys": [ "alt+left" ]
    },
    {
      "command": {
        "action": "moveFocus",
        "direction": "right"
      },
      "keys": [ "alt+right" ]
    },
    {
      "command": {
        "action": "moveFocus",
        "direction": "up"
      },
      "keys": [ "alt+up" ]
    },
    {
      "command": {
        "action": "resizePane",
        "direction": "down"
      },
      "keys": [ "alt+shift+down" ]
    },
    {
      "command": {
        "action": "resizePane",
        "direction": "left"
      },
      "keys": [ "alt+shift+left" ]
    },
    {
      "command": {
        "action": "resizePane",
        "direction": "right"
      },
      "keys": [ "alt+shift+right" ]
    },
    {
      "command": {
        "action": "resizePane",
        "direction": "up"
      },
      "keys": [ "alt+shift+up" ]
    }]
' | ConvertFrom-Json

$configJson.keybindings += $keyBindingsJson


$ubuntuConfig = $configJson.profiles.list | Where-Object {$_.'name' -eq 'Ubuntu-18.04'} 
$ubuntuConfig.name += "❤️"
$ubuntuConfig |  Add-Member -Type NoteProperty -Name 'fontFace' -Value 'DejaVu Sans Mono for Powerline'
$ubuntuConfig |  Add-Member -Type NoteProperty -Name 'fontSize' -Value 10
$ubuntuConfig |  Add-Member -Type NoteProperty -Name 'padding' -Value '0, 0, 0, 0'
$ubuntuConfig |  Add-Member -Type NoteProperty -Name 'colorScheme' -Value 'purplepeter'
$ubuntuConfig |  Add-Member -Type NoteProperty -Name 'useAcrylic' -Value $true
$ubuntuConfig |  Add-Member -Type NoteProperty -Name 'acrylicOpacity' -Value 0.8


#Save new config file.
$TERMINAL_CONFIG_OUT_PATH='C:\Users\'+$env:UserName+'\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\profiles.json'

$configJson | ConvertTo-Json -depth 32| set-content $TERMINAL_CONFIG_OUT_PATH

wget https://github.com/powerline/fonts/archive/master.zip -o fonts.zip
Expand-Archive -LiteralPath fonts.zip -DestinationPath fonts -Force
#.\fonts\fonts-master\install.ps1


