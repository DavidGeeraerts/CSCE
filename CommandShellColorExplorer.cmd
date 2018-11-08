:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: SCRIPT NAME: Command Shell Color Explorer (CSCE)
::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: AUTHOR:   David Geeraerts
:: EMAIL:    dgeeraerts@gmail.com
:: LOCATION: Washington, USA
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Copyleft License
:: GNU GPL (General Public License)
:: https://www.gnu.org/licenses/gpl-3.0.en.html
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: VERSIONING INFORMATION
::  Semantic Versioning used
::   http://semver.org/
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: Google Document for Color Class {Best, Good, Marginal, Solid, Error}
::  https://docs.google.com/spreadsheets/d/14ho87WWlhbCRwXCLPEg0KN5xOV1tJV6oW8liqwK_pxE/edit?usp=sharing

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@Echo Off
setlocal enableextensions
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

SET "SCRIPT_NAME=Command Shell Color Explorer (CSCE)"
SET SCRIPT_VERSION=2.4.0

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Title %SCRIPT_NAME% %SCRIPT_VERSION%
:: mode con:cols=50 lines=40
Prompt CSCE$G
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


::###########################################################################::
:: Declare Global variables as Defaults
::  configuration file will override all default settings
:: All User variables are set within here.
::###########################################################################::

::	Timeout in seconds
SET ts=10
:: Process Timeout in seconds
SET PS=2

::	Random Variables
SET iterations=5
SET Counter=0


:: Text statement [DEFAULT]
SET "STATEMENT="Cast your gaze upon the capital of your empire, and you will find two classes of citizens. The one, glutted with riches, displays an opulence which offends those it does not corrupt; the other, mired in destitution, worsens its condition by wearing a mask of posterity which it does not possess: for such is the power of gold (when it is become the god of a nation, stand in the stead of all talent, takes the place of every virtue) that one must either have wealth or feign to have it." L'Histoire philosophique et politique des établissements et du commerce des Européens dans les deux Indes ~1770"

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::																			 ::
::##### Everything below here is 'hard-coded' [DO NOT MODIFY] #####			 ::
::																			 ::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

::	color Codes and common Names
((SET cColor0=0) & (SET nColor0=Black))
((SET cColor1=1) & (SET nColor1=Blue))
((SET cColor2=2) & (SET nColor2=Green))
((SET cColor3=3) & (SET nColor3=Aqua))
((SET cColor4=4) & (SET nColor4=Red))
((SET cColor5=5) & (SET nColor5=Purple))
((SET cColor6=6) & (SET nColor6=Yellow))
((SET cColor7=7) & (SET nColor7=White))
((SET cColor8=8) & (SET nColor8=Gray))
((SET cColor9=9) & (SET "nColor9=Light Blue"))
((SET cColorA=A) & (SET "nColorA=Light Green"))
((SET cColorB=B) & (SET "nColorB=Light Aqua"))
((SET cColorC=C) & (SET "nColorC=Light Red"))
((SET cColorD=D) & (SET "nColorD=Light Purple"))
((SET cColorE=E) & (SET "nColorE=Light Yellow"))
((SET cColorF=F) & (SET "nColorF=Bright White"))

:: Possible color configuration with given characters
SET "Color=0 1 2 3 4 5 6 7 8 9 A B C D E F"
SET Color1=NotSet
SET Color2=NotSet
SET cnColor1=NotSet
SET cnColor2=NotSet
::	Color Set
SET sColor=%Color1%%Color2%

::	Random Variables
SET /A Remaining=%iterations%-%Counter%

SET COLOR_CLASS=BEST,GOOD,MARGINAL,SOLID,ERROR

SET BESTCOLORS=07 0A 0B 0C 0D 0E 0F 17 1A 1B 1C 1D 1E 1F 2A 2B 2F 37 3A 3B 3E 3F 47 4E 4F 5E 5F 60 6A 6B 6E 6F 70 71 72 73 74 75 79 7F 80 81 87 8A 8B 8E 8F 9B 9E 9F A0 B0 C0 CF D0 E0 E1 E4 F0 F1 F2 F3 F4 F5 F9 FC
IF EXIST "%~dp0\BEST_COLORS.txt" SET /P BESTCOLORS= < "%~dp0\BEST_COLORS.txt"
:: Good colors
SET GOODCOLORS=02 03 06 08 12 13 16 18 20 21 30 48 4A 4B 4C 4D 57 5A 5B 5C 5D 64 65 67 69 76 78 7C 7E 84 85 89 97 9A 9D A1 A2 A3 A4 A5 A6 A8 A9 B1 B2 B3 B4 B5 B6 B8 B9 C1 C9 CE D1 D9 DE DF E2 E3 E5 E6 E8 E9 EC ED F6 F8 FD
IF EXIST "%~dp0\GOOD_COLORS.txt" SET /P GOODCOLORS= < "%~dp0\GOOD_COLORS.txt"
:: Marginal Colors
SET MARGINALCOLORS=04 05 09 14 15 24 25 26 27 28 29 2C 2D 2E 31 34 35 36 38 39 3C 3D 40 41 42 43 46 49 50 51 53 56 58 59 61 62 63 6C 6D 7A 7B 7D 82 83 8C 8D 90 91 96 98 9C AC AD AE AF B7 BC BD BF C2 C3 C4 C5 C6 C7 C8 CA CB D2 D3 D4 D5 D6 D8 DA DB E7 EA EB F7 FA FB
IF EXIST "%~dp0\MARGINAL_COLORS.txt" SET /P MARGINALCOLORS= < "%~dp0\MARGINAL_COLORS.txt"
:: These are bad color combinations
SET SOLIDCOLORS=01 10 19 23 32 45 52 54 68 86 92 93 94 95 A7 AB BA BE CD D7 DC EF FE
IF EXIST "%~dp0\SOLID_COLORS.txt" SET /P SOLIDCOLORS= < "%~dp0\SOLID_COLORS.txt"
:: Colors that produce an errorlevel 1
SET ERRORCOLORS=00 11 22 33 44 55 66 77 88 99 AA BB CC DD EE FF

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Custom Statement in a text file
IF EXIST "%~dp0\statement.txt" SET /P STATEMENT= < "%~dp0\statement.txt"
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
mode con:cols=52 lines=20
:: Even though it looks awkward in the editor its formatted correctly for the screen.
Echo  #########################################
Echo  #  %SCRIPT_NAME%  #
Echo  #  Version=%SCRIPT_VERSION%                        #
Echo  #########################################
ECHO.
ECHO Best: Awsome color combintation!
ECHO Good: Good color combination.
ECHO Marginal: Not very readable, poor color combination.
ECHO Solid: Color combo produces nearly a solid color.
ECHo Error: color combo not visible.
ECHO.
SET COLOR_CLASS_POSITION=1
:loop 
IF %COLOR_CLASS_POSITION% EQU 1 SET COLOR_COUNT=%BESTCOLORS%
IF %COLOR_CLASS_POSITION% EQU 2 SET COLOR_COUNT=%GOODCOLORS%
IF %COLOR_CLASS_POSITION% EQU 3 SET COLOR_COUNT=%MARGINALCOLORS%
IF %COLOR_CLASS_POSITION% EQU 4 SET COLOR_COUNT=%SOLIDCOLORS%
IF %COLOR_CLASS_POSITION% EQU 5 SET COLOR_COUNT=%ERRORCOLORS%

