<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:db="http://docbook.org/ns/docbook"
	version="1.1">

	<!--
		********** Imports **************************
		*********************************************
	-->

	<!-- Importieren der Standard-Templates -->
	<!--
		Ohne Profiling: href="urn:docbkx:stylesheet" -->
	<!--
		Mit Profiling: href="urn:docbkx:stylesheet/profile-docbook.xsl"
	-->
	<xsl:import href="urn:docbkx:stylesheet/profile-docbook.xsl" />

	<!--
		*********** Globale Parameter ***************
		*********************************************
	-->

	<!-- Gibt an bis zu welcher Tiefe Abschnitte nummeriert werden -->
	<xsl:param name="section.autolabel" select="1"></xsl:param>
	<xsl:param name="section.autolabel.max.depth" select="3" />

	<!--
		Gibt an bis zu welcher Tiefe Abschnitte ins Inhaltsverzeichnis
		uebernommen werden
	-->
	<xsl:param name="toc.section.depth" select="3" />

	<!-- Kapitel in die Nummerierung der Abschnitte aufnehmen-->
	<xsl:param name="section.label.includes.component.label"
		select="1" />

	<!-- Keine Silbentrennung -->
	<xsl:param name="hyphenate" select="'false'" />

	<!-- Ermoeglicht Referenzen mit Seitenzahlen -->
	<xsl:param name="insert.xref.page.number" select="maybe" />

	<!--
		*********** Externe Parameter ***************
		*********************************************
	-->

	<xsl:param name="projectversion"></xsl:param>
	<xsl:param name="imageicon">url(images/dbx/cpc_logo.gif)</xsl:param>

	<!--
		*********** Templates ***********************
		*********************************************
	-->

	<!-- Erlaubt die Verwendung von <?bookversion?> im DocBook XML -->
	<xsl:template match="processing-instruction('bookversion')">
		<!-- Version wird ausgeben -->
		<xsl:value-of select="$projectversion" />
	</xsl:template>

</xsl:stylesheet>