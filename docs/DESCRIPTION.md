he Reviewed (Swiss-Prot) XML has been flattened into a parquet file. 

## brick/uniprot_sprot.parquet

The fields are as follows

`accession`
Entry information' section provides one or more accession number(s). 
These are stable identifiers and should be used to cite UniProtKB entries. 
Upon integration into UniProtKB, each entry is assigned a unique accession number, 
which is called 'Primary (citable) accession number

`name`
The UniProt name of the protein

Ref: https://www.uniprot.org/help/protein_names

`protein.fullName`
Full name recommended by the UniProt consortium

`protein.shortName`
Abbreviation of the full name or acronym.

`protein.ecNumber`
Enzyme Commission number

Ref: https://www.uniprot.org/help/gene_name

`gene.name.primary`

The recommended name is used to officially represent a gene. However, in many cases, more than one name have been assigned to a specific gene. We therefore make a distinction between the name which we believe should be used as the recommended gene name (official gene symbol) and the other names which we list in the 'Synonyms' subsection.

If an official gene name is provided by nomenclature committees, we usually store it in the 'Name' token with the recommended casing. However, there are some exceptions to this rule:

a) Many species have no established nomenclature committee. In such cases, we propose a gene name derived from an orthologous gene in a closely related species;

b) We try to give similar names to orthologous genes. In some rare cases, this implies that we use a name different from that proposed by a nomenclature committee.

Note that we write the gene name in uppercase when there is no casing rule for a given species.

`gene.name.synonym`

In this subsection we list, in alphabetical order, all the names, but the recommended one, that are or were used to represent the gene.

Example: Q04609

We try to provide an exhaustive list of synonyms. This allows users to mine the scientific literature for articles describing their biological object of interest. Note, however, that we do not always propagate a synonym across orthologous proteins. This is the case when a synonym is ambiguous, obsolete or has been used in a very restricted manner. We also do not store misnomers or spelling-deficient names.

`gene.name.ordered_locus`

We call 'Ordered locus name' (OLN) the naming systems that are used to sequentially assign an identifier to each predicted gene of a completely sequenced genome or chromosome. The OLN is generally based on a prefix representing the organism followed by a number which usually represents the sequential ordering of genes on the chromosome. Depending on the genome-sequencing center, OLNs are only attributed to protein-coding genes, or also to pseudogenes, and also to tRNA-coding genes and others. If two predicted genes have been merged to form a new gene, both OLNs are indicated, separated by a slash.

Examples: HI0934, Rv3245c, ECs2657/ECs2658

Note that OLNs are sometimes referred to as 'ORF numbers', 'CDS numbers' or 'Gene numbers'.

There can be more than one OLN per gene as it sometimes happens that one genome has been the target of distinct sequencing projects. In such cases, the order of the names in the 'Ordered Locus Names:' token reflects the order of the corresponding references in the entry.

`gene.name.ORF`

The 'ORF names' section is used to alphabetically list the names that are temporarily attributed to an open reading frame (ORF) by a sequencing project. This name can be based on a cosmid numbering system, on the clone name attributed by large-scale cDNA projects or on any other type of naming system.

Examples: SYGP-ORF50, SpBC2F12.04, C06E1.1, CG10954

ORF names are not propagated across species.

Important remarks

The scope of the data that we represent in the 'Gene names' subsection is wider than the classical geneticists' gene name since it also includes 'Ordered locus names' and 'ORF names'.
Some life sciences communities prefer to use the terminology 'gene symbol' rather than 'gene name'.
None of the above four subsections is mandatory, so that the 'Synonyms' subsection is present only if there is a 'Name' subsection.
In names and synonyms, we do not keep the prefix indicating the species of origin, although these are sometimes used in publications.
Examples: Xbcl2 (for Xenopus laevis bcl2), HsARG1 (for Homo sapiens ARG1).
It can happen that multiple genes can be translated to produce identical proteins in one species. In such cases, all gene products were historically often merged into a single UniProtKB entry and there are as many 'Name' tokens in the 'Gene names' subsection as the number of genes encoding the protein of interest, e.g. P68431.
However, we tend to demerge many of these entries, and for newly annotated proteins we generate separate sequence entries in case of multiple genes coding for identical protein sequences, e.g. P08409.

Ref: https://www.uniprot.org/help/organism-name

`organism.name.common`

`organism.name.full`

`organism.name.scientific`
The organism designation consists of the Latin scientific name, usually composed of the genus and species names (the binomial system developed by Linnaeus), followed optionally by the English common name and a synonym.

`organism.name.synonym`
The synonym can be a common name in English (or in Latin in the case of some historical legacy names).

`organism.NCBI_Taxonomy.id` [NCBI Taxonomy ID for the organism](https://www.ncbi.nlm.nih.gov/taxonomy)

Ref: https://www.uniprot.org/help/sequences

`sequence` [canonical protein sequence](https://www.uniprot.org/help/canonical_and_isoforms)

`sequence.length`
This indicates the number of amino acids in the canonical sequence displayed by default in the entry's Sequence section.

`sequence.mass`
molecular mass in Daltons

`sequence.modified`
Last time this sequence was modified

`created`
When this entry was created
`modified`
The time this entry was modified