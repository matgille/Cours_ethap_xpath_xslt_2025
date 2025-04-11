<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs math tei"
    version="3.0">
    
    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    
    <!-- Template for matching the root TEI element -->
    <xsl:template match="TEI">
        <xsl:copy>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <!-- Template for copying the teiHeader element -->
    <xsl:template match="teiHeader">
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <!-- Template for processing the text element -->
    <xsl:template match="text">
        <text>
            <body>
                <xsl:apply-templates/>
            </body>
        </text>
    </xsl:template>
    
    <!-- Template for copying the head element -->
    <xsl:template match="head">
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <!-- Template for processing the lg (line group) element -->
    <xsl:template match="lg">
        <lg>
            <!-- Add type attribute from the source element -->
            <xsl:attribute name="type">
                <xsl:value-of select="@type"/>
            </xsl:attribute>
            <!-- Add n attribute with a formatted number -->
            <xsl:attribute name="n">
                <xsl:number count="lg" level="multiple" format="1.1"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </lg>
    </xsl:template>
    
    <!-- Template for processing the l (line) element -->
    <xsl:template match="l">
        <l>
            <!-- Add n attribute with a formatted number -->
            <xsl:attribute name="n">
                <xsl:number count="l" level="any" format="1"/>
            </xsl:attribute>
            <!-- Output the content of the seg element -->
            <xsl:value-of select="seg"/>
        </l>
    </xsl:template>
</xsl:stylesheet>
