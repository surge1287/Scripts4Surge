REM Script created by S Dedman 01/12/16
REM Assign to a Scheduled Task, repeating every 30 minutes
REM Will reboot the Streaming Server if the internet connection goes down

echo off
echo Surge StreamReboot (v1), by Sam Dedman 

REM Checking to see if Google can be reached as a reliable internet test
echo Pinging www.google.co.uk to determine internet connectivity
ping www.google.co.uk
IF ERRORLEVEL 1 goto CONNECT2
IF ERRORLEVEL 0 goto CLEAR1

REM Checking to see if BBC can be reached, as a second opinion
:CONNECT2
echo www.google.co.uk unavailable, testing www.bbc.co.uk to verify
ping www.bbc.co.uk
IF ERRORLEVEL 1 goto RESTART
IF ERRORLEVEL 0 goto CLEAR2

REM Putting the PC in for a reboot, which should resolve the issue
:RESTART
echo Server is likely offline as of %time% on %date%. REBOOTING IN 10 SECONDS
shutdown -R -T 10

REM Connection is live, so script will close
:CLEAR1
echo Server is online as of %time% on %date%. SCRIPT WILL CLOSE IN 10 SECONDS
timeout 10
exit

REM Connection is live, so script will close
:CLEAR2
echo Server is likely online as of %time% on %date%. SCRIPT WILL CLOSE IN 10 SECONDS
timeout 10
exit