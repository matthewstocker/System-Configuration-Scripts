# Iron's Zorin Script

Setting up Zorin to play games and other apps.

## What does this script do?

It does the following:

- Downloads and installs Discord
- Downloads and installs Lutris
- Downloads and installs Steam
- Installs default JRE (Java Runtime Environment)
- Adds OBS PPA and installs latest version
- Adds XIVLauncher PPA and installs latest version
- Installs PokeMMO client (via Flatpak)
- Installs Cartridges (via Flatpak)

The script creates a folder called `Installers` in your home directory for it to store the latest installers.  Once the script has finished, this folder is then removed.

## How to run

1. Load up a terminal window
2. Run the following command in a Terminal to download and run the config script\
   `curl https://raw.githubusercontent.com/matthewstocker/System-Configuration-Scripts/main/Irons%20Zorin%2018/zorin-gaming-config.sh | bash`
3. Follow the script through to completion.
4. You will get a window pop up about Steam, click on **Start Steam** button.
   ![Press start steam](https://github.com/matthewstocker/System-Configuration-Scripts/blob/main/Irons%20Zorin%2018/img/steam1.png)
5. You will then get a terminal pop up:
   ![](https://github.com/matthewstocker/System-Configuration-Scripts/blob/main/Irons%20Zorin%2018/img/steam2.png)
   Press Enter to allow the updates to take place (you may get asked to enter your password here).
6. It will then ask you to install some packages:
   ![](https://github.com/matthewstocker/System-Configuration-Scripts/blob/main/Irons%20Zorin%2018/img/steam3.png)
   Press enter to install the needed packages.
7. Enjoy!

## Testing

This was tested on a fresh VM installation of Zorin 18 with all latest updates inside Oracle VirtualBox hosted on Windows 11 Pro.

## Issues?

Please create an issue in GitHub and I'll take a look!

## License

MIT License

Copyright (c) 2025 Matt Stocker

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
