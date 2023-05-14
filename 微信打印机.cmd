@echo off
chcp 65001
cls
setlocal enabledelayedexpansion
title 微信打印机

:date
echo 系统启动>5.txt
echo %date% %time%>>5.txt
echo ------ >>5.txt
echo 微信打印机系统被启动>>5.txt
for /f "skip=1 delims=" %%i in (5.txt) do (
set z=%%i 
goto 0901
)

:0901
echo %z%
set year=%z:~3,4%
set mou=%z:~8,2%
goto 01

:777
rem在dir处修改你的微信路径

:01
echo 自动生成的文件>2.txt
dir D:\weixin\"WeChat Files"\wxid_2ojdevm5vq8o22\FileStorage\File\%year%^-^%mou% /A-D /b /o-d >>2.txt
echo end>>2.txt
set c=1
set p=1

:获取文件名称
:02
for /f "skip=%c% delims=" %%i in (2.txt) do (
set a=%%i 
goto 03
)

:检测pdf
:03
set y="%a%"
set /a c=%c%+1
set d=%a:~-4%
if %d%==end goto 05
echo 【%a%】正在被检测
if %d%==pdf goto 04
echo 【%a%】检测不通过，将检测下一个文件
goto 02

:04
for /f "skip=%p% delims=" %%i in (7.txt) do (
set b=%%i 
goto 0401
)

:0401
set g="%b%"
echo 【%a%】正在重复打印检测...
if %y%==%g% goto 02
set f=%b:~-4%
if %f%==end goto 0402
set /a p=%p%+1
goto 04


:888
rem 在下方move处修改你的微信路径

:0402
echo %date% %time% >>9.txt
echo 文件[%a%]被移动到file >>9.txt
move /y D:\weixin\"WeChat Files"\wxid_2ojdevm5vq8o22\FileStorage\File\2023^-^05\%y% %~dp0/file
goto 0403

:0403
echo 文件[%a%]开始打印 >>9.txt
echo chcp 65001 >6.cmd
echo echo off >>6.cmd
echo title 打印机 >>6.cmd
echo %~dp0/bin/SumatraPDF.exe %~dp0/file/%y% -print-to-default -silent -print-settings "paper=A4" >>6.cmd
echo cls >>6.cmd
echo echo 正在打印【%a%】，三秒后自动退出 >>6.cmd
echo timeout /t 3 >>6.cmd
echo exit >>6.cmd
start 6.cmd
echo 文件[%a%]打印结束！ >>9.txt
echo --- >>9.txt
echo %a% >>07.txt
copy 07.txt 7.txt
echo end>>7.txt
echo 等待文件【%a%】打印完成...
timeout /t 5

:05
echo ----------------------
echo %date% %time%
echo ----------------------
echo 任务循环完成一次；等待循环...
timeout /t 5
cls
goto 01
