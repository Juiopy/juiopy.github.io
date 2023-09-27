<xsl:stylesheet version="1.0">
<xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
<xsl:template match="/">
<html>
<head>
<title>FOAF RDF to XHTML</title>
</head>
<body>
<h1>FOAF RDF Information</h1>
<xsl:apply-templates select="//foaf:Person"/>
</body>
</html>
</xsl:template>
<xsl:template match="foaf:Person">
<div style="margin-bottom: 20px; border: 1px solid #ccc; padding: 10px;">
<h2>
<xsl:value-of select="foaf:name"/>
</h2>
<ul>
<li>
<strong>Given Name:</strong>
<xsl:value-of select="foaf:givenname"/>
</li>
<li>
<strong>Family Name:</strong>
<xsl:value-of select="foaf:family_name"/>
</li>
<li>
<strong>Nick:</strong>
<xsl:value-of select="foaf:nick"/>
</li>
<li>
<strong>Title:</strong>
<xsl:value-of select="foaf:title"/>
</li>
<li>
<strong>Homepage:</strong>
<a href="{foaf:homepage/@rdf:resource}">
<xsl:value-of select="foaf:homepage/@rdf:resource"/>
</a>
</li>
</ul>
</div>
</xsl:template>
</xsl:stylesheet>
