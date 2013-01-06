=========================================================
helloAus sicherer Quelle - Dokumentation mit DocBook und Maven 
=========================================================

Autoren: 
Nico Alpert <nico.alpert@conceptpeople.de>
Bjarne Jansen <bjarne.jansen@conceptpeople.de>


Im folgenden wird beschrieben, wie das Maven-Beispielprojekt aufgesetzt
wird, dass die Dokumentation in drei verschiedenen Ausgabeformaten aus 
einer DocBook-Datei erzeugt. 


==================
Inhaltsverzeichnis
==================

	1. Installationsanleitung

	2. Dokumentation über die Konsole erzeugen

	3. Dokumentation über Eclipse erzeugen

	4. Dokumentation bearbeiten
	
	5. Für Eilige

	6. Für sehr Eilige


=========================
1. Installationsanleitung
=========================

Für die Erzeugung der Dokumentation wird mindestens eine Java-Runtime 
und Apache Maven benötigt.

Ersteres sollte auf fast jedem Rechner bereits installiert sein und kann 
unter http://www.oracle.com/technetwork/java/javase/downloads/index.html
heruntergeladen werden.

Apache Maven steht unter http://maven.apache.org/download.html zum
Download bereit. Das Beispielprojekt sollte sowohl mit Maven 2 als 
auch mit Maven 3 funktionieren.

Sollte nach der Installation die Systemvariable MAVEN_HOME noch nicht 
gesetzt sein, muss diese hinzugefügt werden. Die Variable zeigt auf den 
Installationsordner von Apache Maven.


==========================================
2. Dokumentation über die Konsole erzeugen
==========================================

Zunächst muss die Zip-Datei "docbook-example.zip" entpackt werden. Als Ergebnis
sollte ein Ordner "docbook-example" mit zwei Unterordnern erzeugt werden.

Als nächstes muss das docbook-styles Projekt gebaut werden. Dazu über die Konsole 
in den Ordner docbook-styles navigieren und den Befehl "mvn clean install" ausführen.
Nach der Ausführung sollte BUILD SUCCESSFUL angezeigt werden.

Nun in den Ordner example-userguide wechseln und dort ebenfalls den Befehl
"mvn clean install" ausführen. Beim ersten Aufruf, kann die Ausführung etwas dauern.
Auch hier wird zum Schluss BUILD SUCCESSFUL angezeigt.

Die Dokumentation wurde in drei verschiedenen Ausgabeformaten erzeugt. Diese befinden
sich unter "example-userguide\target\docbkx" sowie in der erzeugten zip-Datei
"example-userguide-1.0-SNAPSHOT.zip".
Die zugehörige Quelldatei "docbook_maven.xml" befindet sich unter 
"example-userguide\src\docbkx\". Um die Änderungen an der Quelldatei zu sehen, muss
der Befehl "mvn clean install" erneut in dem Ordner example-userguide ausgeführt werden.


======================================
3. Dokumentation über Eclipse erzeugen
======================================

Um die Erzeugung der Maven-Projekte zu vereinfachen, sollte Eclipse mit der 
Erweiterung "Maven Integration for Eclipse WTP" verwendet werden. Eclipse 
kann unter http://www.eclipse.org/downloads/ und das Plugin unter
http://marketplace.eclipse.org/content/maven-integration-eclipse-wtp
heruntergeladen werden.

Als nächstes muss die Zip-Datei "docbook-example.zip" entpackt werden. Als Ergebnis
sollte ein Ordner docbook-example mit zwei Unterordnern zu sehen sein.

Anschließend muss Eclipse gestartet und der Ordner "docbook-example" als Workspace
auswählt werden.

In Eclipse wird zunächst "File" -> "Import..." und dann "Maven" -> "Existing Maven Projects"
auswählt. Anschließen den Next-Button drücken.

In dem anschließenden Fenster ist als "Root Directory" der Ordner "docbook-example" auszuwählen.
Beide POMs der Beispielprojekte sollten jetzt angezeigt und auch ausgewählt werden. Die
Auswahl ist mit dem Finish-Button zu bestätigen.

Eclipse setzt die Projekte jetzt automatisch auf.

