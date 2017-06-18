@ECHO OFF

SET PATH=%PATH%;c:\cygwin64\bin

CALL clean.cmd

ECHO Generating C++ REST Client...

SET OUT_DIR=%CD%
SET SW_DIR=%CD%\..\..


REM Generate API

SET OUT_GEN=cpprest
SET OUT_NAME=chromasdk_%OUT_GEN%
SET OUT_URL=https://raw.githubusercontent.com/tgraupmann/ChromaSwaggerDefinition/master/api/swagger/swagger.yaml
SET PACKAGE=ChromaPackage
SET NAMESPACE=ChromaSDK
SET MODEL=%PACKAGE%.Model
SET APINAME=ChromaApi
call:genFunc


REM Generate Razer endpoint

SET OUT_GEN=cpprest
SET OUT_NAME=razer_%OUT_GEN%
SET OUT_URL=https://raw.githubusercontent.com/tgraupmann/ChromaSwaggerDefinition/master/api/swagger/swagger_razer.yaml
SET PACKAGE=ChromaPackage
SET NAMESPACE=RazerSDK
SET MODEL=%PACKAGE%.Model
SET LEVEL=2
SET APINAME=RazerApi
call:genFunc


ECHO Clients Generated [DONE]

PAUSE
EXIT

:genFunc
ECHO Generating (%OUT_NAME%)...
CD "%OUT_DIR%"
REM PAUSE
cd "%SW_DIR%"
REM CALL java -jar modules\swagger-codegen-cli\target\swagger-codegen-cli.jar help
REM CALL java -jar modules\swagger-codegen-cli\target\swagger-codegen-cli.jar config-help -l %OUT_GEN%
REM CALL java -jar modules\swagger-codegen-cli\target\swagger-codegen-cli.jar generate -i "%OUT_URL%" -l %OUT_GEN% -o "%OUT_DIR%\%OUT_NAME%" --api-package %PACKAGE% --model-package %MODEL% -DtargetFramework=v3.5
CALL java -jar modules\swagger-codegen-cli\target\swagger-codegen-cli.jar generate -i "%OUT_URL%" -l %OUT_GEN% -o "%OUT_DIR%\%OUT_NAME%" --api-package %PACKAGE% --model-package %MODEL% -DpackageName=%NAMESPACE%,optionalAssemblyInfo=false,apiLevel=%LEVEL%,apiName=%APINAME%,excludeTests=true
ECHO Generated (%OUT_NAME%) [DONE]
GOTO:eof
