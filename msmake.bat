@echo off
chcp 65001

setlocal enabledelayedexpansion


REM 设置文档主文件名和输出目录
set "CURRENTDIR=%CD%"
set OUTDIR=build

REM 创建输出目录

if exist "%OUTDIR%" (
  rd /s /q "%OUTDIR%"
) 
mkdir "%OUTDIR%"
mkdir "%OUTDIR%\subtex\common"
mkdir "%OUTDIR%\subtex\appendix"
mkdir "%OUTDIR%\subtex\master"


if "%~1"=="" (
  echo 编译整个文档
  set MAINFILE=paper
) else (
  echo 编译文件：%~1

  for %%i in ("%~1") do set "dirPath=%%~dpi"
  set "dirPath=!dirPath:~0,-1!"
  set "RELATIVEPATH=!dirPath:%CURRENTDIR%\=!"

  for %%i in ("%~1") do set MAINFILE=!RELATIVEPATH!\%%~ni
  
  latexmk -xelatex -interaction=nonstopmode -outdir="%OUTDIR%/!RELATIVEPATH!" "%~1" > "%OUTDIR%/!RELATIVEPATH!/%~n1_1.log" 2>&1 || goto ERROR
  goto SUCCESS
)



@REM REM 定义要并行编译的章节文件
@REM REM 遍历subtex目录下的一级目录中的.tex文件
@REM set "chapterCount=0"
@REM for %%f in (subtex\*.tex) do (
@REM   REM 添加到CHAPTERS变量
@REM   set "CHAPTERS=!CHAPTERS! %%f"
@REM   set /a chapterCount+=1
@REM )

@REM REM 编译各章节
@REM echo Compiling chapters in parallel...
@REM for %%f in (%CHAPTERS%) do (
@REM   set "FULLPATH=%%~dpf"
@REM   set "RELATIVEPATH=!FULLPATH:%CURRENTDIR%\=!"
@REM   set "RELATIVEPATH=!RELATIVEPATH:~0,-1!"
@REM   start /b cmd /c latexmk -xelatex -interaction=nonstopmode -outdir="%OUTDIR%" "%%f" ^> "%OUTDIR%\!RELATIVEPATH!\%%~nf_1.log" 2^>^&1 ^& echo done ^> "%OUTDIR%\%%~nf.done"
@REM )

@REM REM 等待所有并行任务完成
@REM <nul set /p ="Waiting" 
@REM :WAIT
@REM set "doneCount=0"
@REM for %%f in (%CHAPTERS%) do (
@REM     if exist "%OUTDIR%\%%~nf.done" (
@REM         set /a doneCount+=1
@REM     )
@REM )
@REM if %doneCount% neq %chapterCount% (
@REM     timeout /t 1 > nul
@REM     <nul set /p =".....%doneCount%/%chapterCount%....."
@REM     goto WAIT
@REM )
@REM echo All subtasks completed.

@REM for %%f in (%CHAPTERS%) do (
@REM   set "FILEPATH=%%~dpf"
@REM   set "RELATIVEPATH=!FILEPATH:%CURRENTDIR%\=!"
@REM   set "RELATIVEPATH=!RELATIVEPATH:~0,-1!"
@REM   set "FULLFILEPATH=!CURRENTDIR!\!OUTDIR!\%%~nf.pdf"
@REM   copy !FULLFILEPATH! !RELATIVEPATH!\%%~nf.pdf
@REM )


REM 编译主文档
echo Compiling main document...
latexmk -xelatex -interaction=nonstopmode -outdir="!OUTDIR!" "!MAINFILE!.tex" > "!OUTDIR!/!MAINFILE!_1.log" 2>&1 || goto ERROR

:SUCCESS
echo Compilation successful.
set FULLPATH=!CURRENTDIR!\!OUTDIR!\!MAINFILE!.pdf
copy !FULLPATH! !MAINFILE!.pdf
echo show pdf result
start /b cmd /c call %MAINFILE%.pdf 
goto END

REM 检查错误并提取错误信息
:ERROR: 
set "FULLPATH=%CURRENTDIR%\%OUTDIR%\%MAINFILE%.log"
echo Error(s) and Warning(s) found in log file: %FULLPATH%.
findstr /i /r /c:"Error" /c:"Warning" "%FULLPATH%"

:END
echo 结束编译
endlocal