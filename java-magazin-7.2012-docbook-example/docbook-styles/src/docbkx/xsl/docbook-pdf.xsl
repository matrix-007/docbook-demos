<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:db="http://docbook.org/ns/docbook"
	version="1.0">

	<xsl:import href="urn:docbkx:stylesheet/profile-docbook.xsl" />

	<xsl:import href="docbook-common.xsl" />

	<xsl:import href="fo-highlight.xsl" />

	<xsl:param name="profile.condition" select="'fo-only'" />

	<xsl:param name="highlight.source" select="1" />

	<!-- Paper format -->
	<xsl:param name="paper.type">
		A4
	</xsl:param>

	<!-- text indent -->
	<xsl:param name="body.start.indent">
		0pt
	</xsl:param>

	<xsl:param name="body.font.size">
		11pt
	</xsl:param>

	<xsl:param name="line-height">
		1.3
	</xsl:param>

	<!-- Position der Titel festlegen -->
	<xsl:param name="formal.title.placement">
		figure after
		example after
		equation before
		table before
		procedure before
		task before
	</xsl:param>

	<!-- PDF-Bookmarks -->
	<xsl:param name="fop.extensions" select="0" />
	<xsl:param name="fop1.extensions" select="1" />
	<xsl:param name="tablecolumns.extension" select="0" />
	<!-- The font families to be searched for symbols outside of the body font -->
	<xsl:param name="symbol.font.family" />
	<xsl:param name="body.font.family">
		'Times','SimSun'
	</xsl:param>
	<xsl:param name="title.font.family">
		'Helvetica','Microsoft YaHei'
	</xsl:param>
	<xsl:param name="dingbat.font.family">
		'Helvetica','Microsoft YaHei'
	</xsl:param>
	<xsl:param name="sans.font.family">
		'Helvetica','Microsoft YaHei'
	</xsl:param>

	<xsl:param name="draft.mode">
		no
	</xsl:param>

	<xsl:attribute-set name="admonition.properties">
		<xsl:attribute name="font-family">'Helvetica','GBZenKai-Medium'</xsl:attribute>
		<xsl:attribute name="font-size">90%</xsl:attribute>
		<xsl:attribute name="border-left-style">solid</xsl:attribute>
		<xsl:attribute name="border-left-color">black</xsl:attribute>
		<xsl:attribute name="border-left-width">1pt</xsl:attribute>
		<xsl:attribute name="padding-left">2em</xsl:attribute>
		<xsl:attribute name="margin-left">0em</xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="admonition.title.properties">
		<xsl:attribute name="font-family">'Helvetica','DroidSansFallback'</xsl:attribute>
		<xsl:attribute name="font-size">90%</xsl:attribute>
		<xsl:attribute name="font-weight">bold</xsl:attribute>
		<xsl:attribute name="color">#1c4c7d</xsl:attribute>

		<xsl:attribute name="border-left-style">solid</xsl:attribute>
		<xsl:attribute name="border-left-color">black</xsl:attribute>
		<xsl:attribute name="border-left-width">1pt</xsl:attribute>
		<xsl:attribute name="padding-left">2em</xsl:attribute>
		<xsl:attribute name="margin-left">0em</xsl:attribute>

		<xsl:attribute name="space-after">0pt</xsl:attribute>
	</xsl:attribute-set>



	<!-- Stylen von literal, parameter, programlisting usw. -->
	<xsl:attribute-set name="monospace.properties">
		<xsl:attribute name="font-family">'DroidSansMono','Microsoft YaHei'</xsl:attribute>
		<xsl:attribute name="font-size">10pt</xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="verbatim.properties">
		<xsl:attribute name="font-size">
			<xsl:value-of select="$body.font.master * 0.8" />
			<xsl:text>pt</xsl:text>
		</xsl:attribute>
		<xsl:attribute name="space-before.minimum">0.8em</xsl:attribute>
		<xsl:attribute name="space-before.optimum">1em</xsl:attribute>
		<xsl:attribute name="space-before.maximum">1.2em</xsl:attribute>
		<xsl:attribute name="space-after.minimum">0.8em</xsl:attribute>
		<xsl:attribute name="space-after.optimum">1em</xsl:attribute>
		<xsl:attribute name="space-after.maximum">1.2em</xsl:attribute>
		<xsl:attribute name="padding">3pt</xsl:attribute>
	</xsl:attribute-set>

	<xsl:param name="shade.verbatim" select="1" />

	<xsl:attribute-set name="shade.verbatim.style">
		<xsl:attribute name="background-color">#f0f0f0</xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="figure.properties">
		<xsl:attribute name="text-align">center</xsl:attribute>
	</xsl:attribute-set>

	<!-- Soll herausfliessen von Text aus Zellen eingrenzen -->
	<xsl:attribute-set name="table.cell.padding">
		<xsl:attribute name="padding-right">4pt</xsl:attribute>
		<xsl:attribute name="padding-left">4pt</xsl:attribute>
		<xsl:attribute name="padding-bottom">4pt</xsl:attribute>
		<xsl:attribute name="padding-top">2pt</xsl:attribute>
	</xsl:attribute-set>

	<!-- Ueberschriften der verschiedenen Abschnitte stylen -->
	<xsl:attribute-set name="section.title.level1.properties">
		<xsl:attribute name="font-size">16pt</xsl:attribute>
		<xsl:attribute name="color">#b23040</xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="section.title.level2.properties">
		<xsl:attribute name="font-size">13pt</xsl:attribute>
		<xsl:attribute name="color">#c00000</xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="section.title.level3.properties">
		<xsl:attribute name="font-size">11pt</xsl:attribute>
		<xsl:attribute name="color">#c00000</xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="section.title.level4.properties">
		<xsl:attribute name="font-size">11pt</xsl:attribute>
		<xsl:attribute name="color">#6b0404</xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="section.title.level5.properties">
		<xsl:attribute name="font-size">11pt</xsl:attribute>
		<xsl:attribute name="color">#6b0404</xsl:attribute>
		<xsl:attribute name="font-style">italic</xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="section.title.level6.properties">
		<xsl:attribute name="font-size">11pt</xsl:attribute>
		<xsl:attribute name="color">#6b0404</xsl:attribute>
		<xsl:attribute name="font-style">italic</xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="monospace.verbatim.properties"
		use-attribute-sets="verbatim.properties">
		<xsl:attribute name="wrap-option">wrap</xsl:attribute>
		<xsl:attribute name="hyphenation-character">\</xsl:attribute>
		<xsl:attribute name="font-size">9pt</xsl:attribute>
		<xsl:attribute name="border-color">#000000</xsl:attribute>
		<xsl:attribute name="border-style">solid</xsl:attribute>
		<xsl:attribute name="border-width">1px</xsl:attribute>
		<xsl:attribute name="background-color">#f2dbdb</xsl:attribute>
		<xsl:attribute name="padding">5px</xsl:attribute>
		<xsl:attribute name="padding-top">2px</xsl:attribute>
		<xsl:attribute name="margin">2mm</xsl:attribute>
		<xsl:attribute name="font-family">Courier New</xsl:attribute>
		<xsl:attribute name="line-height">1.0</xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="section.title.properties">
		<xsl:attribute name="text-align">left</xsl:attribute>
		<xsl:attribute name="color">#1c4c7d</xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="component.title.properties">
		<xsl:attribute name="text-align">left</xsl:attribute>
		<xsl:attribute name="color">#1c4c7d</xsl:attribute>
	</xsl:attribute-set>

	<xsl:param name="hyphenate.verbatim" select="0" />

	<xsl:attribute-set name="monospace.verbatim.properties">
		<xsl:attribute name="font-size">7pt</xsl:attribute>
		<xsl:attribute name="wrap-option">wrap</xsl:attribute>
		<xsl:attribute name="hyphenation-character">\</xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="example.title.properties"
		use-attribute-sets="normal.para.spacing">
		<xsl:attribute name="space-before">5px</xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="list.item.spacing">
		<xsl:attribute name="space-before.optimum">0.08em</xsl:attribute>
		<xsl:attribute name="space-before.minimum">0.06em</xsl:attribute>
		<xsl:attribute name="space-before.maximum">0.10em</xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="normal.para.spacing">
		<xsl:attribute name="space-before.optimum">0em</xsl:attribute>
		<xsl:attribute name="space-before.minimum">0em</xsl:attribute>
		<xsl:attribute name="space-before.maximum">0em</xsl:attribute>
		<xsl:attribute name="space-after.optimum">1em</xsl:attribute>
		<xsl:attribute name="space-after.minimum">0.8em</xsl:attribute>
		<xsl:attribute name="space-after.maximum">1.2em</xsl:attribute>
	</xsl:attribute-set>

	<!-- *********** Titelseite ********************** ********************************************* -->
	<!-- Titelseite -->
	<xsl:template name="book.titlepage.recto">
		<fo:block keep-with-next.within-column="always">
			<fo:block-container height="20mm" display-align="before">
				<fo:table table-layout="fixed" width="100%">
					<fo:table-column column-width="proportional-column-width(3)" />
					<fo:table-column column-width="proportional-column-width(2)" />
					<fo:table-body>
						<fo:table-row>
							<fo:table-cell>
								<fo:block text-align="left" font-family="'Helvetica','Microsoft YaHei'"
									color="#4f81bd" font-style="italic" font-size="12pt">
									<xsl:value-of select="*[1]/db:releaseinfo" />
									<xsl:text> </xsl:text>
									<xsl:value-of select="$projectversion"></xsl:value-of>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block text-align="right" font-family="'Helvetica','Microsoft YaHei'"
									color="#4f81bd" font-style="italic" font-size="12pt">

								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</fo:table>
			</fo:block-container>

			<fo:block-container width="160mm" height="190mm+2px"
				padding-before="10mm" padding-after="10mm">

				<fo:block-container height="90mm" padding-before="0mm"
					padding-after="5mm" display-align="after">
					<fo:block font-family="'Helvetica','Microsoft YaHei'"
						font-weight="bold" text-align="center" color="#b23040" font-size="48pt"
						hyphenate="false">
						<xsl:value-of select="*[1]/db:title" />
					</fo:block>
				</fo:block-container>

				<fo:block border-bottom="2px solid #4f81bd" font-family="'Helvetica','Microsoft YaHei'"
					font-size="22pt" />

				<fo:block-container height="75mm" padding-before="10mm"
					padding-after="10mm" display-align="before">
					<fo:block font-family="'Helvetica','Microsoft YaHei'"
						font-size="22pt" text-align="center" hyphenate="false">
						<xsl:value-of select="*[1]/db:subtitle" />
					</fo:block>
				</fo:block-container>

			</fo:block-container>

			<fo:block text-align="right" font-family="'Helvetica','Microsoft YaHei'"
				font-size="10pt" vertical-align="bottom">
				<fo:external-graphic src="url({$imageicon})"
					content-width="50mm" />
			</fo:block>
		</fo:block>
	</xsl:template>

	<!-- Unnoetige Titelseiten entfernen -->
	<xsl:template name="book.titlepage.before.verso"></xsl:template>
	<xsl:template name="book.titlepage.verso"></xsl:template>
	<xsl:template name="book.titlepage.separator"></xsl:template>

	<!-- *********** Templates *********************** ********************************************* -->

	<!-- Erzeugt einen Zeilenumbruch im PDF mit <?linebreak?> -->
	<xsl:template match="processing-instruction('linebreak')">
		<fo:block />
	</xsl:template>

	<!-- *********** Header & Footer ***************** ********************************************* -->

	<!-- Im Fusszeilen-Bereich der Seite den Platz fuer die Grafik schaffen -->
	<xsl:param name="body.margin.bottom" select="'0.70in'" />
	<xsl:param name="region.after.extent" select="'0.60in'" />
	<xsl:param name="page.margin.bottom" select="'0.15in'" />

	<!-- Aufteilung des Fusszeilen-Breichs -->
	<xsl:param name="footer.column.widths">
		1 1 5
	</xsl:param>

	<!-- Aufteilung des Kopfzeilen-Breichs -->
	<xsl:param name="header.column.widths">
		1 1 1
	</xsl:param>
	<!-- Nur der oberste Abschnitt wird angezeigt. -->
	<xsl:param name="marker.section.level" select="1" />
	<!-- Schaltet die Trennlinie im Footer aus -->
	<xsl:param name="footer.rule" select="0" />

	<!-- Kopfzeile -->
	<xsl:template name="header.content">
		<xsl:param name="pageclass" select="''" />
		<xsl:param name="sequence" select="''" />
		<xsl:param name="position" select="''" />
		<xsl:param name="gentext-key" select="''" />

		<fo:block>
			<xsl:choose>
				<xsl:when test="$sequence = 'odd' and $position = 'center'">
					<fo:retrieve-marker retrieve-class-name="section.head.marker"
						retrieve-position="first-including-carryover" retrieve-boundary="page-sequence" />
				</xsl:when>

				<xsl:when test="$sequence = 'even' and $position = 'center'">
					<fo:retrieve-marker retrieve-class-name="section.head.marker"
						retrieve-position="first-including-carryover" retrieve-boundary="page-sequence" />
				</xsl:when>

				<!-- Kapitel-Info Start -->
				<xsl:when test="$sequence = 'odd' and $position = 'left'">
					<xsl:apply-templates select="."
						mode="object.title.markup" />
				</xsl:when>

				<xsl:when test="$sequence = 'even' and $position = 'left'">
					<xsl:apply-templates select="."
						mode="object.title.markup" />
				</xsl:when>
				<!-- Kapitel-Info Ende -->

				<xsl:when test="$sequence = 'odd' and $position = 'right'">
					<fo:page-number />
				</xsl:when>

				<xsl:when test="$sequence = 'even' and $position = 'right'">
					<fo:page-number />
				</xsl:when>

				<xsl:when test="$sequence = 'blank' and $position = 'right'">
					<fo:page-number />
				</xsl:when>

				<xsl:when test="$sequence = 'first' and $position = 'right'">
					<fo:page-number />
				</xsl:when>
			</xsl:choose>
		</fo:block>
	</xsl:template>

	<!-- Fusszeile -->
	<xsl:template name="footer.content">
		<xsl:param name="position" select="''" />

		<fo:block>
			<xsl:choose>
				<xsl:when test="$position = 'right'">
					<fo:external-graphic src="url({$imageicon})"
						content-height="0.45in" />
				</xsl:when>
			</xsl:choose>
		</fo:block>
	</xsl:template>

	<xsl:template match="emphasis[@role='red']">
		<fo:inline color="#FF0000">
			<xsl:apply-templates />
		</fo:inline>
	</xsl:template>

</xsl:stylesheet>
