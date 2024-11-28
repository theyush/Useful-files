@echo off
set root=F:\OOOOO\man\00
for /r "%root%" %%d in (*) do move "%%d" "%root%"
