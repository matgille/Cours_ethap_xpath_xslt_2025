<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs math tei"
    version="3.0">
    
   <!--<xsl:output method="xml" indent="yes" encoding="UTF-8"/> -->
    
<!-- Attention à ne pas oublier de déclarer l'espace de nom tei dans le préambule -->
    <!-- Pour ne pas répéter l'espace de nom tei dans les chemins xpath, on peut déclarer l'espace de nom tei dans l'attribut xpath-default-namespace -->    
 
<!--    <xsl:template match="*|/">
        <xsl:apply-templates/>
    </xsl:template> -->
    
   
 <!-- <xsl:template match="tei:l">
     <xsl:copy-of select="."/>
 </xsl:template> -->
 
 
    <!-- parcours récursif de l'arbre -->
 <!--   <xsl:template match="l">       
        <xsl:copy-of select="."/>
    </xsl:template>
 -->
    
 <!-- exemple de comportements implicites -->
 <!--   <xsl:template match="l"/>     -->
    
<!-- <xsl:template match="lg[@type='couplet']">
     <xsl:copy-of select="."/>
 </xsl:template> -->
    
<!--  <xsl:template match="lg[@type='quatrain'][1]">
        <xsl:copy-of select="."/>
 </xsl:template> -->

<!--<xsl:template match="l">
    Ici, il y avait un vers
</xsl:template>-->

<!--<xsl:template match="l">
<xsl:text>Ici, il y avait un vers</xsl:text>
</xsl:template>-->
   
<!--<xsl:template match="lg">
    <div>Ici, il y avait une strophe</div>
</xsl:template> -->  
    
<!-- <xsl:template match="lg">
     <xsl:element name="div">Ici, il y avait une strophe</xsl:element>
 </xsl:template>-->
 
<!-- <xsl:template match="lg">
     <div type="poem">Ici, il y avait une strophe</div>
 </xsl:template>-->

 <!-- <xsl:template match="lg">
        <div type="{./@type}">Ici, il y avait une strophe</div>
    </xsl:template> -->
    
<!--<xsl:template match="lg">
    <xsl:element name="div">
        <xsl:attribute name="type">
            <xsl:value-of select="@type"/>
        </xsl:attribute>
        <xsl:text>Ici, il y avait mon poème</xsl:text>
    </xsl:element>
</xsl:template>-->
    
    <!--<xsl:template match="lg">
        <xsl:element name="div">
            <xsl:attribute name="type">
                <xsl:value-of select="@type"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>-->
    
   <!-- <xsl:template match="l">
        <xsl:value-of select="seg"/>
    </xsl:template>-->
    
   <!-- <xsl:template match="l">
        <l><xsl:value-of select="seg"/></l>
    </xsl:template>-->
    
    <!--<xsl:template match="teiHeader">
        <xsl:copy-of select="."></xsl:copy-of>
    </xsl:template>-->
    
   <!-- <xsl:template match="TEI">
        <xsl:copy>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>-->
    
    <!--<xsl:template match="l">
        <xsl:element name="l">
            <xsl:attribute name="n">
             <xsl:number count="l" level="any" format="1"/>   
            </xsl:attribute>
            <xsl:value-of select="seg"/></xsl:element>
    </xsl:template>-->
    
    
</xsl:stylesheet>