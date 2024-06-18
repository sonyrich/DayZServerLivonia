@echo off
:start
::Server name (This is just for the bat file)
set serverName=Private Life
::Server files location
set serverLocation="E:\SteamLibrary\steamapps\common\DayZServer"
::Server Port
set serverPort=2302
::Server config
set serverConfig=serverDZ.cfg
::Logical CPU cores to use (Equal or less than available)
set serverCPU=4
::Sets title for terminal (DONT edit)
title %serverName% batch
::DayZServer location (DONT edit)
cd "%serverLocation%"
echo (%time%) %serverName% started.
::Launch parameters (edit end: -config=|-port=|-profiles=|-doLogs|-adminLog|-netLog|-freezeCheck|-filePatching|-BEpath=|-cpuCount=)
start "DayZ Server" /min "DayZServer_x64.exe" -config=%serverConfig% -port=%serverPort% "-profiles=config" -limitFPS=30 "-mod=mods\@CF;mods\@DF;mods\@DayZ-Expansion-Licensed;mods\@DayZ-Expansion-Bundle;mods\@DayZ-Expansion-Animations;mods\@VPPAdminTools;mods\@Pristine-Repair;mods\@Combinable-RepairKits;mods\@Arma-2-Helicopters;mods\@SNAFU;mods\@AmmoStackBullet;mods\@Repack-Ammo;mods\@InventoryInCar;mods\@Ambient-Animals-Pack;mods\@Better-Medical-Pouch;mods\@BaseBuildingPlus;" -cpuCount=%serverCPU% -freezecheck
::Time in seconds before kill server process (14400 = 4 hours, 10800 = 3hrs)
timeout 14400
taskkill /im DayZServer_x64.exe /F
::Time in seconds to wait before..
timeout 10
::Go back to the top and repeat the whole cycle again
goto start
