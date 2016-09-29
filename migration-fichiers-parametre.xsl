<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all" version="2.0">
    
    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>

    <xsl:template match="/">
        <Parameters>
            <Title>
                <Sequence>
                    <xsl:apply-templates select="//sequence/*"/>
                </Sequence>
                <Question>
                    <xsl:apply-templates select="//question/*"/>
                </Question>
            </Title>
        </Parameters>
    </xsl:template>
    
    <xsl:template match="niveau" priority="2">
        <Level>
            <xsl:variable name="valeur">
                <xsl:choose>
                    <xsl:when test="@nom='Modele'">
                        <xsl:value-of select="string('template')"/>
                    </xsl:when>
                    <xsl:when test="@nom='Module'">
                        <xsl:value-of select="string('module')"/>
                    </xsl:when>
                    <xsl:when test="@nom='Paragraphe'">
                        <xsl:value-of select="string('submodule')"/>
                    </xsl:when>
                    <xsl:when test="@nom='Groupe'">
                        <xsl:value-of select="string('group')"/>
                    </xsl:when>
                </xsl:choose>
            </xsl:variable>
            <xsl:attribute name="name" select="$valeur">
            </xsl:attribute>
            <xsl:apply-templates select="node()"/>
        </Level>
    </xsl:template>
    
    <xsl:template match="*">
        <xsl:variable name="premierCaractere">
            <xsl:value-of select="upper-case(substring(name(),1,1))"/>
        </xsl:variable>
        <xsl:element name="{concat($premierCaractere, substring(name(),2))}">
            <xsl:apply-templates select="node()"/>
        </xsl:element>
    </xsl:template>
    
</xsl:transform>
