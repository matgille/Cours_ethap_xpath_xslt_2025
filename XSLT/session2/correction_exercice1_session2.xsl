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
<!--   
   
   <?xml version="1.0" encoding="UTF-8"?>
    <xsl:stylesheet version="3.0"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xpath-default-namespace="http://www.tei-c.org/ns/1.0">
        
        <xsl:output method="html" indent="yes" encoding="UTF-8"/> -->
        
        <!-- Template racine -->
        <xsl:template match="/">
            <html>
                <head>
                    <title>Édition HTML de la pièce</title>
                    <meta charset="UTF-8"/>
                </head>
                <body>
                    <h1><xsl:value-of select="//title"/></h1>
                    <!-- Section personnages -->
                    <section id="dramatis-personae">
                        <h2>Personnages</h2>
                        <ul>
                        <xsl:apply-templates select="//speaker" mode="liste-personnages"/>
                        </ul>
                    </section>
                    
                    <!-- Section texte -->
                    <section id="scene">
                        <h2>Scène</h2>
                        <xsl:apply-templates select="//sp"/>
                    </section>
                </body>
            </html>
        </xsl:template>
        
        <!-- Liste des personnages -->
    <xsl:template match="speaker" mode="liste-personnages">
            <li><xsl:value-of select="."/></li>
        </xsl:template>
        
        <!-- Répliques -->
        <xsl:template match="sp">
            <div class="speech">
                <xsl:attribute name="data-speaker"><xsl:value-of select="speaker"/></xsl:attribute>
                
                <p><strong><xsl:value-of select="speaker"/>:</strong>
                    <xsl:apply-templates/>
                </p>
               
            </div>
        </xsl:template>
        
        <!-- Didascalies -->
        <xsl:template match="stage">
            <p class="stage-direction">
                <em><xsl:apply-templates/></em>
            </p>
        </xsl:template>
        
        <!-- Paragraphe avec balises internes -->
        <xsl:template match="p">
            <p>
                <xsl:apply-templates/>
            </p>
        </xsl:template>
        
        <!-- Noms de personnes -->
        <xsl:template match="persName">
            <span class="persName">
                <xsl:apply-templates/>
            </span>
        </xsl:template>
        
        <!-- Noms de lieux -->
        <xsl:template match="placeName">
            <span class="placeName">
                <xsl:apply-templates/>
            </span>
        </xsl:template>
        
        <!-- Variantes -->
        <xsl:template match="app">
            <p><strong><xsl:value-of select="lem"/></strong></p>
            <span class="variant">
                <xsl:attribute name="title">
                    <xsl:value-of select="rdg/@wit"/>
                </xsl:attribute>
                <xsl:apply-templates select="rdg"/>
            </span>
        </xsl:template>

   
</xsl:stylesheet>