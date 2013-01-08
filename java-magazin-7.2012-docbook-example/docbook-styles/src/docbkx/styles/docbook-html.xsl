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

	<!-- Generelle Einstellungen, die fuer alle Ausgabeformate gelten -->
	<xsl:import href="docbook-common.xsl" />

	<!-- Legt Styles fuer das highlighting im HTML-Dokument fest -->
	<xsl:import href="html-highlight.xsl" />

	<!--
		*********** Globale Parameter ***************
		*********************************************
	-->

	<!--
		Schaltet highlighting (in Kombination mit dem Import einer
		highlight.xsl) an.
	-->
	<xsl:param name="highlight.source" select="1" />

	<!-- CSS-Datei angeben -->
	<xsl:param name="html.stylesheet">
		styles/html.css
	</xsl:param>

	<!-- Gibt an, wie stark die chunked HTML-Seiten unterteilt sind -->
	<xsl:param name="chunk.section.depth" select="3" />
	<xsl:param name="use.id.as.filename" select="1" />

	<!--
		Profiling Parameter; funktioniert nur im Zusammenhang mit
		"urn:docbkx:stylesheet/profile-docbook.xsl"
	-->
	<xsl:param name="profile.condition" select="'html-only'" />

	<!--
		*********** Templates ***********************
		*********************************************
	-->

	<!-- Style fuer role = 'warning' -->
	<xsl:template match="db:para[@role='warning']">
		<div style="border:2px solid red">
			<table>
				<colgroup>
					<col width="90px" />
				</colgroup>
				<tbody>
					<tr valign="middle">
						<td valign="middle">
							<div class="mediaobject">
								<img src="images/dbx/warning.png" width="108" />
							</div>
						</td>
						<td valign="middle">
							<xsl:apply-templates />
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</xsl:template>

	<!-- Erzeugt Zeilenumbruch im HTML mit <?linebreak?> -->
	<xsl:template match="processing-instruction('linebreak')">
		<br />
	</xsl:template>
	
	<xsl:output method="html" encoding="UTF-8" indent="yes" />

</xsl:stylesheet>
