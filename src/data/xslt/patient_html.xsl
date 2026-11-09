<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:med="http://www.univ-grenoble-alpes.fr/l3miage/medical">

    <xsl:output method="html" encoding="UTF-8"/>


    <xsl:template match="/">
        <html lang="fr">
            <head>
                <title>Fiche patient</title>
            </head>
            <body>
                <a href="cabinet.html">Retour</a>
                <xsl:apply-templates select="med:cabinet/med:patients/med:patient[med:nom = 'Orouge']"/>
                <script src="../js/patient.js"></script>
            </body>
        </html>
    </xsl:template>


    <xsl:template match="med:patient">

<header>
            <p>Fiche patient</p>
            <h1><xsl:value-of select="concat(med:prenom, ' ', med:nom)"/></h1>
        </header>

        <main>
            <dl>
                <dt>Sexe</dt>
                <dd><xsl:value-of select="med:sexe"/></dd>

                <dt>Date de naissance</dt>
                <dd><xsl:value-of select="med:naissance"/></dd>

                <dt>Numéro de sécurité sociale</dt>
                <dd><xsl:value-of select="med:numero"/></dd>

                <dt>Adresse</dt>
                <dd>
                    <xsl:value-of select="concat(med:adresse/med:numero, ' ', med:adresse/med:rue, ' ', med:adresse/med:codePostal, ' ', med:adresse/med:ville)"/>
                </dd>
            </dl>

            <section id="visites">
                <h2>Visites</h2>
                <ul>
                    <xsl:apply-templates select="med:visite"/>
                </ul>
            </section>
        </main>
    </xsl:template>

<xsl:template match="med:visite">
    <xsl:variable name="id" select="@intervenant"/>
    <li>
        <p><xsl:value-of select="@date"/></p>
        <xsl:apply-templates select="med:acte"/>
        <p>Intervenant</p>
        <xsl:choose>
            <xsl:when test="@intervenant">
                <p>
                    <xsl:value-of select="/med:cabinet/med:infirmiers/med:infirmier[@id = $id]/med:prenom"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="/med:cabinet/med:infirmiers/med:infirmier[@id = $id]/med:nom"/>
                </p>
            </xsl:when>
            <xsl:otherwise>
                <p>Non affectée</p>
            </xsl:otherwise>
        </xsl:choose>
    </li>
</xsl:template>

    <xsl:template match="med:acte">
        <p>
            <span><xsl:value-of select="@id"/></span>
            <xsl:text> </xsl:text>
            <xsl:value-of select="."/>
        </p>
    </xsl:template>

</xsl:stylesheet>
