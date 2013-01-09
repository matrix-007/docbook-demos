<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:db="http://docbook.org/ns/docbook" 
	xmlns:xslthl="http://xslthl.sf.net"
	exclude-result-prefixes="xslthl" version="1.0">

	<!--
		********** Imports **************************
		*********************************************
	-->

	<!-- symbol reference to point the original DocBook style files -->
	<xsl:import href="urn:docbkx:stylesheet/profile-docbook.xsl" />
	
	<xsl:import href="docbook-common.xsl" />
	
	<xsl:import href="html-highlight.xsl" />

	<xsl:param name="highlight.source" select="1" />
	
	<xsl:param name="profile.condition" select="'html-only'" />

	<!-- CSS-Datei angeben -->
	<xsl:param name="html.stylesheet">
		css/html.css
	</xsl:param>

	<xsl:param name="chunk.section.depth" select="3" />
	<xsl:param name="use.id.as.filename" select="1" />


	<!-- process <?linebreak?> in xml content-->
	<xsl:template match="processing-instruction('linebreak')">
		<br />
	</xsl:template>
	
	<xsl:output method="html" encoding="UTF-8" indent="yes" />

</xsl:stylesheet>
