<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:db="http://docbook.org/ns/docbook"
		version="1.0">

  <xsl:import href="urn:docbkx:stylesheet/profile-docbook.xsl" />

  <xsl:import href="docbook-common.xsl" />

  <xsl:import href="fo-highlight.xsl" />

  <xsl:param name="profile.condition" select="'fo-only'" />

  <xsl:param name="highlight.source" select="1" />
  
  <xsl:param name="callout.graphics.extension" select="'.svg'"/>

  <xsl:param name="admon.graphics.extension" select="'.png'"/>
  
  <xsl:template match="*" mode="admon.graphic.width">
    <xsl:text>24pt</xsl:text>
  </xsl:template>

  <xsl:param name="ulink.footnotes" select="0" />
  <xsl:param name="ulink.show" select="0" />
  <xsl:param name="ulink.hyphenate" select="'&#x200b;'"/>
  <xsl:param name="ulink.hyphenate.chars" select="'/&amp;?'"/>


  <!-- Paper format -->
  <xsl:param name="paper.type" select="'A4'"	/>

  <!-- Body font size -->
  <xsl:param name="body.font.master" select="10" />
  
  <!-- text indent -->
  <xsl:param name="body.start.indent" select="'0pt'"/>
  
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

  <!-- 宋体属于serif字体，通常跟Times搭配 -->
  <xsl:param name="body.font.family" select="'TimesNewRoman,WenQuanYiMicroHei'"/>

  <xsl:param name="title.font.family" select="'WenQuanYiMicroHei'"/>

  <xsl:param name="dingbat.font.family" select="'WenQuanYiMicroHei'"/>

  <!-- sans 字体 没有额外修饰的字体 常见的有:Arial, Helvetica -->
  <xsl:param name="sans.font.family" select="'Helvetica,WenQuanYiMicroHei'"/>

  <!-- fixed width,typewriter font. -->
  <xsl:param name="monospace.font.family" select="'monospace,WenQuanYiMicroHeiMono'"/>
  
  <xsl:param name="draft.mode" select="'no'"/>
  
  <xsl:attribute-set name="admonition.properties">
    <xsl:attribute name="font-family">'TimesNewRoman','KaiTi'</xsl:attribute>
    <xsl:attribute name="font-size">80%</xsl:attribute>
    <xsl:attribute name="border-left-style">solid</xsl:attribute>
    <xsl:attribute name="border-left-color">black</xsl:attribute>
    <xsl:attribute name="border-left-width">1pt</xsl:attribute>
    <xsl:attribute name="padding-left">2em</xsl:attribute>
    <xsl:attribute name="margin-left">0em</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="admonition.title.properties">
    <xsl:attribute name="font-family">'WenQuanYiMicroHei'</xsl:attribute>
    <xsl:attribute name="font-size">80%</xsl:attribute>
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <xsl:attribute name="color">#1c4c7d</xsl:attribute>

    <xsl:attribute name="border-left-style">solid</xsl:attribute>
    <xsl:attribute name="border-left-color">black</xsl:attribute>
    <xsl:attribute name="border-left-width">1pt</xsl:attribute>
    <xsl:attribute name="padding-left">2em</xsl:attribute>
    <xsl:attribute name="margin-left">0em</xsl:attribute>

    <xsl:attribute name="space-after">0pt</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="formal.title.properties">
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <xsl:attribute name="font-size">
      <xsl:value-of select="$body.font.master * 0.9" />
      <xsl:text>pt</xsl:text>
    </xsl:attribute>
    <xsl:attribute name="hyphenate">false</xsl:attribute>
    <xsl:attribute name="space-after.minimum">0.4em</xsl:attribute>
    <xsl:attribute name="space-after.optimum">0.6em</xsl:attribute>
    <xsl:attribute name="space-after.maximum">0.8em</xsl:attribute>
  </xsl:attribute-set>



  <xsl:attribute-set name="section.title.properties">
    <xsl:attribute name="text-align">left</xsl:attribute>
    <xsl:attribute name="color">#1c4c7d</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="component.title.properties">
    <xsl:attribute name="text-align">left</xsl:attribute>
    <xsl:attribute name="color">#1c4c7d</xsl:attribute>
  </xsl:attribute-set>


  <xsl:attribute-set name="component.title.properties">
    <xsl:attribute name="text-align">left</xsl:attribute>
    <xsl:attribute name="color">#1c4c7d</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="example.title.properties"
		     use-attribute-sets="normal.para.spacing">
    <xsl:attribute name="space-before">5px</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="section.title.properties">
    <xsl:attribute name="text-align">left</xsl:attribute>
    <xsl:attribute name="color">#1c4c7d</xsl:attribute>
  </xsl:attribute-set>

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
  
  <xsl:param name="hyphenate.verbatim" select="0" />

  <xsl:attribute-set name="monospace.verbatim.properties"
		     use-attribute-sets="verbatim.properties">
    <xsl:attribute name="wrap-option">wrap</xsl:attribute>
    <xsl:attribute name="hyphenation-character">\</xsl:attribute>
<!--    <xsl:attribute name="font-size">7pt</xsl:attribute>-->
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

<!--  <xsl:attribute-set name="normal.para.spacing">
    <xsl:attribute name="text-indent">2em</xsl:attribute>
    <xsl:attribute name="space-before.optimum">1em</xsl:attribute>
    <xsl:attribute name="space-before.minimum">0.8em</xsl:attribute>
    <xsl:attribute name="space-before.maximum">1.2em</xsl:attribute>
  </xsl:attribute-set>-->

  <xsl:param name="shade.verbatim" select="1" />

  <xsl:attribute-set name="shade.verbatim.style">
    <xsl:attribute name="background-color">#f0f0f0</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="figure.properties">
    <xsl:attribute name="text-align">center</xsl:attribute>
  </xsl:attribute-set>


  <xsl:template match="emphasis[@role='red']">
    <fo:inline color="#FF0000">
      <xsl:apply-templates />
    </fo:inline>
  </xsl:template>

</xsl:stylesheet>
