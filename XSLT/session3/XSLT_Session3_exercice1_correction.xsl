<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" xmlns="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs math tei" version="3.0">

    <xsl:output method="xml" encoding="UTF-8" indent="yes"/>

    <!-- Copier tout par défaut -->
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
            <!-- puis d'appliquer des règles spécifiques sur les éléments à modifier -->
        </xsl:copy>
    </xsl:template>
    
    <!-- règle simple pour transformer les p en lg -->
    <!--  <xsl:template match="p">
        <lg>
            <xsl:apply-templates/>
        </lg>
    </xsl:template>-->
    
    <!-- règle avec des conditions pour transformer les p en lg avec des types spécifiques -->
    <xsl:template match="p">
        <xsl:choose>
            <xsl:when test="./count(seg)=4">
                <lg type='quatrain'>
                    <xsl:apply-templates/>
                </lg>  
            </xsl:when>
            <xsl:when test="./count(seg)=3">
                <lg type='tercet'>
                    <xsl:apply-templates/>
                </lg>
            </xsl:when>
            <xsl:otherwise>
                <!-- Crée une copie du nœud courant et applique des modèles à ses enfants. -->
                <xsl:copy>
                <xsl:apply-templates/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

<!-- Affinage de la structuration du poème et des strophes imbriquées -->
    <xsl:template match="div">
        <xsl:choose>
            <xsl:when test="parent::div">
                <lg type='sizain'>
                    <xsl:apply-templates/>
                </lg>  
            </xsl:when>
            <xsl:otherwise>
                <div type="sonnet">
                    <xsl:apply-templates/>
                </div>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="seg">
        <xsl:variable name="number"> <!-- création d'une variable dont on peut insérer 
                la valeur dans une expression xpath -->
            <xsl:number count="seg" level="any" format="1"></xsl:number>
        </xsl:variable>
        <l n="{$number}">
            <xsl:apply-templates/>
        </l>
    </xsl:template>
    

</xsl:stylesheet>
