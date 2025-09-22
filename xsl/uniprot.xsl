<xsl:stylesheet version="1.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text"/>
 <!-- schema: https://www.uniprot.org/docs/uniprot.xsd -->
<xsl:template match="uniprot">
    <!-- header -->
    <xsl:text>accession|name|</xsl:text>
    <xsl:text>protein.fullName|protein.shortName|protein.ecNumber|</xsl:text>
    <xsl:text>gene.name.primary|gene.name.synonym|gene.name.ordered_locus|gene.name.ORF|</xsl:text>
    <xsl:text>organism.name.common|organism.name.full|organism.name.scientific|organism.name.synonym|organism.NCBI_Taxonomy.id|</xsl:text>
    <xsl:text>sequence|sequence.length|sequence.mass|sequence.modified|</xsl:text>
    <xsl:text>created|modified</xsl:text>
    <xsl:text>&#10;</xsl:text>
    <xsl:for-each select="entry">
        <!-- accession -->
        <xsl:value-of select="accession"/>
        <xsl:text>|</xsl:text>
        <!-- name -->
        <xsl:value-of select="name"/>
        <xsl:text>|</xsl:text>

        <!-- protein.fullName -->
        <xsl:value-of select="protein/recommendedName/fullName"/>
        <xsl:text>|</xsl:text>
        <!-- protein.shortName -->
        <xsl:value-of select="protein/recommendedName/shortName"/>
        <xsl:text>|</xsl:text>
        <!-- protein.ecNumber -->        
        <xsl:value-of select="protein/recommendedName/ecNumber"/>
        <xsl:text>|</xsl:text>

        <!-- gene.name.primary -->
        <xsl:value-of select="gene/name[@type='primary']"/>
        <xsl:text>|</xsl:text>
        <!-- gene.name.synonym -->
        <xsl:value-of select="gene/name[@type='synonym']"/>
        <xsl:text>|</xsl:text>
        <!-- gene.name.ordered_locus -->
        <xsl:value-of select="gene/name[@type='ordered locus']"/>
        <xsl:text>|</xsl:text>
        <!-- gene.name.ORF -->
        <xsl:value-of select="gene/name[@type='ORF']"/>
        <xsl:text>|</xsl:text>

        <!-- organism.name.common -->
        <xsl:value-of select="organism/name[@type='common']"/>
        <xsl:text>|</xsl:text>
        <!-- organism.name.full -->
        <xsl:value-of select="organism/name[@type='full']"/>
        <xsl:text>|</xsl:text>
        <!-- organism.name.scientific -->
        <xsl:value-of select="organism/name[@type='scientific']"/>
        <xsl:text>|</xsl:text>
        <!-- organism.name.synonym -->
        <xsl:value-of select="organism/name[@type='synonym']"/>
        <xsl:text>|</xsl:text>
        <!-- organism.NCBI_Taxonomy.id -->
        <xsl:value-of select="organism/dbReference[@type='NCBI Taxonomy']/@id"/>
        <xsl:text>|</xsl:text>

        <!-- sequence -->
        <xsl:value-of select="sequence"/>
        <xsl:text>|</xsl:text>
        <!-- sequence.length -->
        <xsl:value-of select="sequence/@length"/>
        <xsl:text>|</xsl:text>
        <!-- sequence.mass -->
        <xsl:value-of select="sequence/@mass"/>
        <xsl:text>|</xsl:text>
        <!-- sequence.modified -->
        <xsl:value-of select="sequence/@modified"/>
        <xsl:text>|</xsl:text>

        <!-- created -->
        <xsl:value-of select="@created"/>
        <xsl:text>|</xsl:text>
        <!-- modified -->
        <xsl:value-of select="@modified"/>
        <xsl:text>&#10;</xsl:text>

    </xsl:for-each>
</xsl:template>
</xsl:stylesheet>