FOR /F "tokens=%COLOR_CLASS_POSITION% delims=," %%P IN ("%COLOR_CLASS%") DO (SET COLOR_CLASS_SEARCH=%%P)
ECHO Processing %COLOR_CLASS_SEARCH% colors...
:: Count the 0's
ECHO "%COLOR_COUNT%" | (FIND "00" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "01" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "02" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "03" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "04" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "05" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "06" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "07" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "08" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "09" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "0A" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "0B" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "0C" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "0D" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "0E" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "0F" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
:: Count the 1's
ECHO "%COLOR_COUNT%" | (FIND "10" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "11" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "12" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "13" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "14" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "15" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "16" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "17" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "18" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "19" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "1A" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "1B" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "1C" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "1D" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "1E" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "1F" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
:: Count the 2's
ECHO "%COLOR_COUNT%" | (FIND "20" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "21" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "22" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "23" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "24" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "25" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "26" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "27" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "28" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "29" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "2A" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "2B" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "2C" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "2D" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "2E" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "2F" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
:: Count the 3's
ECHO "%COLOR_COUNT%" | (FIND "30" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "31" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "32" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "33" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "34" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "35" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "36" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "37" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "38" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "39" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "3A" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "3B" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "3C" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "3D" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "3E" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "3F" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
:: Count the 4's
ECHO "%COLOR_COUNT%" | (FIND "40" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "41" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "42" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "43" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "44" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "45" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "46" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "47" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "48" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "49" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "4A" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "4B" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "4C" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "4D" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "4E" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "4F" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
:: Count 5's
ECHO "%COLOR_COUNT%" | (FIND "50" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "51" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "52" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "53" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "54" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "55" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "56" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "57" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "58" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "59" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "5A" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "5B" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "5C" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "5D" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "5E" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "5F" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
:: Count 6's
ECHO "%COLOR_COUNT%" | (FIND "60" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "61" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "62" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "63" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "64" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "65" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "66" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "67" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "68" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "69" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "6A" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "6B" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "6C" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "6D" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "6E" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "6F" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
:: ECHO Count 7's
ECHO "%COLOR_COUNT%" | (FIND "70" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "71" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "72" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "73" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "74" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "75" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "76" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "77" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "78" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "79" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "7A" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "7B" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "7C" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "7D" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "7E" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "7F" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
:: ECHO Count 8's
ECHO "%COLOR_COUNT%" | (FIND "80" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "81" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "82" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "83" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "84" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "85" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "86" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "87" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "88" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "89" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "8A" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "8B" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "8C" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "8D" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "8E" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "8F" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
:: ECHO Count 9's
ECHO "%COLOR_COUNT%" | (FIND "90" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "91" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "92" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "93" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "94" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "95" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "96" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "97" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "98" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "99" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "9A" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "9B" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "9C" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "9D" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "9E" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "9F" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
:: ECHO Count A's
ECHO "%COLOR_COUNT%" | (FIND "A0" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "A1" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "A2" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "A3" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "A4" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "A5" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "A6" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "A7" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "A8" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "A9" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "AA" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "AB" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "AC" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "AD" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "AE" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "AF" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
:: ECHO Count B's
ECHO "%COLOR_COUNT%" | (FIND "B0" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "B1" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "B2" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "B3" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "B4" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "B5" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "B6" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "B7" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "B8" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "B9" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "BA" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "BB" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "BC" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "BD" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "BE" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "BF" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
:: ECHO Count C's
ECHO "%COLOR_COUNT%" | (FIND "C0" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "C1" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "C2" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "C3" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "C4" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "C5" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "C6" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "C7" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "C8" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "C9" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "CA" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "CB" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "CC" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "CD" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "CE" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "CF" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
:: ECHO Count D's
ECHO "%COLOR_COUNT%" | (FIND "D0" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "D1" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "D2" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "D3" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "D4" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "D5" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "D6" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "D7" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "D8" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "D9" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "DA" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "DB" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "DC" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "DD" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "DE" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "DF" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
:: ECHO Count E's
ECHO "%COLOR_COUNT%" | (FIND "E0" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "E1" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "E2" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "E3" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "E4" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "E5" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "E6" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "E7" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "E8" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "E9" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "EA" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "EB" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "EC" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "ED" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "EE" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "EF" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
:: ECHO Count F's
ECHO "%COLOR_COUNT%" | (FIND "F0" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "F1" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "F2" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "F3" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "F4" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "F5" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "F6" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "F7" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "F8" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "F9" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "FA" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "FB" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "FC" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "FD" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "FE" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
ECHO "%COLOR_COUNT%" | (FIND "FF" >nul 2>nul) && SET /A COLOR_COUNTER_TOTAL+=1
:: What's the final total
SET COLOR_COUNTER_TOTAL_%COLOR_CLASS_SEARCH%=%COLOR_COUNTER_TOTAL%
SET COLOR_COUNTER_TOTAL=0
SET /A COLOR_CLASS_POSITION+=1
IF %COLOR_CLASS_POSITION% LSS 6 GoTo loop

:: ECHO COLOR_COUNTER_TOTAL_BEST: %COLOR_COUNTER_TOTAL_BEST%
:: ECHO COLOR_COUNTER_TOTAL_GOOD: %COLOR_COUNTER_TOTAL_GOOD%
:: ECHO COLOR_COUNTER_TOTAL_MARGINAL: %COLOR_COUNTER_TOTAL_MARGINAL%
:: ECHO COLOR_COUNTER_TOTAL_SOLID: %COLOR_COUNTER_TOTAL_SOLID%
:: ECHO COLOR_COUNTER_TOTAL_ERROR: %COLOR_COUNTER_TOTAL_ERROR%


:Intro
cls
mode con:cols=51 lines=49
::Default
IF DEFINED BACKGROUND_COLOR IF DEFINED TEXT_COLOR (COLOR %BACKGROUND_COLOR%%TEXT_COLOR%) ELSE (Color 8F)
Echo  #########################################
Echo  #  %SCRIPT_NAME%  #
Echo  #  Version=%SCRIPT_VERSION%                        #
Echo  #########################################
Echo.
Echo *************************************************
Echo     Location: Intro
Echo *************************************************
Echo.
Echo Explore (almost) every possible color combination for the command shell --Can't use Error colors {00, 11, 22, AA, ...}.
Echo.
IF DEFINED BACKGROUND_COLOR IF DEFINED TEXT_COLOR ECHO Current color: %BACKGROUND_COLOR%%TEXT_COLOR%
ECHO ------------------------------------
IF DEFINED BACKGROUND_COLOR IF DEFINED TEXT_COLOR IF DEFINED mColorB Echo Background: %mColorB%
IF DEFINED BACKGROUND_COLOR IF DEFINED TEXT_COLOR IF DEFINED mColorT Echo Text      : %mColorT%
ECHO ------------------------------------

SET /A COLOR_USABLE_TOTALS=%COLOR_COUNTER_TOTAL_BEST%+%COLOR_COUNTER_TOTAL_GOOD%
ECHO Usuable Combinations: %COLOR_USABLE_TOTALS%
SET /A COLOR_UNUSABLE_TOTALS=%COLOR_COUNTER_TOTAL_MARGINAL%+%COLOR_COUNTER_TOTAL_SOLID%+%COLOR_COUNTER_TOTAL_ERROR%
ECHO Unusuable Combinations: %COLOR_UNUSABLE_TOTALS%
SET /A COLOR_TOTALS=%COLOR_COUNTER_TOTAL_BEST%+%COLOR_COUNTER_TOTAL_GOOD%+%COLOR_COUNTER_TOTAL_MARGINAL%+%COLOR_COUNTER_TOTAL_SOLID%+%COLOR_COUNTER_TOTAL_ERROR%
Echo Total Combinations: %COLOR_TOTALS%
ECHO ------------------------------------
ECHO   # Best Colors: %COLOR_COUNTER_TOTAL_BEST%
ECHO   # Good Colors: %COLOR_COUNTER_TOTAL_GOOD%
ECHO   # Marginal Colors: %COLOR_COUNTER_TOTAL_MARGINAL%
ECHO   # Solid: %COLOR_COUNTER_TOTAL_SOLID%
ECHO   # Error: %COLOR_COUNTER_TOTAL_ERROR%
Echo ------------------------------------
Echo.
:: Don't mess with the formatting of the spaces
Echo ColorName	ColorCode
Echo --------------------------
Echo  %nColor0%        = %cColor0%
Echo  %nColor1%         = %cColor1%
Echo  %nColor2%        = %cColor2%
Echo  %nColor3%         = %cColor3%
Echo  %nColor4%          = %cColor4%
Echo  %nColor5%       = %cColor5%
Echo  %nColor6%       = %cColor6%
Echo  %nColor7%        = %cColor7%
Echo  %nColor8%         = %cColor8%
Echo  %nColor9%   = %cColor9%
Echo  %nColorA%  = %cColorA%
Echo  %nColorB%   = %cColorB%
Echo  %nColorC%    = %cColorC%
Echo  %nColorD% = %cColorD%
Echo  %nColorE% = %cColorE%
Echo  %nColorF% = %cColorF%
Echo.
Pause
GoTo Menu
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: User selection
:Menu
IF DEFINED BACKGROUND_COLOR IF DEFINED TEXT_COLOR (COLOR %BACKGROUND_COLOR%%TEXT_COLOR%) ELSE (IF NOT DEFINED COLOR1 IF NOT DEFINED COLOR2 Color 8F)
mode con:cols=50 lines=40
Cls
Echo *************************************************
Echo  Location: Menu
Echo *************************************************
Echo.
Echo  Current settings
Echo _____________________
Echo.
Echo  Screen Timeout: %ts%
Echo  Iterations: %iterations%
Echo  Process Timeout: %PS%
Echo -------------------------------------------------
Echo.
Echo.
Echo Choose an action to perform from the list:
Echo.
Echo [1] Intro
Echo [2] Manual Color ^(also sets the default^)
Echo [3] Best Colors
ECHO [4] Good Colors
Echo [5] All Colors
Echo [6] Random Colors
Echo [7] View Satement
ECHO [8] Settings
Echo [9] Exit
Echo.
Choice /c 123456789
Echo.
::
If ERRORLevel 9 GoTo EOF
If ERRORLevel 8 GoTo Settings
If ERRORLevel 7 GoTo Statem
If ERRORLevel 6 GoTo Random1
If ERRORLevel 5 SET Choice=All & GoTo Resize
If ERRORLevel 4 GoTo GoodColors
If ERRORLevel 3 GoTo BestColo
If ERRORLevel 2 GoTo manual
If ERRORLevel 1 GoTo Intro
Echo.
GoTo Resize
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:Settings
IF DEFINED BACKGROUND_COLOR IF DEFINED TEXT_COLOR (COLOR %BACKGROUND_COLOR%%TEXT_COLOR%) ELSE (IF NOT DEFINED COLOR1 IF NOT DEFINED COLOR2 Color 8F)
mode con:cols=50 lines=30
Cls
Echo *************************************************
Echo  Location: Settings
Echo *************************************************
Echo.
Echo  Current settings
Echo _____________________
Echo.
Echo  Screen Timeout: %ts%
Echo  Iterations: %iterations%
Echo  Process Timeout: %PS%
Echo *************************************************
Echo.
Echo.
Echo Choose an action to perform from the list:
Echo.
Echo [1] Configure Screen Timeout
Echo [2] Configure Iterations
Echo [3] Configure Process Timeout
Echo [4] Go back to Main Menu
Echo.
Choice /c 1234
Echo.
If ERRORLevel 4 GoTo Menu
If ERRORLevel 3 GoTo Custom3
If ERRORLevel 2 GoTo Custom2
If ERRORLevel 1 GoTo Custom1
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:Custom1
Cls
IF DEFINED BACKGROUND_COLOR IF DEFINED TEXT_COLOR (COLOR %BACKGROUND_COLOR%%TEXT_COLOR%) ELSE (IF NOT DEFINED COLOR1 IF NOT DEFINED COLOR2 Color 8F)
mode con:cols=50 lines=20
Echo *************************************************
Echo.
Echo  SREEEN TIMEOUT
Echo.
Echo  Current value: %ts%
ECHO.
Echo *************************************************
Echo.
Echo Customize the length of time each screen
Echo will be shown for.
Echo.
Echo (Note: the value is in seconds)
Echo.
SET /P ts=Screen Timeout:
Echo.
Echo You selected %ts% seconds.
Timeout /T %PS%
Goto Settings
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:Custom2
Cls
IF DEFINED BACKGROUND_COLOR IF DEFINED TEXT_COLOR (COLOR %BACKGROUND_COLOR%%TEXT_COLOR%) ELSE (IF NOT DEFINED COLOR1 IF NOT DEFINED COLOR2 Color 8F)
mode con:cols=50 lines=20
Echo *************************************************
Echo.
Echo  ITERATIONS
Echo.
Echo  Current value: %iterations%
ECHO.
Echo *************************************************
Echo.
Echo Customize the number of iterations
Echo.
Echo.
SET /P Iterations=Iterations:
Echo.
Echo You selected %Iterations% seconds.
Timeout /T %PS%
Goto Settings
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:Custom3
Cls
IF DEFINED BACKGROUND_COLOR IF DEFINED TEXT_COLOR (COLOR %BACKGROUND_COLOR%%TEXT_COLOR%) ELSE (IF NOT DEFINED COLOR1 IF NOT DEFINED COLOR2 Color 8F)
mode con:cols=50 lines=20
Echo *************************************************
Echo.
Echo  Process Timeout
Echo.
Echo  Current value: %PS%
ECHO.
Echo *************************************************
Echo.
Echo Customize the number of iterations
Echo.
Echo.
SET /P PS=Process Timeout:
Echo.
Echo You selected %PS% seconds.
Timeout /T %PS%
Goto Settings

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:Statem
IF DEFINED BACKGROUND_COLOR IF DEFINED TEXT_COLOR (COLOR %BACKGROUND_COLOR%%TEXT_COLOR%) ELSE (IF NOT DEFINED COLOR1 IF NOT DEFINED COLOR2 Color 8F)
cls
mode con:cols=58 lines=25
set newline=^& echo.
Echo.
Echo Cast your gaze upon the capital of your empire,%newline%and you will find two classes of citizens.%newline%The one, glutted with riches, displays an opulence %newline%which offends those it does not corrupt;%newline%the other, mired in destitution,%newline%worsens its condition by wearing a mask of posterity%newline%which it does not possess:%newline%for such is the power of gold%newline%(when it is become the god of a nation,%newline%stand in the stead of all talent,%newline%takes the place of every virtue)%newline%that one must either have wealth%newline%or feign to have it.%newline%%newline%L'Histoire philosophique et politique des établissements%newline%et du commerce des Européens dans les deux Indes, 1770
Echo.
Echo.
Echo.
Echo.
Pause
GoTo Menu
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:Resize
mode con:cols=55 lines=30
GoTo Color0
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:Color0
cls
For %%A IN (%Color%) Do Color 0%%A & (
     Echo.
     ) & (
	 Echo Background color = %nColor0%
	 ) & (
	 Echo.
	 ) & (
	 IF %%A==0 Echo Text color = %nColor0%
	 ) & (
	 IF %%A==1 Echo Text color = %nColor1%
	 ) & (
	 IF %%A==2 Echo Text color = %nColor2%
	 ) & (
	 IF %%A==3 Echo Text color = %nColor3%
	 ) & (
	 IF %%A==4 Echo Text color = %nColor4%
	 ) & (
	 IF %%A==5 Echo Text color = %nColor5%
	 ) & (
	 IF %%A==6 Echo Text color = %nColor6%
	 ) & (
	 IF %%A==7 Echo Text color = %nColor7%
	 ) & (
	 IF %%A==8 Echo Text color = %nColor8%
	 ) & (
	 IF %%A==9 Echo Text color = %nColor9%
	 ) & (
	 IF %%A==A Echo Text color = %nColorA%
	 ) & (
	 IF %%A==B Echo Text color = %nColorB%
	 ) & (
	 IF %%A==C Echo Text color = %nColorC%
	 ) & (
	 IF %%A==D Echo Text color = %nColorD%
	 ) & (
	 IF %%A==E Echo Text color = %nColorE%
	 ) & (
	 IF %%A==F Echo Text color = %nColorF%
	 ) & (
	 Echo.
	 ) & (
	 Echo Color Scheme = %cColor0%%%A
	 ) & (
	 Echo.
	 ) & (
	 Echo.
	 ) & (
	 Echo %Statement%
	 ) & (
	 Echo.
	 ) & (
	 Echo.
	 ) & (
	 Echo.
	 ) & (
	 Timeout /T %ts%
	 ) && (
	 cls
	 )
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:Color1
cls
For %%A IN (%Color%) Do Color 1%%A & Echo. & Echo Background color = %nColor1% & Echo. & (IF %%A==0 Echo Text color = %nColor0%) & (IF %%A==1 Echo Text color = %nColor1%) & (IF %%A==2 Echo Text color = %nColor2%) & (IF %%A==3 Echo Text color = %nColor3%) & (IF %%A==4 Echo Text color = %nColor4%) & (IF %%A==5 Echo Text color = %nColor5%) & (IF %%A==6 Echo Text color = %nColor6%) & (IF %%A==7 Echo Text color = %nColor7%) & (IF %%A==8 Echo Text color = %nColor8%) & (IF %%A==9 Echo Text color = %nColor9%) & (IF %%A==A Echo Text color = %nColorA%) & (IF %%A==B Echo Text color = %nColorB%) & (IF %%A==C Echo Text color = %nColorC%) & (IF %%A==D Echo Text color = %nColorD%) & (IF %%A==E Echo Text color = %nColorE%) & (IF %%A==F Echo Text color = %nColorF%) & Echo. & Echo Color Scheme = %cColor1%%%A & Echo. & Echo. & Echo %Statement% & Echo. & Echo. & Echo. & Timeout /T %ts% && cls
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:Color2
cls
For %%A IN (%Color%) Do Color 2%%A & Echo. & Echo Background color = %nColor2% & Echo. & (IF %%A==0 Echo Text color = %nColor0%) & (IF %%A==1 Echo Text color = %nColor1%) & (IF %%A==2 Echo Text color = %nColor2%) & (IF %%A==3 Echo Text color = %nColor3%) & (IF %%A==4 Echo Text color = %nColor4%) & (IF %%A==5 Echo Text color = %nColor5%) & (IF %%A==6 Echo Text color = %nColor6%) & (IF %%A==7 Echo Text color = %nColor7%) & (IF %%A==8 Echo Text color = %nColor8%) & (IF %%A==9 Echo Text color = %nColor9%) & (IF %%A==A Echo Text color = %nColorA%) & (IF %%A==B Echo Text color = %nColorB%) & (IF %%A==C Echo Text color = %nColorC%) & (IF %%A==D Echo Text color = %nColorD%) & (IF %%A==E Echo Text color = %nColorE%) & (IF %%A==F Echo Text color = %nColorF%) & Echo. & Echo Color Scheme = %cColor2%%%A & Echo. & Echo. & Echo %Statement% & Echo. & Echo. & Echo. & Timeout /T %ts% && cls
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:Color3
cls
For %%A IN (%Color%) Do Color 3%%A & Echo. & Echo Background color = %nColor3% & Echo. & (IF %%A==0 Echo Text color = %nColor0%) & (IF %%A==1 Echo Text color = %nColor1%) & (IF %%A==2 Echo Text color = %nColor2%) & (IF %%A==3 Echo Text color = %nColor3%) & (IF %%A==4 Echo Text color = %nColor4%) & (IF %%A==5 Echo Text color = %nColor5%) & (IF %%A==6 Echo Text color = %nColor6%) & (IF %%A==7 Echo Text color = %nColor7%) & (IF %%A==8 Echo Text color = %nColor8%) & (IF %%A==9 Echo Text color = %nColor9%) & (IF %%A==A Echo Text color = %nColorA%) & (IF %%A==B Echo Text color = %nColorB%) & (IF %%A==C Echo Text color = %nColorC%) & (IF %%A==D Echo Text color = %nColorD%) & (IF %%A==E Echo Text color = %nColorE%) & (IF %%A==F Echo Text color = %nColorF%) & Echo. & Echo Color Scheme = %cColor3%%%A & Echo. & Echo. & Echo %Statement% & Echo. & Echo. & Echo. & Timeout /T %ts% && cls
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:Color4
cls
For %%A IN (%Color%) Do Color 4%%A & Echo. & Echo Background color = %nColor4% & Echo. & (IF %%A==0 Echo Text color = %nColor0%) & (IF %%A==1 Echo Text color = %nColor1%) & (IF %%A==2 Echo Text color = %nColor2%) & (IF %%A==3 Echo Text color = %nColor3%) & (IF %%A==4 Echo Text color = %nColor4%) & (IF %%A==5 Echo Text color = %nColor5%) & (IF %%A==6 Echo Text color = %nColor6%) & (IF %%A==7 Echo Text color = %nColor7%) & (IF %%A==8 Echo Text color = %nColor8%) & (IF %%A==9 Echo Text color = %nColor9%) & (IF %%A==A Echo Text color = %nColorA%) & (IF %%A==B Echo Text color = %nColorB%) & (IF %%A==C Echo Text color = %nColorC%) & (IF %%A==D Echo Text color = %nColorD%) & (IF %%A==E Echo Text color = %nColorE%) & (IF %%A==F Echo Text color = %nColorF%) & Echo. & Echo Color Scheme = %cColor4%%%A & Echo. & Echo. & Echo %Statement% & Echo. & Echo. & Echo. & Timeout /T %ts% && cls
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:Color5
cls
For %%A IN (%Color%) Do Color 5%%A & Echo. & Echo Background color = %nColor5% & Echo. & (IF %%A==0 Echo Text color = %nColor0%) & (IF %%A==1 Echo Text color = %nColor1%) & (IF %%A==2 Echo Text color = %nColor2%) & (IF %%A==3 Echo Text color = %nColor3%) & (IF %%A==4 Echo Text color = %nColor4%) & (IF %%A==5 Echo Text color = %nColor5%) & (IF %%A==6 Echo Text color = %nColor6%) & (IF %%A==7 Echo Text color = %nColor7%) & (IF %%A==8 Echo Text color = %nColor8%) & (IF %%A==9 Echo Text color = %nColor9%) & (IF %%A==A Echo Text color = %nColorA%) & (IF %%A==B Echo Text color = %nColorB%) & (IF %%A==C Echo Text color = %nColorC%) & (IF %%A==D Echo Text color = %nColorD%) & (IF %%A==E Echo Text color = %nColorE%) & (IF %%A==F Echo Text color = %nColorF%) & Echo. & Echo Color Scheme = %cColor5%%%A & Echo. & Echo. & Echo %Statement% & Echo. & Echo. & Echo. & Timeout /T %ts% && cls
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:Color6
cls
For %%A IN (%Color%) Do Color 6%%A & Echo. & Echo Background color = %nColor6% & Echo. & (IF %%A==0 Echo Text color = %nColor0%) & (IF %%A==1 Echo Text color = %nColor1%) & (IF %%A==2 Echo Text color = %nColor2%) & (IF %%A==3 Echo Text color = %nColor3%) & (IF %%A==4 Echo Text color = %nColor4%) & (IF %%A==5 Echo Text color = %nColor5%) & (IF %%A==6 Echo Text color = %nColor6%) & (IF %%A==7 Echo Text color = %nColor7%) & (IF %%A==8 Echo Text color = %nColor8%) & (IF %%A==9 Echo Text color = %nColor9%) & (IF %%A==A Echo Text color = %nColorA%) & (IF %%A==B Echo Text color = %nColorB%) & (IF %%A==C Echo Text color = %nColorC%) & (IF %%A==D Echo Text color = %nColorD%) & (IF %%A==E Echo Text color = %nColorE%) & (IF %%A==F Echo Text color = %nColorF%) & Echo. & Echo Color Scheme = %cColor6%%%A & Echo. & Echo. & Echo %Statement% & Echo. & Echo. & Echo. & Timeout /T %ts% && cls
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:Color7
cls
For %%A IN (%Color%) Do Color 7%%A & Echo. & Echo Background color = %nColor7% & Echo. & (IF %%A==0 Echo Text color = %nColor0%) & (IF %%A==1 Echo Text color = %nColor1%) & (IF %%A==2 Echo Text color = %nColor2%) & (IF %%A==3 Echo Text color = %nColor3%) & (IF %%A==4 Echo Text color = %nColor4%) & (IF %%A==5 Echo Text color = %nColor5%) & (IF %%A==6 Echo Text color = %nColor6%) & (IF %%A==7 Echo Text color = %nColor7%) & (IF %%A==8 Echo Text color = %nColor8%) & (IF %%A==9 Echo Text color = %nColor9%) & (IF %%A==A Echo Text color = %nColorA%) & (IF %%A==B Echo Text color = %nColorB%) & (IF %%A==C Echo Text color = %nColorC%) & (IF %%A==D Echo Text color = %nColorD%) & (IF %%A==E Echo Text color = %nColorE%) & (IF %%A==F Echo Text color = %nColorF%) & Echo. & Echo Color Scheme = %cColor7%%%A & Echo. & Echo. & Echo %Statement% & Echo. & Echo. & Echo. & Timeout /T %ts% && cls
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:Color8
cls
For %%A IN (%Color%) Do Color 8%%A & Echo. & Echo Background color = %nColor8% & Echo. & (IF %%A==0 Echo Text color = %nColor0%) & (IF %%A==1 Echo Text color = %nColor1%) & (IF %%A==2 Echo Text color = %nColor2%) & (IF %%A==3 Echo Text color = %nColor3%) & (IF %%A==4 Echo Text color = %nColor4%) & (IF %%A==5 Echo Text color = %nColor5%) & (IF %%A==6 Echo Text color = %nColor6%) & (IF %%A==7 Echo Text color = %nColor7%) & (IF %%A==8 Echo Text color = %nColor8%) & (IF %%A==9 Echo Text color = %nColor9%) & (IF %%A==A Echo Text color = %nColorA%) & (IF %%A==B Echo Text color = %nColorB%) & (IF %%A==C Echo Text color = %nColorC%) & (IF %%A==D Echo Text color = %nColorD%) & (IF %%A==E Echo Text color = %nColorE%) & (IF %%A==F Echo Text color = %nColorF%) & Echo. & Echo Color Scheme = %cColor8%%%A & Echo. & Echo. & Echo %Statement% & Echo. & Echo. & Echo. & Timeout /T %ts% && cls
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:Color9
cls
For %%A IN (%Color%) Do Color 9%%A & Echo. & Echo Background color = %nColor9% & Echo. & (IF %%A==0 Echo Text color = %nColor0%) & (IF %%A==1 Echo Text color = %nColor1%) & (IF %%A==2 Echo Text color = %nColor2%) & (IF %%A==3 Echo Text color = %nColor3%) & (IF %%A==4 Echo Text color = %nColor4%) & (IF %%A==5 Echo Text color = %nColor5%) & (IF %%A==6 Echo Text color = %nColor6%) & (IF %%A==7 Echo Text color = %nColor7%) & (IF %%A==8 Echo Text color = %nColor8%) & (IF %%A==9 Echo Text color = %nColor9%) & (IF %%A==A Echo Text color = %nColorA%) & (IF %%A==B Echo Text color = %nColorB%) & (IF %%A==C Echo Text color = %nColorC%) & (IF %%A==D Echo Text color = %nColorD%) & (IF %%A==E Echo Text color = %nColorE%) & (IF %%A==F Echo Text color = %nColorF%) & Echo. & Echo Color Scheme = %cColor9%%%A & Echo. & Echo. & Echo %Statement% & Echo. & Echo. & Echo. & Timeout /T %ts% && cls
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:ColorA
cls
For %%A IN (%Color%) Do Color A%%A & Echo. & Echo Background color = %nColorA% & Echo. & (IF %%A==0 Echo Text color = %nColor0%) & (IF %%A==1 Echo Text color = %nColor1%) & (IF %%A==2 Echo Text color = %nColor2%) & (IF %%A==3 Echo Text color = %nColor3%) & (IF %%A==4 Echo Text color = %nColor4%) & (IF %%A==5 Echo Text color = %nColor5%) & (IF %%A==6 Echo Text color = %nColor6%) & (IF %%A==7 Echo Text color = %nColor7%) & (IF %%A==8 Echo Text color = %nColor8%) & (IF %%A==9 Echo Text color = %nColor9%) & (IF %%A==A Echo Text color = %nColorA%) & (IF %%A==B Echo Text color = %nColorB%) & (IF %%A==C Echo Text color = %nColorC%) & (IF %%A==D Echo Text color = %nColorD%) & (IF %%A==E Echo Text color = %nColorE%) & (IF %%A==F Echo Text color = %nColorF%) & Echo. & Echo Color Scheme = %cColorA%%%A & Echo. & Echo. & Echo %Statement% & Echo. & Echo. & Echo. & Timeout /T %ts% && cls
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:ColorB
cls
For %%A IN (%Color%) Do Color B%%A & Echo. & Echo Background color = %nColorB% & Echo. & (IF %%A==0 Echo Text color = %nColor0%) & (IF %%A==1 Echo Text color = %nColor1%) & (IF %%A==2 Echo Text color = %nColor2%) & (IF %%A==3 Echo Text color = %nColor3%) & (IF %%A==4 Echo Text color = %nColor4%) & (IF %%A==5 Echo Text color = %nColor5%) & (IF %%A==6 Echo Text color = %nColor6%) & (IF %%A==7 Echo Text color = %nColor7%) & (IF %%A==8 Echo Text color = %nColor8%) & (IF %%A==9 Echo Text color = %nColor9%) & (IF %%A==A Echo Text color = %nColorA%) & (IF %%A==B Echo Text color = %nColorB%) & (IF %%A==C Echo Text color = %nColorC%) & (IF %%A==D Echo Text color = %nColorD%) & (IF %%A==E Echo Text color = %nColorE%) & (IF %%A==F Echo Text color = %nColorF%) & Echo. &  Echo Color Scheme = %cColorB%%%A & Echo. & Echo. & Echo %Statement% & Echo. & Echo. & Echo. & Timeout /T %ts% && cls
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:ColorC
cls
For %%A IN (%Color%) Do Color C%%A & Echo. & Echo Background color = %nColorC% & Echo. & (IF %%A==0 Echo Text color = %nColor0%) & (IF %%A==1 Echo Text color = %nColor1%) & (IF %%A==2 Echo Text color = %nColor2%) & (IF %%A==3 Echo Text color = %nColor3%) & (IF %%A==4 Echo Text color = %nColor4%) & (IF %%A==5 Echo Text color = %nColor5%) & (IF %%A==6 Echo Text color = %nColor6%) & (IF %%A==7 Echo Text color = %nColor7%) & (IF %%A==8 Echo Text color = %nColor8%) & (IF %%A==9 Echo Text color = %nColor9%) & (IF %%A==A Echo Text color = %nColorA%) & (IF %%A==B Echo Text color = %nColorB%) & (IF %%A==C Echo Text color = %nColorC%) & (IF %%A==D Echo Text color = %nColorD%) & (IF %%A==E Echo Text color = %nColorE%) & (IF %%A==F Echo Text color = %nColorF%) & Echo. & Echo Color Scheme = %cColorC%%%A & Echo. & Echo. & Echo %Statement% & Echo. & Echo. & Echo. & Timeout /T %ts% && cls
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:ColorD
cls
For %%A IN (%Color%) Do Color D%%A & Echo. & Echo Background color = %nColorD% & Echo. & (IF %%A==0 Echo Text color = %nColor0%) & (IF %%A==1 Echo Text color = %nColor1%) & (IF %%A==2 Echo Text color = %nColor2%) & (IF %%A==3 Echo Text color = %nColor3%) & (IF %%A==4 Echo Text color = %nColor4%) & (IF %%A==5 Echo Text color = %nColor5%) & (IF %%A==6 Echo Text color = %nColor6%) & (IF %%A==7 Echo Text color = %nColor7%) & (IF %%A==8 Echo Text color = %nColor8%) & (IF %%A==9 Echo Text color = %nColor9%) & (IF %%A==A Echo Text color = %nColorA%) & (IF %%A==B Echo Text color = %nColorB%) & (IF %%A==C Echo Text color = %nColorC%) & (IF %%A==D Echo Text color = %nColorD%) & (IF %%A==E Echo Text color = %nColorE%) & (IF %%A==F Echo Text color = %nColorF%) & Echo. & Echo Color Scheme = %cColorD%%%A & Echo. & Echo. & Echo %Statement% & Echo. & Echo. & Echo. & Timeout /T %ts% && cls
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:ColorE
cls
For %%A IN (%Color%) Do Color E%%A & Echo. & Echo Background color = %nColorE% & Echo. & (IF %%A==0 Echo Text color = %nColor0%) & (IF %%A==1 Echo Text color = %nColor1%) & (IF %%A==2 Echo Text color = %nColor2%) & (IF %%A==3 Echo Text color = %nColor3%) & (IF %%A==4 Echo Text color = %nColor4%) & (IF %%A==5 Echo Text color = %nColor5%) & (IF %%A==6 Echo Text color = %nColor6%) & (IF %%A==7 Echo Text color = %nColor7%) & (IF %%A==8 Echo Text color = %nColor8%) & (IF %%A==9 Echo Text color = %nColor9%) & (IF %%A==A Echo Text color = %nColorA%) & (IF %%A==B Echo Text color = %nColorB%) & (IF %%A==C Echo Text color = %nColorC%) & (IF %%A==D Echo Text color = %nColorD%) & (IF %%A==E Echo Text color = %nColorE%) & (IF %%A==F Echo Text color = %nColorF%) & Echo. & Echo Color Scheme = %cColorE%%%A & Echo. & Echo. & Echo %Statement% & Echo. & Echo. & Echo. & Timeout /T %ts% && cls
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:ColorF
cls
For %%A IN (%Color%) Do Color F%%A & Echo. & Echo Background color = %nColorF% & Echo. & (IF %%A==0 Echo Text color = %nColor0%) & (IF %%A==1 Echo Text color = %nColor1%) & (IF %%A==2 Echo Text color = %nColor2%) & (IF %%A==3 Echo Text color = %nColor3%) & (IF %%A==4 Echo Text color = %nColor4%) & (IF %%A==5 Echo Text color = %nColor5%) & (IF %%A==6 Echo Text color = %nColor6%) & (IF %%A==7 Echo Text color = %nColor7%) & (IF %%A==8 Echo Text color = %nColor8%) & (IF %%A==9 Echo Text color = %nColor9%) & (IF %%A==A Echo Text color = %nColorA%) & (IF %%A==B Echo Text color = %nColorB%) & (IF %%A==C Echo Text color = %nColorC%) & (IF %%A==D Echo Text color = %nColorD%) & (IF %%A==E Echo Text color = %nColorE%) & (IF %%A==F Echo Text color = %nColorF%) & Echo. & Echo Color Scheme = %cColorF%%%A & Echo. & Echo. & Echo %Statement% & Echo. & Echo. & Echo. & Timeout /T %ts% && cls

GoTo Back
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:BestColo
cls
mode con:cols=51 lines=40
ECHO  ########################
ECHO   LOCATION: BEST COLORS
ECHO  ########################
ECHO.
For %%A IN (%bestColors%) Do Color %%A & Echo. & Echo Color Scheme = %%A & Echo. & Echo. & ((IF %%A==00 Echo Background color = %nColor0% & Echo. & Echo Text color = %nColor0%) & (IF %%A==01 Echo Background color = %nColor0% & Echo. & Echo Text color = %nColor1%) & (IF %%A==02 Echo Background color = %nColor0% & Echo. & Echo Text color = %nColor2%) & (IF %%A==03 Echo Background color = %nColor0% & Echo. & Echo Text color = %nColor3%) & (IF %%A==04 Echo Background color = %nColor0% & Echo. & Echo Text color = %nColor4%) & (IF %%A==05 Echo Background color = %nColor0% & Echo. & Echo Text color = %nColor5%) & (IF %%A==06 Echo Background color = %nColor0% & Echo. & Echo Text color = %nColor6%) & (IF %%A==07 Echo Background color = %nColor0% & Echo. & Echo Text color = %nColor7%) & (IF %%A==08 Echo Background color = %nColor0% & Echo. & Echo Text color = %nColor8%) & (IF %%A==09 Echo Background color = %nColor0% & Echo. & Echo Text color = %nColor9%) & (IF %%A==0A Echo Background color = %nColor0% & Echo. & Echo Text color = %nColorA%) & (IF %%A==0B Echo Background color = %nColor0% & Echo. & Echo Text color = %nColorB%) & (IF %%A==0C Echo Background color = %nColor0% & Echo. & Echo Text color = %nColorC%) & (IF %%A==0D Echo Background color = %nColor0% & Echo. & Echo Text color = %nColorD%) & (IF %%A==0E Echo Background color = %nColor0% & Echo. & Echo Text color = %nColorE%) & (IF %%A==0F Echo Background color = %nColor0% & Echo. & Echo Text color = %nColorF%) & (IF %%A==10 Echo Background color = %nColor1% & Echo. & Echo Text color = %nColor0%) & (IF %%A==11 Echo Background color = %nColor1% & Echo. & Echo Text color = %nColor1%) & (IF %%A==12 Echo Background color = %nColor1% & Echo. & Echo Text color = %nColor2%) & (IF %%A==13 Echo Background color = %nColor1% & Echo. & Echo Text color = %nColor3%) & (IF %%A==14 Echo Background color = %nColor1% & Echo. & Echo Text color = %nColor4%) & (IF %%A==15 Echo Background color = %nColor1% & Echo. & Echo Text color = %nColor5%) & (IF %%A==16 Echo Background color = %nColor1% & Echo. & Echo Text color = %nColor6%) & (IF %%A==17 Echo Background color = %nColor1% & Echo. & Echo Text color = %nColor7%) & (IF %%A==18 Echo Background color = %nColor1% & Echo. & Echo Text color = %nColor8%) & (IF %%A==19 Echo Background color = %nColor1% & Echo. & Echo Text color = %nColor9%) & (IF %%A==1A Echo Background color = %nColor1% & Echo. & Echo Text color = %nColorA%) & (IF %%A==1B Echo Background color = %nColor1% & Echo. & Echo Text color = %nColorB%) & (IF %%A==1C Echo Background color = %nColor1% & Echo. & Echo Text color = %nColorC%) & (IF %%A==1D Echo Background color = %nColor1% & Echo. & Echo Text color = %nColorD%) & (IF %%A==1E Echo Background color = %nColor1% & Echo. & Echo Text color = %nColorE%) & (IF %%A==1F Echo Background color = %nColor1% & Echo. & Echo Text color = %nColorF%) & (IF %%A==20 Echo Background color = %nColor2% & Echo. & Echo Text color = %nColor0%) & (IF %%A==21 Echo Background color = %nColor2% & Echo. & Echo Text color = %nColor1%) & (IF %%A==22 Echo Background color = %nColor2% & Echo. & Echo Text color = %nColor2%) & (IF %%A==23 Echo Background color = %nColor2% & Echo. & Echo Text color = %nColor3%) & (IF %%A==24 Echo Background color = %nColor2% & Echo. & Echo Text color = %nColor4%) & (IF %%A==25 Echo Background color = %nColor2% & Echo. & Echo Text color = %nColor5%) & (IF %%A==26 Echo Background color = %nColor2% & Echo. & Echo Text color = %nColor6%) & (IF %%A==27 Echo Background color = %nColor2% & Echo. & Echo Text color = %nColor7%) & (IF %%A==28 Echo Background color = %nColor2% & Echo. & Echo Text color = %nColor8%) & (IF %%A==29 Echo Background color = %nColor2% & Echo. & Echo Text color = %nColor9%) & (IF %%A==2A Echo Background color = %nColor2% & Echo. & Echo Text color = %nColorA%) & (IF %%A==2B Echo Background color = %nColor2% & Echo. & Echo Text color = %nColorB%) & (IF %%A==2C Echo Background color = %nColor2% & Echo. & Echo Text color = %nColorC%) & (IF %%A==2D Echo Background color = %nColor2% & Echo. & Echo Text color = %nColorD%) & (IF %%A==2E Echo Background color = %nColor2% & Echo. & Echo Text color = %nColorE%) & (IF %%A==2F Echo Background color = %nColor2% & Echo. & Echo Text color = %nColorF%) & (IF %%A==30 Echo Background color = %nColor3% & Echo. & Echo Text color = %nColor0%) & (IF %%A==31 Echo Background color = %nColor3% & Echo. & Echo Text color = %nColor1%) & (IF %%A==32 Echo Background color = %nColor3% & Echo. & Echo Text color = %nColor3%) & (IF %%A==33 Echo Background color = %nColor3% & Echo. & Echo Text color = %nColor3%) & (IF %%A==34 Echo Background color = %nColor3% & Echo. & Echo Text color = %nColor4%) & (IF %%A==35 Echo Background color = %nColor3% & Echo. & Echo Text color = %nColor5%) & (IF %%A==36 Echo Background color = %nColor3% & Echo. & Echo Text color = %nColor6%) & (IF %%A==37 Echo Background color = %nColor3% & Echo. & Echo Text color = %nColor7%) & (IF %%A==38 Echo Background color = %nColor3% & Echo. & Echo Text color = %nColor8%) & (IF %%A==39 Echo Background color = %nColor3% & Echo. & Echo Text color = %nColor9%) & (IF %%A==3A Echo Background color = %nColor3% & Echo. & Echo Text color = %nColorA%) & (IF %%A==3B Echo Background color = %nColor3% & Echo. & Echo Text color = %nColorB%) & (IF %%A==3C Echo Background color = %nColor3% & Echo. & Echo Text color = %nColorC%) & (IF %%A==3D Echo Background color = %nColor3% & Echo. & Echo Text color = %nColorD%) & (IF %%A==3E Echo Background color = %nColor3% & Echo. & Echo Text color = %nColorE%) & (IF %%A==3F Echo Background color = %nColor3% & Echo. & Echo Text color = %nColorF%) & (IF %%A==40 Echo Background color = %nColor4% & Echo. & Echo Text color = %nColor0%) & (IF %%A==41 Echo Background color = %nColor4% & Echo. & Echo Text color = %nColor1%) & (IF %%A==42 Echo Background color = %nColor4% & Echo. & Echo Text color = %nColor4%) & (IF %%A==43 Echo Background color = %nColor4% & Echo. & Echo Text color = %nColor4%) & (IF %%A==44 Echo Background color = %nColor4% & Echo. & Echo Text color = %nColor4%) & (IF %%A==45 Echo Background color = %nColor4% & Echo. & Echo Text color = %nColor5%) & (IF %%A==46 Echo Background color = %nColor4% & Echo. & Echo Text color = %nColor6%) & (IF %%A==47 Echo Background color = %nColor4% & Echo. & Echo Text color = %nColor7%) & (IF %%A==48 Echo Background color = %nColor4% & Echo. & Echo Text color = %nColor8%) & (IF %%A==49 Echo Background color = %nColor4% & Echo. & Echo Text color = %nColor9%) & (IF %%A==4A Echo Background color = %nColor4% & Echo. & Echo Text color = %nColorA%) & (IF %%A==4B Echo Background color = %nColor4% & Echo. & Echo Text color = %nColorB%) & (IF %%A==4C Echo Background color = %nColor4% & Echo. & Echo Text color = %nColorC%) & (IF %%A==4D Echo Background color = %nColor4% & Echo. & Echo Text color = %nColorD%) & (IF %%A==4E Echo Background color = %nColor4% & Echo. & Echo Text color = %nColorE%) & (IF %%A==4F Echo Background color = %nColor4% & Echo. & Echo Text color = %nColorF%) & (IF %%A==50 Echo Background color = %nColor5% & Echo. & Echo Text color = %nColor0%) & (IF %%A==51 Echo Background color = %nColor5% & Echo. & Echo Text color = %nColor1%) & (IF %%A==52 Echo Background color = %nColor5% & Echo. & Echo Text color = %nColor4%) & (IF %%A==53 Echo Background color = %nColor5% & Echo. & Echo Text color = %nColor4%) & (IF %%A==54 Echo Background color = %nColor5% & Echo. & Echo Text color = %nColor4%) & (IF %%A==55 Echo Background color = %nColor5% & Echo. & Echo Text color = %nColor5%) & (IF %%A==56 Echo Background color = %nColor5% & Echo. & Echo Text color = %nColor6%) & (IF %%A==57 Echo Background color = %nColor5% & Echo. & Echo Text color = %nColor7%) & (IF %%A==58 Echo Background color = %nColor5% & Echo. & Echo Text color = %nColor8%) & (IF %%A==59 Echo Background color = %nColor5% & Echo. & Echo Text color = %nColor9%) & (IF %%A==5A Echo Background color = %nColor5% & Echo. & Echo Text color = %nColorA%) & (IF %%A==5B Echo Background color = %nColor5% & Echo. & Echo Text color = %nColorB%) & (IF %%A==5C Echo Background color = %nColor5% & Echo. & Echo Text color = %nColorC%) & (IF %%A==5D Echo Background color = %nColor5% & Echo. & Echo Text color = %nColorD%) & (IF %%A==5E Echo Background color = %nColor5% & Echo. & Echo Text color = %nColorE%) & (IF %%A==5F Echo Background color = %nColor5% & Echo. & Echo Text color = %nColorF%) & (IF %%A==60 Echo Background color = %nColor6% & Echo. & Echo Text color = %nColor0%) & (IF %%A==61 Echo Background color = %nColor6% & Echo. & Echo Text color = %nColor1%) & (IF %%A==62 Echo Background color = %nColor6% & Echo. & Echo Text color = %nColor4%) & (IF %%A==63 Echo Background color = %nColor6% & Echo. & Echo Text color = %nColor4%) & (IF %%A==64 Echo Background color = %nColor6% & Echo. & Echo Text color = %nColor4%) & (IF %%A==65 Echo Background color = %nColor6% & Echo. & Echo Text color = %nColor5%) & (IF %%A==66 Echo Background color = %nColor6% & Echo. & Echo Text color = %nColor6%) & (IF %%A==67 Echo Background color = %nColor6% & Echo. & Echo Text color = %nColor7%) & (IF %%A==68 Echo Background color = %nColor6% & Echo. & Echo Text color = %nColor8%) & (IF %%A==69 Echo Background color = %nColor6% & Echo. & Echo Text color = %nColor9%) & (IF %%A==6A Echo Background color = %nColor6% & Echo. & Echo Text color = %nColorA%) & (IF %%A==6B Echo Background color = %nColor6% & Echo. & Echo Text color = %nColorB%) & (IF %%A==6C Echo Background color = %nColor6% & Echo. & Echo Text color = %nColorC%) & (IF %%A==6D Echo Background color = %nColor6% & Echo. & Echo Text color = %nColorD%) & (IF %%A==6E Echo Background color = %nColor6% & Echo. & Echo Text color = %nColorE%) & (IF %%A==6F Echo Background color = %nColor6% & Echo. & Echo Text color = %nColorF%) & (IF %%A==70 Echo Background color = %nColor7% & Echo. & Echo Text color = %nColor0%) & (IF %%A==71 Echo Background color = %nColor7% & Echo. & Echo Text color = %nColor1%) & (IF %%A==72 Echo Background color = %nColor7% & Echo. & Echo Text color = %nColor4%) & (IF %%A==73 Echo Background color = %nColor7% & Echo. & Echo Text color = %nColor4%) & (IF %%A==74 Echo Background color = %nColor7% & Echo. & Echo Text color = %nColor4%) & (IF %%A==75 Echo Background color = %nColor7% & Echo. & Echo Text color = %nColor5%) & (IF %%A==76 Echo Background color = %nColor7% & Echo. & Echo Text color = %nColor6%) & (IF %%A==77 Echo Background color = %nColor7% & Echo. & Echo Text color = %nColor7%) & (IF %%A==78 Echo Background color = %nColor7% & Echo. & Echo Text color = %nColor8%) & (IF %%A==79 Echo Background color = %nColor7% & Echo. & Echo Text color = %nColor9%) & (IF %%A==7A Echo Background color = %nColor7% & Echo. & Echo Text color = %nColorA%) & (IF %%A==7B Echo Background color = %nColor7% & Echo. & Echo Text color = %nColorB%) & (IF %%A==7C Echo Background color = %nColor7% & Echo. & Echo Text color = %nColorC%) & (IF %%A==7D Echo Background color = %nColor7% & Echo. & Echo Text color = %nColorD%) & (IF %%A==7E Echo Background color = %nColor7% & Echo. & Echo Text color = %nColorE%) & (IF %%A==7F Echo Background color = %nColor7% & Echo. & Echo Text color = %nColorF%) & (IF %%A==80 Echo Background color = %nColor8% & Echo. & Echo Text color = %nColor0%) & (IF %%A==81 Echo Background color = %nColor8% & Echo. & Echo Text color = %nColor1%) & (IF %%A==82 Echo Background color = %nColor8% & Echo. & Echo Text color = %nColor4%) & (IF %%A==83 Echo Background color = %nColor8% & Echo. & Echo Text color = %nColor4%) & (IF %%A==84 Echo Background color = %nColor8% & Echo. & Echo Text color = %nColor4%) & (IF %%A==85 Echo Background color = %nColor8% & Echo. & Echo Text color = %nColor5%) & (IF %%A==86 Echo Background color = %nColor8% & Echo. & Echo Text color = %nColor6%) & (IF %%A==87 Echo Background color = %nColor8% & Echo. & Echo Text color = %nColor7%) & (IF %%A==88 Echo Background color = %nColor8% & Echo. & Echo Text color = %nColor8%) & (IF %%A==89 Echo Background color = %nColor8% & Echo. & Echo Text color = %nColor9%) & (IF %%A==8A Echo Background color = %nColor8% & Echo. & Echo Text color = %nColorA%) & (IF %%A==8B Echo Background color = %nColor8% & Echo. & Echo Text color = %nColorB%) & (IF %%A==8C Echo Background color = %nColor8% & Echo. & Echo Text color = %nColorC%) & (IF %%A==8D Echo Background color = %nColor8% & Echo. & Echo Text color = %nColorD%) & (IF %%A==8E Echo Background color = %nColor8% & Echo. & Echo Text color = %nColorE%) & (IF %%A==8F Echo Background color = %nColor8% & Echo. & Echo Text color = %nColorF%) & (IF %%A==90 Echo Background color = %nColor9% & Echo. & Echo Text color = %nColor0%) & (IF %%A==91 Echo Background color = %nColor9% & Echo. & Echo Text color = %nColor1%) & (IF %%A==92 Echo Background color = %nColor9% & Echo. & Echo Text color = %nColor4%) & (IF %%A==93 Echo Background color = %nColor9% & Echo. & Echo Text color = %nColor4%) & (IF %%A==94 Echo Background color = %nColor9% & Echo. & Echo Text color = %nColor4%) & (IF %%A==95 Echo Background color = %nColor9% & Echo. & Echo Text color = %nColor5%) & (IF %%A==96 Echo Background color = %nColor9% & Echo. & Echo Text color = %nColor6%) & (IF %%A==97 Echo Background color = %nColor9% & Echo. & Echo Text color = %nColor7%) & (IF %%A==98 Echo Background color = %nColor9% & Echo. & Echo Text color = %nColor8%) & (IF %%A==99 Echo Background color = %nColor9% & Echo. & Echo Text color = %nColor9%) & (IF %%A==9A Echo Background color = %nColor9% & Echo. & Echo Text color = %nColorA%) & (IF %%A==9B Echo Background color = %nColor9% & Echo. & Echo Text color = %nColorB%) & (IF %%A==9C Echo Background color = %nColor9% & Echo. & Echo Text color = %nColorC%) & (IF %%A==9D Echo Background color = %nColor9% & Echo. & Echo Text color = %nColorD%) & (IF %%A==9E Echo Background color = %nColor9% & Echo. & Echo Text color = %nColorE%) & (IF %%A==9F Echo Background color = %nColor9% & Echo. & Echo Text color = %nColorF%) & (IF %%A==A0 Echo Background color = %nColorA% & Echo. & Echo Text color = %nColor0%) & (IF %%A==A1 Echo Background color = %nColorA% & Echo. & Echo Text color = %nColor1%) & (IF %%A==A2 Echo Background color = %nColorA% & Echo. & Echo Text color = %nColor4%) & (IF %%A==A3 Echo Background color = %nColorA% & Echo. & Echo Text color = %nColor4%) & (IF %%A==A4 Echo Background color = %nColorA% & Echo. & Echo Text color = %nColor4%) & (IF %%A==A5 Echo Background color = %nColorA% & Echo. & Echo Text color = %nColor5%) & (IF %%A==A6 Echo Background color = %nColorA% & Echo. & Echo Text color = %nColor6%) & (IF %%A==A7 Echo Background color = %nColorA% & Echo. & Echo Text color = %nColor7%) & (IF %%A==A8 Echo Background color = %nColorA% & Echo. & Echo Text color = %nColor8%) & (IF %%A==A9 Echo Background color = %nColorA% & Echo. & Echo Text color = %nColor9%) & (IF %%A==AA Echo Background color = %nColorA% & Echo. & Echo Text color = %nColorA%) & (IF %%A==AB Echo Background color = %nColorA% & Echo. & Echo Text color = %nColorB%) & (IF %%A==AC Echo Background color = %nColorA% & Echo. & Echo Text color = %nColorC%) & (IF %%A==AD Echo Background color = %nColorA% & Echo. & Echo Text color = %nColorD%) & (IF %%A==AE Echo Background color = %nColorA% & Echo. & Echo Text color = %nColorE%) & (IF %%A==AF Echo Background color = %nColorA% & Echo. & Echo Text color = %nColorF%) & (IF %%A==B0 Echo Background color = %nColorB% & Echo. & Echo Text color = %nColor0%) & (IF %%A==B1 Echo Background color = %nColorB% & Echo. & Echo Text color = %nColor1%) & (IF %%A==B2 Echo Background color = %nColorB% & Echo. & Echo Text color = %nColor4%) & (IF %%A==B3 Echo Background color = %nColorB% & Echo. & Echo Text color = %nColor4%) & (IF %%A==B4 Echo Background color = %nColorB% & Echo. & Echo Text color = %nColor4%) & (IF %%A==B5 Echo Background color = %nColorB% & Echo. & Echo Text color = %nColor5%) & (IF %%A==B6 Echo Background color = %nColorB% & Echo. & Echo Text color = %nColor6%) & (IF %%A==B7 Echo Background color = %nColorB% & Echo. & Echo Text color = %nColor7%) & (IF %%A==B8 Echo Background color = %nColorB% & Echo. & Echo Text color = %nColor8%) & (IF %%A==B9 Echo Background color = %nColorB% & Echo. & Echo Text color = %nColor9%) & (IF %%A==BA Echo Background color = %nColorB% & Echo. & Echo Text color = %nColorA%) & (IF %%A==BB Echo Background color = %nColorB% & Echo. & Echo Text color = %nColorB%) & (IF %%A==BC Echo Background color = %nColorB% & Echo. & Echo Text color = %nColorC%) & (IF %%A==BD Echo Background color = %nColorB% & Echo. & Echo Text color = %nColorD%) & (IF %%A==BE Echo Background color = %nColorB% & Echo. & Echo Text color = %nColorE%) & (IF %%A==BF Echo Background color = %nColorB% & Echo. & Echo Text color = %nColorF%) & (IF %%A==C0 Echo Background color = %nColorC% & Echo. & Echo Text color = %nColor0%) & (IF %%A==C1 Echo Background color = %nColorC% & Echo. & Echo Text color = %nColor1%) & (IF %%A==C2 Echo Background color = %nColorC% & Echo. & Echo Text color = %nColor4%) & (IF %%A==C3 Echo Background color = %nColorC% & Echo. & Echo Text color = %nColor4%) & (IF %%A==C4 Echo Background color = %nColorC% & Echo. & Echo Text color = %nColor4%) & (IF %%A==C5 Echo Background color = %nColorC% & Echo. & Echo Text color = %nColor5%) & (IF %%A==C6 Echo Background color = %nColorC% & Echo. & Echo Text color = %nColor6%) & (IF %%A==C7 Echo Background color = %nColorC% & Echo. & Echo Text color = %nColor7%) & (IF %%A==C8 Echo Background color = %nColorC% & Echo. & Echo Text color = %nColor8%) & (IF %%A==C9 Echo Background color = %nColorC% & Echo. & Echo Text color = %nColor9%) & (IF %%A==CA Echo Background color = %nColorC% & Echo. & Echo Text color = %nColorA%) & (IF %%A==CB Echo Background color = %nColorC% & Echo. & Echo Text color = %nColorB%) & (IF %%A==CC Echo Background color = %nColorC% & Echo. & Echo Text color = %nColorC%) & (IF %%A==CD Echo Background color = %nColorC% & Echo. & Echo Text color = %nColorD%) & (IF %%A==CE Echo Background color = %nColorC% & Echo. & Echo Text color = %nColorE%) & (IF %%A==CF Echo Background color = %nColorC% & Echo. & Echo Text color = %nColorF%) & (IF %%A==D0 Echo Background color = %nColorD% & Echo. & Echo Text color = %nColor0%) & (IF %%A==D1 Echo Background color = %nColorD% & Echo. & Echo Text color = %nColor1%) & (IF %%A==D2 Echo Background color = %nColorD% & Echo. & Echo Text color = %nColor4%) & (IF %%A==D3 Echo Background color = %nColorD% & Echo. & Echo Text color = %nColor4%) & (IF %%A==D4 Echo Background color = %nColorD% & Echo. & Echo Text color = %nColor4%) & (IF %%A==D5 Echo Background color = %nColorD% & Echo. & Echo Text color = %nColor5%) & (IF %%A==D6 Echo Background color = %nColorD% & Echo. & Echo Text color = %nColor6%) & (IF %%A==D7 Echo Background color = %nColorD% & Echo. & Echo Text color = %nColor7%) & (IF %%A==D8 Echo Background color = %nColorD% & Echo. & Echo Text color = %nColor8%) & (IF %%A==D9 Echo Background color = %nColorD% & Echo. & Echo Text color = %nColor9%) & (IF %%A==DA Echo Background color = %nColorD% & Echo. & Echo Text color = %nColorA%) & (IF %%A==DB Echo Background color = %nColorD% & Echo. & Echo Text color = %nColorB%) & (IF %%A==DC Echo Background color = %nColorD% & Echo. & Echo Text color = %nColorC%) & (IF %%A==DD Echo Background color = %nColorD% & Echo. & Echo Text color = %nColorD%) & (IF %%A==DE Echo Background color = %nColorD% & Echo. & Echo Text color = %nColorE%) & (IF %%A==DF Echo Background color = %nColorD% & Echo. & Echo Text color = %nColorF%) & (IF %%A==E0 Echo Background color = %nColorE% & Echo. & Echo Text color = %nColor0%) & (IF %%A==E1 Echo Background color = %nColorE% & Echo. & Echo Text color = %nColor1%) & (IF %%A==E2 Echo Background color = %nColorE% & Echo. & Echo Text color = %nColor4%) & (IF %%A==E3 Echo Background color = %nColorE% & Echo. & Echo Text color = %nColor4%) & (IF %%A==E4 Echo Background color = %nColorE% & Echo. & Echo Text color = %nColor4%) & (IF %%A==E5 Echo Background color = %nColorE% & Echo. & Echo Text color = %nColor5%) & (IF %%A==E6 Echo Background color = %nColorE% & Echo. & Echo Text color = %nColor6%) & (IF %%A==E7 Echo Background color = %nColorE% & Echo. & Echo Text color = %nColor7%) & (IF %%A==E8 Echo Background color = %nColorE% & Echo. & Echo Text color = %nColor8%) & (IF %%A==E9 Echo Background color = %nColorE% & Echo. & Echo Text color = %nColor9%) & (IF %%A==EA Echo Background color = %nColorE% & Echo. & Echo Text color = %nColorA%) & (IF %%A==EB Echo Background color = %nColorE% & Echo. & Echo Text color = %nColorB%) & (IF %%A==EC Echo Background color = %nColorE% & Echo. & Echo Text color = %nColorC%) & (IF %%A==ED Echo Background color = %nColorE% & Echo. & Echo Text color = %nColorD%) & (IF %%A==EE Echo Background color = %nColorE% & Echo. & Echo Text color = %nColorE%) & (IF %%A==EF Echo Background color = %nColorE% & Echo. & Echo Text color = %nColorF%) & (IF %%A==F0 Echo Background color = %nColorF% & Echo. & Echo Text color = %nColor0%) & (IF %%A==F1 Echo Background color = %nColorF% & Echo. & Echo Text color = %nColor1%) & (IF %%A==F2 Echo Background color = %nColorF% & Echo. & Echo Text color = %nColor4%) & (IF %%A==F3 Echo Background color = %nColorF% & Echo. & Echo Text color = %nColor4%) & (IF %%A==F4 Echo Background color = %nColorF% & Echo. & Echo Text color = %nColor4%) & (IF %%A==F5 Echo Background color = %nColorF% & Echo. & Echo Text color = %nColor5%) & (IF %%A==F6 Echo Background color = %nColorF% & Echo. & Echo Text color = %nColor6%) & (IF %%A==F7 Echo Background color = %nColorF% & Echo. & Echo Text color = %nColor7%) & (IF %%A==F8 Echo Background color = %nColorF% & Echo. & Echo Text color = %nColor8%) & (IF %%A==F9 Echo Background color = %nColorF% & Echo. & Echo Text color = %nColor9%) & (IF %%A==FA Echo Background color = %nColorF% & Echo. & Echo Text color = %nColorA%) & (IF %%A==FB Echo Background color = %nColorF% & Echo. & Echo Text color = %nColorB%) & (IF %%A==FC Echo Background color = %nColorF% & Echo. & Echo Text color = %nColorC%) & (IF %%A==FD Echo Background color = %nColorF% & Echo. & Echo Text color = %nColorD%) & (IF %%A==FE Echo Background color = %nColorF% & Echo. & Echo Text color = %nColorE%) & (IF %%A==FF Echo Background color = %nColorF% & Echo. & Echo Text color = %nColorF%)) & Echo. & Echo. & Echo %Statement% & Echo. & Echo. & Echo. & Timeout /T %ts% && cls
Color 8F
Goto Back
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:GoodColors
cls
mode con:cols=51 lines=40
ECHO  ########################
ECHO   LOCATION: Good Colors
ECHO  ########################
ECHO.
For %%A IN (%GOODCOLORS%) Do Color %%A & Echo. & Echo Color Scheme = %%A & Echo. & Echo. & ((IF %%A==00 Echo Background color = %nColor0% & Echo. & Echo Text color = %nColor0%) & (IF %%A==01 Echo Background color = %nColor0% & Echo. & Echo Text color = %nColor1%) & (IF %%A==02 Echo Background color = %nColor0% & Echo. & Echo Text color = %nColor2%) & (IF %%A==03 Echo Background color = %nColor0% & Echo. & Echo Text color = %nColor3%) & (IF %%A==04 Echo Background color = %nColor0% & Echo. & Echo Text color = %nColor4%) & (IF %%A==05 Echo Background color = %nColor0% & Echo. & Echo Text color = %nColor5%) & (IF %%A==06 Echo Background color = %nColor0% & Echo. & Echo Text color = %nColor6%) & (IF %%A==07 Echo Background color = %nColor0% & Echo. & Echo Text color = %nColor7%) & (IF %%A==08 Echo Background color = %nColor0% & Echo. & Echo Text color = %nColor8%) & (IF %%A==09 Echo Background color = %nColor0% & Echo. & Echo Text color = %nColor9%) & (IF %%A==0A Echo Background color = %nColor0% & Echo. & Echo Text color = %nColorA%) & (IF %%A==0B Echo Background color = %nColor0% & Echo. & Echo Text color = %nColorB%) & (IF %%A==0C Echo Background color = %nColor0% & Echo. & Echo Text color = %nColorC%) & (IF %%A==0D Echo Background color = %nColor0% & Echo. & Echo Text color = %nColorD%) & (IF %%A==0E Echo Background color = %nColor0% & Echo. & Echo Text color = %nColorE%) & (IF %%A==0F Echo Background color = %nColor0% & Echo. & Echo Text color = %nColorF%) & (IF %%A==10 Echo Background color = %nColor1% & Echo. & Echo Text color = %nColor0%) & (IF %%A==11 Echo Background color = %nColor1% & Echo. & Echo Text color = %nColor1%) & (IF %%A==12 Echo Background color = %nColor1% & Echo. & Echo Text color = %nColor2%) & (IF %%A==13 Echo Background color = %nColor1% & Echo. & Echo Text color = %nColor3%) & (IF %%A==14 Echo Background color = %nColor1% & Echo. & Echo Text color = %nColor4%) & (IF %%A==15 Echo Background color = %nColor1% & Echo. & Echo Text color = %nColor5%) & (IF %%A==16 Echo Background color = %nColor1% & Echo. & Echo Text color = %nColor6%) & (IF %%A==17 Echo Background color = %nColor1% & Echo. & Echo Text color = %nColor7%) & (IF %%A==18 Echo Background color = %nColor1% & Echo. & Echo Text color = %nColor8%) & (IF %%A==19 Echo Background color = %nColor1% & Echo. & Echo Text color = %nColor9%) & (IF %%A==1A Echo Background color = %nColor1% & Echo. & Echo Text color = %nColorA%) & (IF %%A==1B Echo Background color = %nColor1% & Echo. & Echo Text color = %nColorB%) & (IF %%A==1C Echo Background color = %nColor1% & Echo. & Echo Text color = %nColorC%) & (IF %%A==1D Echo Background color = %nColor1% & Echo. & Echo Text color = %nColorD%) & (IF %%A==1E Echo Background color = %nColor1% & Echo. & Echo Text color = %nColorE%) & (IF %%A==1F Echo Background color = %nColor1% & Echo. & Echo Text color = %nColorF%) & (IF %%A==20 Echo Background color = %nColor2% & Echo. & Echo Text color = %nColor0%) & (IF %%A==21 Echo Background color = %nColor2% & Echo. & Echo Text color = %nColor1%) & (IF %%A==22 Echo Background color = %nColor2% & Echo. & Echo Text color = %nColor2%) & (IF %%A==23 Echo Background color = %nColor2% & Echo. & Echo Text color = %nColor3%) & (IF %%A==24 Echo Background color = %nColor2% & Echo. & Echo Text color = %nColor4%) & (IF %%A==25 Echo Background color = %nColor2% & Echo. & Echo Text color = %nColor5%) & (IF %%A==26 Echo Background color = %nColor2% & Echo. & Echo Text color = %nColor6%) & (IF %%A==27 Echo Background color = %nColor2% & Echo. & Echo Text color = %nColor7%) & (IF %%A==28 Echo Background color = %nColor2% & Echo. & Echo Text color = %nColor8%) & (IF %%A==29 Echo Background color = %nColor2% & Echo. & Echo Text color = %nColor9%) & (IF %%A==2A Echo Background color = %nColor2% & Echo. & Echo Text color = %nColorA%) & (IF %%A==2B Echo Background color = %nColor2% & Echo. & Echo Text color = %nColorB%) & (IF %%A==2C Echo Background color = %nColor2% & Echo. & Echo Text color = %nColorC%) & (IF %%A==2D Echo Background color = %nColor2% & Echo. & Echo Text color = %nColorD%) & (IF %%A==2E Echo Background color = %nColor2% & Echo. & Echo Text color = %nColorE%) & (IF %%A==2F Echo Background color = %nColor2% & Echo. & Echo Text color = %nColorF%) & (IF %%A==30 Echo Background color = %nColor3% & Echo. & Echo Text color = %nColor0%) & (IF %%A==31 Echo Background color = %nColor3% & Echo. & Echo Text color = %nColor1%) & (IF %%A==32 Echo Background color = %nColor3% & Echo. & Echo Text color = %nColor3%) & (IF %%A==33 Echo Background color = %nColor3% & Echo. & Echo Text color = %nColor3%) & (IF %%A==34 Echo Background color = %nColor3% & Echo. & Echo Text color = %nColor4%) & (IF %%A==35 Echo Background color = %nColor3% & Echo. & Echo Text color = %nColor5%) & (IF %%A==36 Echo Background color = %nColor3% & Echo. & Echo Text color = %nColor6%) & (IF %%A==37 Echo Background color = %nColor3% & Echo. & Echo Text color = %nColor7%) & (IF %%A==38 Echo Background color = %nColor3% & Echo. & Echo Text color = %nColor8%) & (IF %%A==39 Echo Background color = %nColor3% & Echo. & Echo Text color = %nColor9%) & (IF %%A==3A Echo Background color = %nColor3% & Echo. & Echo Text color = %nColorA%) & (IF %%A==3B Echo Background color = %nColor3% & Echo. & Echo Text color = %nColorB%) & (IF %%A==3C Echo Background color = %nColor3% & Echo. & Echo Text color = %nColorC%) & (IF %%A==3D Echo Background color = %nColor3% & Echo. & Echo Text color = %nColorD%) & (IF %%A==3E Echo Background color = %nColor3% & Echo. & Echo Text color = %nColorE%) & (IF %%A==3F Echo Background color = %nColor3% & Echo. & Echo Text color = %nColorF%) & (IF %%A==40 Echo Background color = %nColor4% & Echo. & Echo Text color = %nColor0%) & (IF %%A==41 Echo Background color = %nColor4% & Echo. & Echo Text color = %nColor1%) & (IF %%A==42 Echo Background color = %nColor4% & Echo. & Echo Text color = %nColor4%) & (IF %%A==43 Echo Background color = %nColor4% & Echo. & Echo Text color = %nColor4%) & (IF %%A==44 Echo Background color = %nColor4% & Echo. & Echo Text color = %nColor4%) & (IF %%A==45 Echo Background color = %nColor4% & Echo. & Echo Text color = %nColor5%) & (IF %%A==46 Echo Background color = %nColor4% & Echo. & Echo Text color = %nColor6%) & (IF %%A==47 Echo Background color = %nColor4% & Echo. & Echo Text color = %nColor7%) & (IF %%A==48 Echo Background color = %nColor4% & Echo. & Echo Text color = %nColor8%) & (IF %%A==49 Echo Background color = %nColor4% & Echo. & Echo Text color = %nColor9%) & (IF %%A==4A Echo Background color = %nColor4% & Echo. & Echo Text color = %nColorA%) & (IF %%A==4B Echo Background color = %nColor4% & Echo. & Echo Text color = %nColorB%) & (IF %%A==4C Echo Background color = %nColor4% & Echo. & Echo Text color = %nColorC%) & (IF %%A==4D Echo Background color = %nColor4% & Echo. & Echo Text color = %nColorD%) & (IF %%A==4E Echo Background color = %nColor4% & Echo. & Echo Text color = %nColorE%) & (IF %%A==4F Echo Background color = %nColor4% & Echo. & Echo Text color = %nColorF%) & (IF %%A==50 Echo Background color = %nColor5% & Echo. & Echo Text color = %nColor0%) & (IF %%A==51 Echo Background color = %nColor5% & Echo. & Echo Text color = %nColor1%) & (IF %%A==52 Echo Background color = %nColor5% & Echo. & Echo Text color = %nColor4%) & (IF %%A==53 Echo Background color = %nColor5% & Echo. & Echo Text color = %nColor4%) & (IF %%A==54 Echo Background color = %nColor5% & Echo. & Echo Text color = %nColor4%) & (IF %%A==55 Echo Background color = %nColor5% & Echo. & Echo Text color = %nColor5%) & (IF %%A==56 Echo Background color = %nColor5% & Echo. & Echo Text color = %nColor6%) & (IF %%A==57 Echo Background color = %nColor5% & Echo. & Echo Text color = %nColor7%) & (IF %%A==58 Echo Background color = %nColor5% & Echo. & Echo Text color = %nColor8%) & (IF %%A==59 Echo Background color = %nColor5% & Echo. & Echo Text color = %nColor9%) & (IF %%A==5A Echo Background color = %nColor5% & Echo. & Echo Text color = %nColorA%) & (IF %%A==5B Echo Background color = %nColor5% & Echo. & Echo Text color = %nColorB%) & (IF %%A==5C Echo Background color = %nColor5% & Echo. & Echo Text color = %nColorC%) & (IF %%A==5D Echo Background color = %nColor5% & Echo. & Echo Text color = %nColorD%) & (IF %%A==5E Echo Background color = %nColor5% & Echo. & Echo Text color = %nColorE%) & (IF %%A==5F Echo Background color = %nColor5% & Echo. & Echo Text color = %nColorF%) & (IF %%A==60 Echo Background color = %nColor6% & Echo. & Echo Text color = %nColor0%) & (IF %%A==61 Echo Background color = %nColor6% & Echo. & Echo Text color = %nColor1%) & (IF %%A==62 Echo Background color = %nColor6% & Echo. & Echo Text color = %nColor4%) & (IF %%A==63 Echo Background color = %nColor6% & Echo. & Echo Text color = %nColor4%) & (IF %%A==64 Echo Background color = %nColor6% & Echo. & Echo Text color = %nColor4%) & (IF %%A==65 Echo Background color = %nColor6% & Echo. & Echo Text color = %nColor5%) & (IF %%A==66 Echo Background color = %nColor6% & Echo. & Echo Text color = %nColor6%) & (IF %%A==67 Echo Background color = %nColor6% & Echo. & Echo Text color = %nColor7%) & (IF %%A==68 Echo Background color = %nColor6% & Echo. & Echo Text color = %nColor8%) & (IF %%A==69 Echo Background color = %nColor6% & Echo. & Echo Text color = %nColor9%) & (IF %%A==6A Echo Background color = %nColor6% & Echo. & Echo Text color = %nColorA%) & (IF %%A==6B Echo Background color = %nColor6% & Echo. & Echo Text color = %nColorB%) & (IF %%A==6C Echo Background color = %nColor6% & Echo. & Echo Text color = %nColorC%) & (IF %%A==6D Echo Background color = %nColor6% & Echo. & Echo Text color = %nColorD%) & (IF %%A==6E Echo Background color = %nColor6% & Echo. & Echo Text color = %nColorE%) & (IF %%A==6F Echo Background color = %nColor6% & Echo. & Echo Text color = %nColorF%) & (IF %%A==70 Echo Background color = %nColor7% & Echo. & Echo Text color = %nColor0%) & (IF %%A==71 Echo Background color = %nColor7% & Echo. & Echo Text color = %nColor1%) & (IF %%A==72 Echo Background color = %nColor7% & Echo. & Echo Text color = %nColor4%) & (IF %%A==73 Echo Background color = %nColor7% & Echo. & Echo Text color = %nColor4%) & (IF %%A==74 Echo Background color = %nColor7% & Echo. & Echo Text color = %nColor4%) & (IF %%A==75 Echo Background color = %nColor7% & Echo. & Echo Text color = %nColor5%) & (IF %%A==76 Echo Background color = %nColor7% & Echo. & Echo Text color = %nColor6%) & (IF %%A==77 Echo Background color = %nColor7% & Echo. & Echo Text color = %nColor7%) & (IF %%A==78 Echo Background color = %nColor7% & Echo. & Echo Text color = %nColor8%) & (IF %%A==79 Echo Background color = %nColor7% & Echo. & Echo Text color = %nColor9%) & (IF %%A==7A Echo Background color = %nColor7% & Echo. & Echo Text color = %nColorA%) & (IF %%A==7B Echo Background color = %nColor7% & Echo. & Echo Text color = %nColorB%) & (IF %%A==7C Echo Background color = %nColor7% & Echo. & Echo Text color = %nColorC%) & (IF %%A==7D Echo Background color = %nColor7% & Echo. & Echo Text color = %nColorD%) & (IF %%A==7E Echo Background color = %nColor7% & Echo. & Echo Text color = %nColorE%) & (IF %%A==7F Echo Background color = %nColor7% & Echo. & Echo Text color = %nColorF%) & (IF %%A==80 Echo Background color = %nColor8% & Echo. & Echo Text color = %nColor0%) & (IF %%A==81 Echo Background color = %nColor8% & Echo. & Echo Text color = %nColor1%) & (IF %%A==82 Echo Background color = %nColor8% & Echo. & Echo Text color = %nColor4%) & (IF %%A==83 Echo Background color = %nColor8% & Echo. & Echo Text color = %nColor4%) & (IF %%A==84 Echo Background color = %nColor8% & Echo. & Echo Text color = %nColor4%) & (IF %%A==85 Echo Background color = %nColor8% & Echo. & Echo Text color = %nColor5%) & (IF %%A==86 Echo Background color = %nColor8% & Echo. & Echo Text color = %nColor6%) & (IF %%A==87 Echo Background color = %nColor8% & Echo. & Echo Text color = %nColor7%) & (IF %%A==88 Echo Background color = %nColor8% & Echo. & Echo Text color = %nColor8%) & (IF %%A==89 Echo Background color = %nColor8% & Echo. & Echo Text color = %nColor9%) & (IF %%A==8A Echo Background color = %nColor8% & Echo. & Echo Text color = %nColorA%) & (IF %%A==8B Echo Background color = %nColor8% & Echo. & Echo Text color = %nColorB%) & (IF %%A==8C Echo Background color = %nColor8% & Echo. & Echo Text color = %nColorC%) & (IF %%A==8D Echo Background color = %nColor8% & Echo. & Echo Text color = %nColorD%) & (IF %%A==8E Echo Background color = %nColor8% & Echo. & Echo Text color = %nColorE%) & (IF %%A==8F Echo Background color = %nColor8% & Echo. & Echo Text color = %nColorF%) & (IF %%A==90 Echo Background color = %nColor9% & Echo. & Echo Text color = %nColor0%) & (IF %%A==91 Echo Background color = %nColor9% & Echo. & Echo Text color = %nColor1%) & (IF %%A==92 Echo Background color = %nColor9% & Echo. & Echo Text color = %nColor4%) & (IF %%A==93 Echo Background color = %nColor9% & Echo. & Echo Text color = %nColor4%) & (IF %%A==94 Echo Background color = %nColor9% & Echo. & Echo Text color = %nColor4%) & (IF %%A==95 Echo Background color = %nColor9% & Echo. & Echo Text color = %nColor5%) & (IF %%A==96 Echo Background color = %nColor9% & Echo. & Echo Text color = %nColor6%) & (IF %%A==97 Echo Background color = %nColor9% & Echo. & Echo Text color = %nColor7%) & (IF %%A==98 Echo Background color = %nColor9% & Echo. & Echo Text color = %nColor8%) & (IF %%A==99 Echo Background color = %nColor9% & Echo. & Echo Text color = %nColor9%) & (IF %%A==9A Echo Background color = %nColor9% & Echo. & Echo Text color = %nColorA%) & (IF %%A==9B Echo Background color = %nColor9% & Echo. & Echo Text color = %nColorB%) & (IF %%A==9C Echo Background color = %nColor9% & Echo. & Echo Text color = %nColorC%) & (IF %%A==9D Echo Background color = %nColor9% & Echo. & Echo Text color = %nColorD%) & (IF %%A==9E Echo Background color = %nColor9% & Echo. & Echo Text color = %nColorE%) & (IF %%A==9F Echo Background color = %nColor9% & Echo. & Echo Text color = %nColorF%) & (IF %%A==A0 Echo Background color = %nColorA% & Echo. & Echo Text color = %nColor0%) & (IF %%A==A1 Echo Background color = %nColorA% & Echo. & Echo Text color = %nColor1%) & (IF %%A==A2 Echo Background color = %nColorA% & Echo. & Echo Text color = %nColor4%) & (IF %%A==A3 Echo Background color = %nColorA% & Echo. & Echo Text color = %nColor4%) & (IF %%A==A4 Echo Background color = %nColorA% & Echo. & Echo Text color = %nColor4%) & (IF %%A==A5 Echo Background color = %nColorA% & Echo. & Echo Text color = %nColor5%) & (IF %%A==A6 Echo Background color = %nColorA% & Echo. & Echo Text color = %nColor6%) & (IF %%A==A7 Echo Background color = %nColorA% & Echo. & Echo Text color = %nColor7%) & (IF %%A==A8 Echo Background color = %nColorA% & Echo. & Echo Text color = %nColor8%) & (IF %%A==A9 Echo Background color = %nColorA% & Echo. & Echo Text color = %nColor9%) & (IF %%A==AA Echo Background color = %nColorA% & Echo. & Echo Text color = %nColorA%) & (IF %%A==AB Echo Background color = %nColorA% & Echo. & Echo Text color = %nColorB%) & (IF %%A==AC Echo Background color = %nColorA% & Echo. & Echo Text color = %nColorC%) & (IF %%A==AD Echo Background color = %nColorA% & Echo. & Echo Text color = %nColorD%) & (IF %%A==AE Echo Background color = %nColorA% & Echo. & Echo Text color = %nColorE%) & (IF %%A==AF Echo Background color = %nColorA% & Echo. & Echo Text color = %nColorF%) & (IF %%A==B0 Echo Background color = %nColorB% & Echo. & Echo Text color = %nColor0%) & (IF %%A==B1 Echo Background color = %nColorB% & Echo. & Echo Text color = %nColor1%) & (IF %%A==B2 Echo Background color = %nColorB% & Echo. & Echo Text color = %nColor4%) & (IF %%A==B3 Echo Background color = %nColorB% & Echo. & Echo Text color = %nColor4%) & (IF %%A==B4 Echo Background color = %nColorB% & Echo. & Echo Text color = %nColor4%) & (IF %%A==B5 Echo Background color = %nColorB% & Echo. & Echo Text color = %nColor5%) & (IF %%A==B6 Echo Background color = %nColorB% & Echo. & Echo Text color = %nColor6%) & (IF %%A==B7 Echo Background color = %nColorB% & Echo. & Echo Text color = %nColor7%) & (IF %%A==B8 Echo Background color = %nColorB% & Echo. & Echo Text color = %nColor8%) & (IF %%A==B9 Echo Background color = %nColorB% & Echo. & Echo Text color = %nColor9%) & (IF %%A==BA Echo Background color = %nColorB% & Echo. & Echo Text color = %nColorA%) & (IF %%A==BB Echo Background color = %nColorB% & Echo. & Echo Text color = %nColorB%) & (IF %%A==BC Echo Background color = %nColorB% & Echo. & Echo Text color = %nColorC%) & (IF %%A==BD Echo Background color = %nColorB% & Echo. & Echo Text color = %nColorD%) & (IF %%A==BE Echo Background color = %nColorB% & Echo. & Echo Text color = %nColorE%) & (IF %%A==BF Echo Background color = %nColorB% & Echo. & Echo Text color = %nColorF%) & (IF %%A==C0 Echo Background color = %nColorC% & Echo. & Echo Text color = %nColor0%) & (IF %%A==C1 Echo Background color = %nColorC% & Echo. & Echo Text color = %nColor1%) & (IF %%A==C2 Echo Background color = %nColorC% & Echo. & Echo Text color = %nColor4%) & (IF %%A==C3 Echo Background color = %nColorC% & Echo. & Echo Text color = %nColor4%) & (IF %%A==C4 Echo Background color = %nColorC% & Echo. & Echo Text color = %nColor4%) & (IF %%A==C5 Echo Background color = %nColorC% & Echo. & Echo Text color = %nColor5%) & (IF %%A==C6 Echo Background color = %nColorC% & Echo. & Echo Text color = %nColor6%) & (IF %%A==C7 Echo Background color = %nColorC% & Echo. & Echo Text color = %nColor7%) & (IF %%A==C8 Echo Background color = %nColorC% & Echo. & Echo Text color = %nColor8%) & (IF %%A==C9 Echo Background color = %nColorC% & Echo. & Echo Text color = %nColor9%) & (IF %%A==CA Echo Background color = %nColorC% & Echo. & Echo Text color = %nColorA%) & (IF %%A==CB Echo Background color = %nColorC% & Echo. & Echo Text color = %nColorB%) & (IF %%A==CC Echo Background color = %nColorC% & Echo. & Echo Text color = %nColorC%) & (IF %%A==CD Echo Background color = %nColorC% & Echo. & Echo Text color = %nColorD%) & (IF %%A==CE Echo Background color = %nColorC% & Echo. & Echo Text color = %nColorE%) & (IF %%A==CF Echo Background color = %nColorC% & Echo. & Echo Text color = %nColorF%) & (IF %%A==D0 Echo Background color = %nColorD% & Echo. & Echo Text color = %nColor0%) & (IF %%A==D1 Echo Background color = %nColorD% & Echo. & Echo Text color = %nColor1%) & (IF %%A==D2 Echo Background color = %nColorD% & Echo. & Echo Text color = %nColor4%) & (IF %%A==D3 Echo Background color = %nColorD% & Echo. & Echo Text color = %nColor4%) & (IF %%A==D4 Echo Background color = %nColorD% & Echo. & Echo Text color = %nColor4%) & (IF %%A==D5 Echo Background color = %nColorD% & Echo. & Echo Text color = %nColor5%) & (IF %%A==D6 Echo Background color = %nColorD% & Echo. & Echo Text color = %nColor6%) & (IF %%A==D7 Echo Background color = %nColorD% & Echo. & Echo Text color = %nColor7%) & (IF %%A==D8 Echo Background color = %nColorD% & Echo. & Echo Text color = %nColor8%) & (IF %%A==D9 Echo Background color = %nColorD% & Echo. & Echo Text color = %nColor9%) & (IF %%A==DA Echo Background color = %nColorD% & Echo. & Echo Text color = %nColorA%) & (IF %%A==DB Echo Background color = %nColorD% & Echo. & Echo Text color = %nColorB%) & (IF %%A==DC Echo Background color = %nColorD% & Echo. & Echo Text color = %nColorC%) & (IF %%A==DD Echo Background color = %nColorD% & Echo. & Echo Text color = %nColorD%) & (IF %%A==DE Echo Background color = %nColorD% & Echo. & Echo Text color = %nColorE%) & (IF %%A==DF Echo Background color = %nColorD% & Echo. & Echo Text color = %nColorF%) & (IF %%A==E0 Echo Background color = %nColorE% & Echo. & Echo Text color = %nColor0%) & (IF %%A==E1 Echo Background color = %nColorE% & Echo. & Echo Text color = %nColor1%) & (IF %%A==E2 Echo Background color = %nColorE% & Echo. & Echo Text color = %nColor4%) & (IF %%A==E3 Echo Background color = %nColorE% & Echo. & Echo Text color = %nColor4%) & (IF %%A==E4 Echo Background color = %nColorE% & Echo. & Echo Text color = %nColor4%) & (IF %%A==E5 Echo Background color = %nColorE% & Echo. & Echo Text color = %nColor5%) & (IF %%A==E6 Echo Background color = %nColorE% & Echo. & Echo Text color = %nColor6%) & (IF %%A==E7 Echo Background color = %nColorE% & Echo. & Echo Text color = %nColor7%) & (IF %%A==E8 Echo Background color = %nColorE% & Echo. & Echo Text color = %nColor8%) & (IF %%A==E9 Echo Background color = %nColorE% & Echo. & Echo Text color = %nColor9%) & (IF %%A==EA Echo Background color = %nColorE% & Echo. & Echo Text color = %nColorA%) & (IF %%A==EB Echo Background color = %nColorE% & Echo. & Echo Text color = %nColorB%) & (IF %%A==EC Echo Background color = %nColorE% & Echo. & Echo Text color = %nColorC%) & (IF %%A==ED Echo Background color = %nColorE% & Echo. & Echo Text color = %nColorD%) & (IF %%A==EE Echo Background color = %nColorE% & Echo. & Echo Text color = %nColorE%) & (IF %%A==EF Echo Background color = %nColorE% & Echo. & Echo Text color = %nColorF%) & (IF %%A==F0 Echo Background color = %nColorF% & Echo. & Echo Text color = %nColor0%) & (IF %%A==F1 Echo Background color = %nColorF% & Echo. & Echo Text color = %nColor1%) & (IF %%A==F2 Echo Background color = %nColorF% & Echo. & Echo Text color = %nColor4%) & (IF %%A==F3 Echo Background color = %nColorF% & Echo. & Echo Text color = %nColor4%) & (IF %%A==F4 Echo Background color = %nColorF% & Echo. & Echo Text color = %nColor4%) & (IF %%A==F5 Echo Background color = %nColorF% & Echo. & Echo Text color = %nColor5%) & (IF %%A==F6 Echo Background color = %nColorF% & Echo. & Echo Text color = %nColor6%) & (IF %%A==F7 Echo Background color = %nColorF% & Echo. & Echo Text color = %nColor7%) & (IF %%A==F8 Echo Background color = %nColorF% & Echo. & Echo Text color = %nColor8%) & (IF %%A==F9 Echo Background color = %nColorF% & Echo. & Echo Text color = %nColor9%) & (IF %%A==FA Echo Background color = %nColorF% & Echo. & Echo Text color = %nColorA%) & (IF %%A==FB Echo Background color = %nColorF% & Echo. & Echo Text color = %nColorB%) & (IF %%A==FC Echo Background color = %nColorF% & Echo. & Echo Text color = %nColorC%) & (IF %%A==FD Echo Background color = %nColorF% & Echo. & Echo Text color = %nColorD%) & (IF %%A==FE Echo Background color = %nColorF% & Echo. & Echo Text color = %nColorE%) & (IF %%A==FF Echo Background color = %nColorF% & Echo. & Echo Text color = %nColorF%)) & Echo. & Echo. & Echo %Statement% & Echo. & Echo. & Echo. & Timeout /T %ts% && cls
Color 8F
Goto Back
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:Random
cls
mode con:cols=50 lines=10
Echo.
Echo Color: %Color1%%Color2%
IF %Color1%==%Color2% COLOR 0F
IF %Color1%==%Color2% Echo Can not be same color!
Echo.
Echo.
Timeout /T %PS%
cls
mode con:cols=51 lines=38
IF %Color1%==%Color2% (SET Color1=NotSet & SET Color2=NotSet)
IF %Color1%==%Color2% GoTo Random1
SET sColor=%Color1%%Color2%
Color %Color1%%Color2%
Echo.
Echo **************************************************
Echo       Location: Random
Echo **************************************************
Echo.
Echo Color code is %sColor%
Echo Color Scheme is:
Echo -------------------------
Echo Background: %nColor1%
Echo Text      : %nColor2%
:: Find the COLOR CLASS
ECHO %BESTCOLORS% | (FIND "%sColor%" >nul 2>nul) && (ECHO Color Class: Best) && GoTo skipRCC
ECHO %GoodColors% | (FIND "%sColor%" >nul 2>nul) && (ECHO Color Class: Good) && GoTo skipRCC
ECHO %MARGINALCOLORS% | (FIND "%sColor%" >nul 2>nul) && (ECHO Color Class: Marginal) && GoTo skipRCC
ECHO %SOLIDCOLORS% | (FIND "%sColor%" >nul 2>nul) && (ECHO Color Class: Solid) && GoTo skipRCC
:skipRCC
SET /A Counter+=1
SET /A Remaining=%iterations%-%Counter%
ECHO.
Echo Counter Number = %Counter%
Echo Remaining Iterations = %Remaining%
Echo Total Iterations = %iterations%
Echo.
Echo.
ECHO ##################################################
Echo %Statement%
ECHO ##################################################
Echo.
@Timeout /T %ts%
IF %COUNTER%==%iterations% Echo No more iterations!
IF %COUNTER%==%iterations% GoTo ResetRan
GoTo Random1
::
::	Subroutines
::		Random Routine for first number
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:Random1
cls
mode con:cols=50 lines=15

Echo.
Echo Getting the first random color...
(@powershell get-random -input 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, A, B, C, D, E, F) > %TEMP%\Color1.txt
SET /P COLOR1= < %TEMP%\Color1.txt

Echo.
Echo First Seed color is %COLOR1%
Echo.
Echo.
Echo.
Timeout /T %PS%
::
IF "%COLOR1%"=="%cColor0%" SET nColor1=%nColor0%
IF "%COLOR1%"=="%cColor0%" GoTo Random2

IF "%COLOR1%"=="%cColor1%" SET nColor1=%nColor1%
IF "%COLOR1%"=="%cColor1%" GoTo Random2

IF "%COLOR1%"=="%cColor2%" SET nColor1=%nColor2%
IF "%COLOR1%"=="%cColor2%" GoTo Random2

IF "%COLOR1%"=="%cColor3%" SET nColor1=%nColor3%
IF "%COLOR1%"=="%cColor3%" GoTo Random2

IF "%COLOR1%"=="%cColor4%" SET nColor1=%nColor4%
IF "%COLOR1%"=="%cColor4%" GoTo Random2

IF "%COLOR1%"=="%cColor5%" SET nColor1=%nColor5%
IF "%COLOR1%"=="%cColor5%" GoTo Random2

IF "%COLOR1%"=="%cColor6%" SET nColor1=%nColor6%
IF "%COLOR1%"=="%cColor6%" GoTo Random2

IF "%COLOR1%"=="%cColor7%" SET nColor1=%nColor7%
IF "%COLOR1%"=="%cColor7%" GoTo Random2

IF "%COLOR1%"=="%cColor8%" SET nColor1=%nColor8%
IF "%COLOR1%"=="%cColor8%" GoTo Random2

IF "%COLOR1%"=="%cColor9%" SET nColor1=%nColor9%
IF "%COLOR1%"=="%cColor9%" GoTo Random2

IF "%COLOR1%"=="%cColorA%" SET nColor1=%nColorA%
IF "%COLOR1%"=="%cColorA%" GoTo Random2

IF "%COLOR1%"=="%cColorB%" SET nColor1=%nColorB%
IF "%COLOR1%"=="%cColorB%" GoTo Random2

IF "%COLOR1%"=="%cColorC%" SET nColor1=%nColorC%
IF "%COLOR1%"=="%cColorC%" GoTo Random2

IF "%COLOR1%"=="%cColorD%" SET nColor1=%nColorD%
IF "%COLOR1%"=="%cColorD%" GoTo Random2

IF "%COLOR1%"=="%cColorE%" SET nColor1=%nColorE%
IF "%COLOR1%"=="%cColorE%" GoTo Random2

IF "%COLOR1%"=="%cColorF%" SET nColor1=%nColorF%
IF "%COLOR1%"=="%cColorF%" GoTo Random2

IF NOT DEFINED Color1 Echo An Error occured generating the first random color!
GoTo menu
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:Random2
cls
mode con:cols=50 lines=15
Echo.
Echo Getting the second random color...
(@powershell get-random -input 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, A, B, C, D, E, F) > %TEMP%\Color2.txt
SET /P COLOR2= < %TEMP%\Color2.txt
Echo.
:: SET rNumber2=%RANDOM%
Echo Seed color is %COLOR2%
Echo.
Echo.
Echo.
Timeout /T %PS%
::
IF "%COLOR2%"=="%cColor0%" SET nColor2=%nColor0%
IF "%COLOR2%"=="%cColor0%" GoTo Random

IF "%COLOR2%"=="%cColor1%" SET nColor2=%nColor1%
IF "%COLOR2%"=="%cColor1%" GoTo Random

IF "%COLOR2%"=="%cColor2%" SET nColor2=%nColor2%
IF "%COLOR2%"=="%cColor2%" GoTo Random

IF "%COLOR2%"=="%cColor3%" SET nColor2=%nColor3%
IF "%COLOR2%"=="%cColor3%" GoTo Random

IF "%COLOR2%"=="%cColor4%" SET nColor2=%nColor4%
IF "%COLOR2%"=="%cColor4%" GoTo Random

IF "%COLOR2%"=="%cColor5%" SET nColor2=%nColor5%
IF "%COLOR2%"=="%cColor5%" GoTo Random

IF "%COLOR2%"=="%cColor6%" SET nColor2=%nColor6%
IF "%COLOR2%"=="%cColor6%" GoTo Random

IF "%COLOR2%"=="%cColor7%" SET nColor2=%nColor7%
IF "%COLOR2%"=="%cColor7%" GoTo Random

IF "%COLOR2%"=="%cColor8%" SET nColor2=%nColor8%
IF "%COLOR2%"=="%cColor8%" GoTo Random

IF "%COLOR2%"=="%cColor9%" SET nColor2=%nColor9%
IF "%COLOR2%"=="%cColor9%" GoTo Random

IF "%COLOR2%"=="%cColorA%" SET nColor2=%nColorA%
IF "%COLOR2%"=="%cColorA%" GoTo Random

IF "%COLOR2%"=="%cColorB%" SET nColor2=%nColorB%
IF "%COLOR2%"=="%cColorB%" GoTo Random

IF "%COLOR2%"=="%cColorC%" SET nColor2=%nColorC%
IF "%COLOR2%"=="%cColorC%" GoTo Random

IF "%COLOR2%"=="%cColorD%" SET nColor2=%nColorD%
IF "%COLOR2%"=="%cColorD%" GoTo Random

IF "%COLOR2%"=="%cColorE%" SET nColor2=%nColorE%
IF "%COLOR2%"=="%cColorE%" GoTo Random

IF "%COLOR2%"=="%cColorF%" SET nColor2=%nColorF%
IF "%COLOR2%"=="%cColorF%" GoTo Random

IF NOT DEFINED Color2 Echo An Error occured generating the second random color!

Echo.
Echo.
Timeout /T %PS%
GoTo Back
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:ResetRan
SET Counter=0
GoTo Back
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:Back
GoTo Menu
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:manual
cls
IF DEFINED BACKGROUND_COLOR IF DEFINED TEXT_COLOR (COLOR %BACKGROUND_COLOR%%TEXT_COLOR%) ELSE (IF NOT DEFINED COLOR1 IF NOT DEFINED COLOR2 Color 8F)
mode con:cols=50 lines=40
Echo *************************************************
Echo Location: Manual Color
Echo *************************************************
Echo.
ECHO Incoming Color Selection:
IF DEFINED BACKGROUND_COLOR Echo Background color: %BACKGROUND_COLOR%
IF DEFINED TEXT_COLOR Echo Text color: %TEXT_COLOR%
Echo -------------------------------------------------
ECHO.
ECHO These are the best color combinations:
ECHO.
FOR /F "tokens=* delims= " %%C IN ("%bestColors%") DO ECHO %%C
ECHO #################################################
ECHO.
ECHO %STATEMENT%
Echo _________________________________________________
ECHO.
SET /P BACKGROUND_COLOR=Background Color:
SET /P TEXT_COLOR=Text Color:
SET MANUAL_COLOR=%BACKGROUND_COLOR%%TEXT_COLOR%
COLOR %BACKGROUND_COLOR%%TEXT_COLOR%
:: Get the background color name
IF "%BACKGROUND_COLOR%"=="%cColor0%" SET mColorB=%nColor0%
IF "%BACKGROUND_COLOR%"=="%cColor1%" SET mColorB=%nColor1%
IF "%BACKGROUND_COLOR%"=="%cColor2%" SET mColorB=%nColor2%
IF "%BACKGROUND_COLOR%"=="%cColor3%" SET mColorB=%nColor3%
IF "%BACKGROUND_COLOR%"=="%cColor4%" SET mColorB=%nColor4%
IF "%BACKGROUND_COLOR%"=="%cColor5%" SET mColorB=%nColor5%
IF "%BACKGROUND_COLOR%"=="%cColor6%" SET mColorB=%nColor6%
IF "%BACKGROUND_COLOR%"=="%cColor7%" SET mColorB=%nColor7%
IF "%BACKGROUND_COLOR%"=="%cColor8%" SET mColorB=%nColor8%
IF "%BACKGROUND_COLOR%"=="%cColor9%" SET mColorB=%nColor9%
IF "%BACKGROUND_COLOR%"=="%cColorA%" SET mColorB=%nColorA%
IF "%BACKGROUND_COLOR%"=="%cColorB%" SET mColorB=%nColorB%
IF "%BACKGROUND_COLOR%"=="%cColorC%" SET mColorB=%nColorC%
IF "%BACKGROUND_COLOR%"=="%cColorD%" SET mColorB=%nColorD%
IF "%BACKGROUND_COLOR%"=="%cColorE%" SET mColorB=%nColorE%
IF "%BACKGROUND_COLOR%"=="%cColorF%" SET mColorB=%nColorF%
:: Get the text color name
IF "%TEXT_COLOR%"=="%cColor0%" SET mColorT=%nColor0%
IF "%TEXT_COLOR%"=="%cColor1%" SET mColorT=%nColor1%
IF "%TEXT_COLOR%"=="%cColor2%" SET mColorT=%nColor2%
IF "%TEXT_COLOR%"=="%cColor3%" SET mColorT=%nColor3%
IF "%TEXT_COLOR%"=="%cColor4%" SET mColorT=%nColor4%
IF "%TEXT_COLOR%"=="%cColor5%" SET mColorT=%nColor5%
IF "%TEXT_COLOR%"=="%cColor6%" SET mColorT=%nColor6%
IF "%TEXT_COLOR%"=="%cColor7%" SET mColorT=%nColor7%
IF "%TEXT_COLOR%"=="%cColor8%" SET mColorT=%nColor8%
IF "%TEXT_COLOR%"=="%cColor9%" SET mColorT=%nColor9%
IF "%TEXT_COLOR%"=="%cColorA%" SET mColorT=%nColorA%
IF "%TEXT_COLOR%"=="%cColorB%" SET mColorT=%nColorB%
IF "%TEXT_COLOR%"=="%cColorC%" SET mColorT=%nColorC%
IF "%TEXT_COLOR%"=="%cColorD%" SET mColorT=%nColorD%
IF "%TEXT_COLOR%"=="%cColorE%" SET mColorT=%nColorE%
IF "%TEXT_COLOR%"=="%cColorF%" SET mColorT=%nColorF%
ECHO.
ECHO %MARGINALCOLORS% | (FIND "%MANUAL_COLOR%" >nul 2>nul) && (COLOR 8F) && (ECHO That is a marginal color choice! Back to default color.) && (ECHO.)
ECHO %SOLIDCOLORS% | (FIND "%MANUAL_COLOR%" >nul 2>nul) && (COLOR 8F) && (ECHO That is a solid color combo that can't be viewed! Back to default color.) && (ECHO.)
ECHO %MARGINALCOLORS% | (FIND "%MANUAL_COLOR%" >nul 2>nul) && PAUSE
ECHO %SOLIDCOLORS% | (FIND "%MANUAL_COLOR%" >nul 2>nul) && PAUSE
ECHO %MARGINALCOLORS% | (FIND "%MANUAL_COLOR%" >nul 2>nul) && GoTo manual
ECHO %SOLIDCOLORS% | (FIND "%MANUAL_COLOR%" >nul 2>nul) && GoTo manual
ECHO Background: %BACKGROUND_COLOR% [%mColorB%]
ECHO Text:       %TEXT_COLOR% [%mColorT%]
ECHO.
PAUSE
GoTo menu
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:EOF
cls
mode con:cols=55 lines=25
Echo.
ECHO %SCRIPT_NAME%
Echo.
ECHO Developed by:
Echo.
ECHO David Geeraerts {dgeeraerts@gmail.com}
ECHO.
ECHO.
ECHO Contributors:
ECHO.
Echo.
Echo.
ECHO.
ECHO Copyleft License
ECHO GNU GPL (General Public License)
ECHO https://www.gnu.org/licenses/gpl-3.0.en.html
Echo.
Timeout /T 60
ENDLOCAL
Exit