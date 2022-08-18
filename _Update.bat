@ECHO off

echo Updating server...
cd _steamcmd
steamcmd.exe +force_install_dir ../ +login anonymous +app_update 258550 +quit
CLS
cd ..
echo Updating Oxide...
powershell.exe -Command "Invoke-WebRequest -OutFile ./_oxide.zip https://github.com/OxideMod/Oxide.Rust/releases/latest/download/Oxide.Rust.zip
powershell.exe "Add-Type -A 'System.IO.Compression.FileSystem';[IO.Compression.ZipFile]::ExtractToDirectory('%cd%\_oxide.zip', '%cd%\_tmp');"
XCOPY /s /y /v /i "%cd%\_tmp" "%cd%"
RD /s /q "%cd%\_tmp"
del _oxide.zip