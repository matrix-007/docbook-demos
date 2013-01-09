<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:db="http://docbook.org/ns/docbook" xmlns:xslthl="http://xslthl.sf.net"
	exclude-result-prefixes="xslthl" version="1.0">

	<!-- ********** Imports ************************** ********************************************* -->
	<xsl:import href="urn:docbkx:stylesheet/profile-chunk.xsl" />

	<xsl:import href="docbook-common.xsl" />

	<xsl:import href="html-highlight.xsl" />

	<xsl:param name="profile.condition" select="'html-only'" />

	<xsl:param name="highlight.source" select="1" />

	<xsl:param name="html.stylesheet">
		css/html.css
	</xsl:param>

	<xsl:param name="chunker.output.encoding">
		utf-8
	</xsl:param>
	<xsl:param name="chunker.output.indent">
		yes
	</xsl:param>
	<xsl:param name="saxon.character.representation">
		native
	</xsl:param>

	<xsl:param name="chunk.section.depth" select="2" />
	<xsl:param name="chunk.first.sections" select="1" />

	<xsl:param name="use.id.as.filename" select="1" />
	<xsl:template match="processing-instruction('linebreak')">
		<br />
	</xsl:template>

</xsl:stylesheet>
