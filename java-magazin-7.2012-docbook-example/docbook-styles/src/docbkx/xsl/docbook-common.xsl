<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:db="http://docbook.org/ns/docbook"
	version="1.0">


	<xsl:param name="section.autolabel" select="1" />
	<xsl:param name="section.autolabel.max.depth" select="3" />

	<xsl:param name="toc.section.depth" select="3" />
	
	<xsl:param name="admon.graphics" select="1" />
	<xsl:param name="navig.graphics" select="1" />
	
	<xsl:param name="textinsert.extension" select="1" />
	<xsl:param name="callouts.extension" select="1" />
	<xsl:param name="use.extensions" select="1" />

	<xsl:param name="section.label.includes.component.label" select="1" />


	<xsl:param name="hyphenate" select="'false'" />

	<xsl:param name="insert.xref.page.number" select="maybe" />

	<!-- External Parameter -->

	<xsl:param name="projectversion"></xsl:param>
	<xsl:param name="imageicon" select="'url(images/dbx/cpc_logo.gif)'"/>
	

	<!-- *********** Templates *********************** ********************************************* -->

	<!-- Erlaubt die Verwendung von <?bookversion?> im DocBook XML -->
	<xsl:template match="processing-instruction('bookversion')">
		<!-- Version wird ausgeben -->
		<xsl:value-of select="$projectversion" />
	</xsl:template>

</xsl:stylesheet>