Anschließend auf dem "docbook-styles"-Projekt ein "Run As" -> "Maven install" ausführen. Das 
Projekt enthält die notwendigen Ressourcen für die Transformation der DocBook-Quelldatei in
die verschiedenen Ausgabeformate. Durch "Maven install" wird das Artefakt in den lokale M2-Ordner
abgelegt. Solange keine Änderungen an dem Projekt vorgenommen werden, ist ein erneutes Bauen 
nicht erforderlich.

Danach auf "example-userguide"-Projekt ebenfalls ein "Run As" -> "Maven install" ausführen. 
Als Ergebnis befindet sich unter example-userguide\target\ eine "example-userguide-1.0-SNAPSHOT.zip" mit
der Dokumentation in drei verschiedenen Ausgabeformaten. Unter example-userguide\target\docbkx ist die
Dokumentation auch ungezipt zu finden. Wann immer die Dokumentation bearbeitet wurde, ist ein erneutes
Ausführen von "Maven install" auf dem "example-userguide"-Projekt erforderlich.

Die Quelldatei docbook_maven.xml befindet sich unter "example-userguide\src\docbkx".

===========================
4. Dokumentation bearbeiten
===========================

Um die Dokumentation zu bearbeiten muss die docbook_maven.xml aus dem Ordner
"example-userguide\src\docbkx" angepasst werden. Für die Bearbeitung sei der
WYSIWYG-Editor von xmlmind empfohlen. Dieser ist in der personal Version kostenlos
und nach kurzer Einarbeitung sehr gut für dies Aufgabe geeignet. Download unter:
http://www.xmlmind.com/xmleditor/download.shtml

Um neue Dokumente zu erzeugen kann in dem Editor "File" -> "New..." -> "DocBook v5+" -> "Book"
ausgewählt werden. Das neue Dokument muss in dem Ordner "example-userguide\src\docbkx" abgelegt
und in der pom des "example-userguide"-Projekts eingetragen werden.


=============
5. Für Eilige
=============

- Java installieren (mindestens Runtime) 

- Apache Maven installieren (http://maven.apache.org/download.html)

- Eclipse mit dem Plugin "Maven Integration for Eclipse WTP" installieren
  (http://marketplace.eclipse.org/content/maven-integration-eclipse-wtp)

- "docbook-example.zip" entpacken

- Eclipse starten und den Ordner "docbook-example" als Workspace auswählen.

- In Eclipse: "File" -> "Import..." Dann "Maven" -> "Existing Maven Projects" auswählen und Next-Button drücken.

- Als "Root Directory" den Ordner "docbook-example" auswählen (Beide POMs der Beispielprojekte
  sollten jetzt angezeigt und ausgewählt sein), Finish klicken.

- Eclipse setzt die Projekte jetzt automatisch auf.

- Anschließend auf dem "docbook-styles"-Projekt ein "Run As" -> "Maven install" ausführen 

- Danach auf "example-userguide"-Projekt ebenfalls ein "Run As" -> "Maven install" ausführen 

- Als Ergebnis befindet sich unter example-userguide\target\ eine "example-userguide-1.0-SNAPSHOT.zip" mit
  der Dokumentation in drei Ausgabeformaten. Unter example-userguide\target\docbkx ist die
  Dokumentation auch ungezipt zu finden.

- Die Quelldatei docbook_maven.xml befindet sich unter "example-userguide\src\docbkx".


==================
6. Für sehr Eilige
==================

- Java installieren (mindestens Runtime) 

- Apache Maven installieren (http://maven.apache.org/download.html)

- "docbook-example.zip" entpacken

- In den Ordner "docbook-styles" navigieren und den Befehl "mvn clean install" ausführen.

- In den Ordner "example-userguide" navigieren und den Befehl "mvn clean install" ausführen.

- Als Ergebnis befindet sich unter example-userguide\target\ eine "example-userguide-1.0-SNAPSHOT.zip" mit
  der Dokumentation in drei Ausgabeformaten. Unter example-userguide\target\docbkx ist die
  Dokumentation auch ungezipt zu finden.

- Die Quelldatei docbook_maven.xml befindet sich unter "example-userguide\src\docbkx".
