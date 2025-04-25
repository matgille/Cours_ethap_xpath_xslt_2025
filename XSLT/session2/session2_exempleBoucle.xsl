<?xml version="1.0" encoding="UTF-8"?>
<!-- Transforms TEI XML documents into HTML format, focusing on rendering the document's structure
    and content, such as titles, characters, scenes, and stage directions. It includes templates
    for handling various elements like speakers, stage directions, and names, while also
    supporting character sorting and variant readings. -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs math"
    version="3.0">
   
   <xsl:output method="html" indent="yes" encoding="UTF-8"/>
    
    
    <xsl:strip-space elements="*"/>
  
   
  <!-- <xsl:template match="speaker" mode="list">
          <li><xsl:value-of select="."/></li>
   </xsl:template>-->
        
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
                            <xsl:apply-templates select="//div1" mode="liste-personnages"/>
                        </ul>
                    </section>
                    
                    <!-- Section texte -->
                    <section id="scene">
                        <h2>Scène</h2>
                        <xsl:apply-templates select="//sp" mode="#default"/>
                    </section>
                </body>
            </html>
        </xsl:template>
        
        <!-- Liste des personnages -->
    <!--
    <xsl:template match="div1" mode="liste-personnages">
        <xsl:for-each select="descendant::speaker">
            <xsl:sort select="current()" data-type="text" order="ascending"/>
            <li><xsl:apply-templates/></li>
        </xsl:for-each>  
    </xsl:template>
    -->
    
    <xsl:template match="div1" mode="liste-personnages">
        <xsl:for-each-group select="descendant::speaker" group-by="parent::sp/@who">
            <xsl:sort select="current()" data-type="text" order="ascending"/> 
            
            <li><xsl:apply-templates/></li>
            
        </xsl:for-each-group> 
    </xsl:template>
    



        <!-- Répliques -->
        <xsl:template match="sp">
            <div class="speech">
                <xsl:attribute name="data-speaker"><xsl:value-of select="speaker"/></xsl:attribute>
                
                <p>
                    <xsl:apply-templates/>
                </p>
                
            </div>
        </xsl:template>
    
    <xsl:template match="speaker" mode="#default">
        <strong><xsl:apply-templates/>:</strong>
    </xsl:template>
        
        <!-- Didascalies -->
        <xsl:template match="stage">
            <p class="stage-direction">
                <em><xsl:apply-templates/></em>
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