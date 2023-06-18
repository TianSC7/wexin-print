@echo off
chcp 65001
cls
setlocal enabledelayedexpansion
title 微信打印机
set ss=1
copy 5.txt 启动日志备份.txt

:date
echo date>bug.txt
echo 系统启动>5.txt
echo %date% %time%>>5.txt
echo ------ >>5.txt
echo 运行日志：>>5.txt
for /f "skip=1 delims=" %%i in (5.txt) do (
set z=%%i 
goto 0901
)

:0901
echo 0901 >>bug.txt
echo %z%
set year=%z:~3,4%
set mou=%z:~8,2%
goto 01

:777
echo 777 >>bug.txt
rem在dir处修改你的微信路径

:01
echo 01 >>bug.txt
echo 自动生成的文件>2.txt
dir D:\weixin\"WeChat Files"\wxid_2ojdevm5vq8o22\FileStorage\File\%year%^-^%mou% /A-D /b /o-d >>2.txt
echo end>>2.txt
set c=1
set p=1

:获取文件名称
:02
echo 02 >>bug.txt
for /f "skip=%c% delims=" %%i in (2.txt) do (
set a=%%i 
goto 03
)

:检测pdf
:03
echo 03 >bug.txt
set y="%a%"
set /a c=%c%+1
set d=%a:~-4%
if %d%==end goto 05
echo 【%a%】正在被检测
if %d%==pdf goto 04
echo 【%a%】检测不通过，将检测下一个文件
goto 02

:04
echo 04 >>bug.txt
for /f "skip=%p% delims=" %%i in (7.txt) do (
set b=%%i 
goto 0401
)

:0401
echo 0401 >>bug.txt
set g="%b%"
echo 【%a%】正在重复打印检测...
if %y%==%g% goto 02
set f=%b:~-4%
if %f%==end goto 0402
set /a p=%p%+1
goto 04


:888
echo 888 >>bug.txt
rem 在下方move处修改你的微信路径

:0402
echo 0402 >>bug.txt
echo %date% %time% >>9.txt
echo 文件[%a%]被移动到file >>9.txt
attrib -s -r D:\weixin\"WeChat Files"\wxid_2ojdevm5vq8o22\FileStorage\File\2023^-^%mou%\%y%
attrib -s -r %~dp0\file\%y%
echo 
del %~dp0\file\%y%
del %~dp0file\%y%
move D:\weixin\"WeChat Files"\wxid_2ojdevm5vq8o22\FileStorage\File\2023^-^%mou%\%y% %~dp0\file\
goto 0403

:0403
echo 0403 >>bug.txt
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
timeout /t 10

:05
echo 05 >>bug.txt
timeout /t 1 >nul
echo ----------------------
timeout /t 1 >nul
echo %date% %time%
timeout /t 1 >nul
echo ----------------------
timeout /t 1 >nul
echo 任务循环完成一次；将自动刷新循环...
echo %date% %time% 微信打印机系统已正常运行【%ss%】次>>5.txt
set /a ss=%ss%+1
timeout /t 1 >nul
cls
type 9.txt
timeout /t 1 >nul
cls
goto 01
