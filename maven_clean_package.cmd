REM requires JDK7 or better - http://www.oracle.com/technetwork/java/javase/downloads/java-archive-downloads-javase7-521261.html
REM requires Maven in your path - http://maven.apache.org/download.cgi
SET PATH=%PATH%;%USERPROFILE%\Downloads\apache-maven-3.5.0\bin
CALL mvn clean package
PAUSE
