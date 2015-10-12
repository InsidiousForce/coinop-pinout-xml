<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html"/>

<xsl:template match="/">
	<html>
	<head>
	<style>
		TD	{ font-family: "Courier New, Courier"; font-size: 8pt; }
	</style>
	</head>
	<body>
	
	<xsl:apply-templates select="tech/pinout"/>

	</body>
	</html>
</xsl:template>


<xsl:template match="pinout[@type='edge']">
	<table>
	<tr>
	<th><xsl:attribute name="colspan"><xsl:value-of select="count(row) * 2"/></xsl:attribute><xsl:value-of select="@name"/></th>
	</tr>
	<tr valign="top">
	<xsl:apply-templates select="row"/>
	</tr>
	</table>
	<xsl:value-of select="notes"/>
</xsl:template>


<xsl:template match="row">
	<td>
	<table cellspacing="0" cellpadding="0">
		<tr>
		<th colspan="5"><xsl:value-of select="@side"/> side</th>
		</tr>

		<tr>
		<td width="48"><img border="0" width="48" height="16"><xsl:attribute name="src">img/<xsl:value-of select="@side"/>_start.png</xsl:attribute></img></td>
		</tr>
	<xsl:apply-templates/>
		<tr>
		<td width="48"><img border="0" width="48" height="16"><xsl:attribute name="src">img/<xsl:value-of select="@side"/>_end.png</xsl:attribute></img></td>
		</tr>
	</table>
	</td>
	<td width="50">&#xA0;</td>
</xsl:template>

<xsl:template match="pin|space">
	<tr>
	<xsl:choose>
		<xsl:when test="@key='true'">
		<td width="48"><img border="0" width="48" height="16"><xsl:attribute name="src">img/<xsl:value-of select="parent::node()/@side"/>_key.png</xsl:attribute></img></td>
		</xsl:when>
		<xsl:otherwise>
		<td width="48"><img border="0" width="48" height="16"><xsl:attribute name="src">img/<xsl:value-of select="parent::node()/@side"/>_<xsl:value-of select="name(.)"/>.png</xsl:attribute></img></td>
		</xsl:otherwise>
	</xsl:choose>
	<td width="10">&#xA0;</td>
	<td><b><xsl:value-of select="@location"/></b></td>
	<td width="10">&#xA0;</td>
	<td><xsl:value-of select="."/></td>
	</tr>
</xsl:template>

<xsl:template match="notch">
	<tr>
		<td width="48"><img border="0" width="48" height="2"><xsl:attribute name="src">img/<xsl:value-of select="parent::node()/@side"/>_notch.png</xsl:attribute></img></td>
	</tr>
</xsl:template>


</xsl:stylesheet>