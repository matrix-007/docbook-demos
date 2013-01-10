#!/bin/sh
CLASSPATH=avalon-framework-4.2.0.jar:batik-all-1.7.jar:commons-io-1.3.1.jar:commons-logging-1.0.4.jar:fop.jar:serializer-2.7.0.jar:servlet-2.2.jar:xalan-2.7.0.jar:xercesImpl-2.7.1.jar:xml-apis-1.3.04.jar:xml-apis-ext-1.3.04.jar:xmlgraphics-commons-1.5.jar
file="../fonts/SimSun/simsun.ttf"
java org.apache.fop.fonts.apps.TTFReader "$file" "${file%.*}-metrics.xml"
tmp=${file%/*}
 filename=${file##*/}
tmp=${tmp##*/}
echo "<font>" >> simsun.xml
echo "  <name>${tmp}</name>" >> simsun.xml
echo "  <style>normal</style>" >> simsun.xml
echo "  <weight>normal</weight>" >> simsun.xml
echo "  <embedFile>"'${workDirectory}/fonts/'"$tmp/${filename}</embedFile>" >> simsun.xml
filename=${filename%.*}
echo "  <metricsFile>"'${workDirectory}/fonts/'"$tmp/${filename}-metrics.xml</metricsFile>" >> simsun.xml
echo "</font>" >> simsun.xml

