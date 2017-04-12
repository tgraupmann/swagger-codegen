@ECHO OFF

SET PATH=%PATH%;c:\cygwin64\bin

CALL clean.cmd

ECHO Generating JAVA Clients...

SET OUT_DIR=%CD%
SET SW_DIR=%CD%\..\..

SET OUT_NAME=arena_client
SET OUT_URL=https://client.arena.razerzone.com/swagger/docs/v1
SET PACKAGE=com.razerzone.sdk.arena.client.swagger
call:genFunc

SET OUT_NAME=arena_control
SET OUT_URL=https://control.arena.razerzone.com/swagger/docs/v1
SET PACKAGE=com.razerzone.sdk.arena.control.swagger
call:genFunc

SET OUT_NAME=arena_game_server
SET OUT_URL=https://gameserver.arena.razerzone.com/swagger/docs/v1
SET PACKAGE=com.razerzone.sdk.arena.gameserver.swagger
call:genFunc

SET OUT_NAME=arena_polling
SET OUT_URL=https://polling.arena.razerzone.com/swagger/docs/v1
SET PACKAGE=com.razerzone.sdk.arena.polling.swagger
call:genFunc

ECHO JAVA Clients Generated [DONE]

PAUSE
EXIT

:genFunc
ECHO Generating (%OUT_NAME%)...
CD "%OUT_DIR%"
REM PAUSE
cd "%SW_DIR%"
CALL java -jar modules\swagger-codegen-cli\target\swagger-codegen-cli.jar generate -i "%OUT_URL%" -l java -o "%OUT_DIR%\%OUT_NAME%" --api-package %PACKAGE% --model-package %PACKAGE%.model
ECHO Generated (%OUT_NAME%) [DONE]
GOTO:eof
