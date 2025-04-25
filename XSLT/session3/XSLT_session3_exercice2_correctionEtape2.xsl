<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs math tei"
    version="3.0">

    <!-- Define output format as XML with indentation -->
    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>

    <!-- Define the directory containing the XML files to process -->
    <xsl:param name="directory"
        select="'scripts_mss_MS609/data/BMTOULOUSE-MS609/de_manso_sanctarum_puellarum'"/>

    <!-- Retrieve all files from the specified directory -->
    <xsl:variable name="allFiles" select="uri-collection($directory)"/>

    <!-- Filter the collection to include only XML files -->
    <xsl:variable name="xmlFiles" select="$allFiles[ends-with(., '.xml')]"/>

    <!-- Root template to start the transformation -->
    <xsl:template match="/">
        <index>
            <!-- Group all <persName> elements by their @ref attribute -->
            <xsl:for-each-group select="document($xmlFiles)//body//persName" group-by="@ref">

                <!-- Sort groups by the number of occurrences in descending order -->
                <xsl:sort select="count(current-group())" order="descending"/>

                <!-- Create an entry for each group -->
                <entry>
                    <!-- Extract the name of the person -->
                    <name>
                        <xsl:value-of select="normalize-space(current()[1])"/>
                    </name>

                    <!-- Count the total occurrences of the name -->
                    <count>
                        <xsl:value-of select="count(current-group())"/>
                    </count>

                    <!-- List the source files where the name appears -->
                    <sources>
                        <xsl:for-each
                            select="distinct-values(current-group()/ancestor::TEI/@xml:id)">
                            <source>
                                <xsl:value-of select="."/>
                            </source>
                        </xsl:for-each>
                    </sources>
                </entry>

            </xsl:for-each-group>
        </index>
    </xsl:template>

</xsl:stylesheet>
