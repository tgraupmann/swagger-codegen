@ECHO OFF

ECHO Generating JAVA Clients...

SET OUT_DIR=%CD%
SET SW_DIR=%CD%\..\..

SET OUT_NAME=arena_client
SET OUT_URL=https://client.staging.arena.razerzone.com/swagger/docs/v1
call:genFunc

SET OUT_NAME=arena_control
SET OUT_URL=https://control.staging.arena.razerzone.com/swagger/docs/v1
call:genFunc

SET OUT_NAME=arena_game_server
SET OUT_URL=https://gameserver.staging.arena.razerzone.com/swagger/docs/v1
call:genFunc

SET OUT_NAME=arena_polling
SET OUT_URL=https://polling.staging.arena.razerzone.com/swagger/docs/v1
call:genFunc

ECHO JAVA Clients Generated [DONE]

PAUSE
EXIT

:genFunc
ECHO Generating (%OUT_NAME%)...
CD "%OUT_DIR%"
CALL rm -r -f "%OUT_NAME%"
REM PAUSE
cd "%SW_DIR%"
CALL java -jar modules\swagger-codegen-cli\target\swagger-codegen-cli.jar generate -i "%OUT_URL%" -l java -o "%OUT_DIR%\%OUT_NAME%"
ECHO Generated (%OUT_NAME%) [DONE]
GOTO:eof
