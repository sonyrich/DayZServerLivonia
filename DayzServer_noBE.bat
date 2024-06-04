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
set serverCPU=6
::Sets title for terminal (DONT edit)
title %serverName% batch
::DayZServer location (DONT edit)
cd "%serverLocation%"
echo (%time%) %serverName% started.
::Launch parameters (edit end: -config=|-port=|-profiles=|-doLogs|-adminLog|-netLog|-freezeCheck|-filePatching|-BEpath=|-cpuCount=)
start "DayZ Server" /min "DayZServer_x64_noBE.exe" -config=%serverConfig% -port=%serverPort% "-profiles=config" "-mod=@CF;@Dabs Framework;@Trader;@DayZ-Expansion-Core;@DayZ-Expansion-Animations;@DayZ-Expansion-Licensed;@DayZ-Expansion-Book;@DayZ-Expansion-Vehicles;@DayZ-Expansion-Navigation;@DayZ-Expansion-Groups;@VPPAdminTools;@ZomBerry Admin Tools;@WSP-TraderLayout;@PristineRepair;@BaseBuildingPlus;@BBPItemPack;@Craft Gun Cleaning Kit;@SNAFU Weapons;@Tactical Flava;@Repack Ammo;@Furniture Kits;@MuchStuffPack;@Better Medical Pouch;@RUSForma_vehicles;@Arma 2 Helicopters Remastered;@FlipTransport;@Gas-Pump-Refueling;@InventoryInCar;" -cpuCount=%serverCPU% -limitFPS=60 -freezecheck
::Time in seconds before kill server process (14400 = 4 hours, 10800 = 3hrs)
timeout 14400
taskkill /im DayZServer_x64_noBE.exe /F
::Time in seconds to wait before..
timeout 10
::Go back to the top and repeat the whole cycle again
goto start
