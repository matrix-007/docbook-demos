#!/bin/sh
CLASSPATH=avalon-framework-4.2.0.jar:batik-all-1.7.jar:commons-io-1.3.1.jar:commons-logging-1.0.4.jar:fop.jar:serializer-2.7.0.jar:servlet-2.2.jar:xalan-2.7.0.jar:xercesImpl-2.7.1.jar:xml-apis-1.3.04.jar:xml-apis-ext-1.3.04.jar:xmlgraphics-commons-1.5.jar

# 定义一个方法
foreachd(){
    # 遍历参数1
    for file in "$1"/*
    do
    # 如果是目录就打印处理，然后继续遍历，递归调用
        if [ -d "$file" ]
        then
            echo $file
            foreachd "$file"
        else
            echo "file:" $file
            prefix=${file##*.}
            if [ $prefix = "ttf" ]
            then
                echo "${file%.*}-metrics.xml"
                java org.apache.fop.fonts.apps.TTFReader "$file" "${file%.*}-metrics.xml"
                #
                #	<font>
				#			<name>Courier New</name>
				#			<style>normal</style>
				#			<weight>normal</weight>
				#			<embedFile>${workDirectory}/styles/fonts/Courier/cour.ttf</embedFile>
			    #			<metricsFile>${workDirectory}/styles/fonts/Courier/courier.xml</metricsFile>
				#		</font>
                #
                tmp=${file%/*}
                filename=${file##*/}
                tmp=${tmp##*/}
                echo "<font>" >> a.xml
                echo "  <name>${tmp}</name>" >> a.xml
                echo "  <style>normal</style>" >> a.xml
                echo "  <weight>normal</weight>" >> a.xml
                echo "  <embedFile>"'${workDirectory}/fonts/'"$tmp/${filename}</embedFile>" >> a.xml
                filename=${filename%.*}
                echo "  <metricsFile>"'${workDirectory}/fonts/'"$tmp/${filename}-metrics.xml</metricsFile>" >> a.xml
                echo "</font>" >> a.xml
            fi
            if [ $prefix = "xml" ]
            then
                echo "rm $file."
                rm "$file"
            fi
        fi
    done
}

# 执行，如果有参数就遍历指定的目录，否则遍历当前目录
foreachd "$1"
