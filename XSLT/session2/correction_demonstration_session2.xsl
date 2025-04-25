<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs math"
    version="3.0">
   
   <xsl:output method="html" indent="yes" encoding="UTF-8"/>
    
    <xsl:template match="TEI">
        <html>
        <head>
            <meta charset="utf-8"/>
                <title>Titre de la page</title>
                <link rel="stylesheet" href="style.css"/>
                    <script src="script.js"></script>
        </head>
        <body>
        <!--<ul>
        <xsl:apply-templates select="descendant::speaker" mode="list"/>
        </ul>-->
        <xsl:apply-templates select="descendant::body"/>
        </body>
        </html>
    </xsl:template>
   
  <!-- <xsl:template match="speaker" mode="list">
          <li><xsl:value-of select="."/></li>
   </xsl:template>-->
</xsl:stylesheet>