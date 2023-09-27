<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
                xmlns:foaf="http://xmlns.com/foaf/0.1/"
                version="1.0">

  <xsl:output method="html" encoding="UTF-8"/>

  <!-- Template pour la racine de l'arbre -->
  <xsl:template match="/">
    <html xmlns="http://www.w3.org/1999/xhtml">
      <head>
        <title>FOAF RDF to XHTML</title>
      </head>
      <body>
        <!-- Appliquer le template sur les éléments foaf:Person -->
        <xsl:apply-templates select="//foaf:Person"/>
      </body>
    </html>
  </xsl:template>

  <!-- Template pour les éléments foaf:Person -->
  <xsl:template match="foaf:Person">
    <div>
      <h1>Profil FOAF</h1>
      <p><strong>Nom : </strong><xsl:value-of select="foaf:familyName"/></p>
      <p><strong>Prénom : </strong><xsl:value-of select="foaf:givenName"/></p>
      <p><strong>Nom d'utilisateur : </strong><xsl:value-of select="foaf:nick"/></p>
      <p><strong>Titre : </strong><xsl:value-of select="foaf:title"/></p>
      <p><strong>Page d'accueil : </strong><a href="{foaf:homepage/@rdf:resource}"><xsl:value-of select="foaf:homepage/@rdf:resource"/></a></p>

      <!-- Appliquer le template sur les éléments foaf:knows -->
      <xsl:apply-templates select="foaf:knows"/>
    </div>
  </xsl:template>

  <!-- Template pour les éléments foaf:knows -->
  <xsl:template match="foaf:knows">
    <h2>Connexions FOAF</h2>
    <ul>
      <!-- Appliquer le template sur les éléments foaf:Person sous foaf:knows -->
      <xsl:apply-templates select="foaf:Person"/>
    </ul>
  </xsl:template>

  <!-- Template pour les éléments foaf:Person sous foaf:knows -->
  <xsl:template match="foaf:Person">
    <li>
      <p><strong>Nom : </strong><xsl:value-of select="foaf:name"/></p>
      <p><strong>Email (SHA1) : </strong><xsl:value-of select="foaf:mbox_sha1sum"/></p>
      <p><strong>Plus d'informations : </strong><a href="{rdfs:seeAlso/@rdf:resource}"><xsl:value-of select="rdfs:seeAlso/@rdf:resource"/></a></p>
    </li>
  </xsl:template>

</xsl:stylesheet>
