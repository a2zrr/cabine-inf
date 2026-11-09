<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:med="http://www.univ-grenoble-alpes.fr/l3miage/medical">

  <xsl:output method="html" encoding="UTF-8" indent="yes"/>

  <!-- Page -->
  <xsl:template match="/">
    <html lang="fr">
      <head>
        <title>
          <xsl:value-of select="med:cabinet/med:nom"/>
        </title>
      </head>
      <body>
        <xsl:apply-templates select="med:cabinet"/>
        <script src="../js/cabinet.js"></script>
      </body>
    </html>
  </xsl:template>

  <!-- Cabinet -->
  <xsl:template match="med:cabinet">
    <header>
      <p>Cabinet infirmier</p>
      <h1>
        <xsl:value-of select="med:nom"/>
      </h1>
      <p>
        <xsl:value-of select="concat(med:adresse/med:numero, ' ', med:adresse/med:rue, ', ', med:adresse/med:codePostal, ' ', med:adresse/med:ville)"/>
      </p>
    </header>

    <main>
      <h2>Gestion du cabinet</h2>

      <section id="infirmiers">
        <h3>Infirmiers</h3>
        <button type="button" id="ajouter-infirmier">+ Ajouter un infirmier</button>
        <ul>
          <xsl:apply-templates select="med:infirmiers/med:infirmier"/>
        </ul>
      </section>

      <section id="patients">
        <h3>Patients</h3>
        <button type="button" id="ajouter-patient">+ Ajouter un patient</button>
        <ul>
          <xsl:apply-templates select="med:patients/med:patient"/>
        </ul>
      </section>
    </main>
  </xsl:template>

  <!-- Un infirmier -->
  <xsl:template match="med:infirmier">
    <li>
      <img src="../img/{med:photo}"/>
      <strong>
        <xsl:value-of select="concat(med:prenom, ' ', med:nom)"/>
      </strong>
      <p>Identifiant <xsl:value-of select="@id"/>
      </p>
      <button type="button" class="modifier-infirmier">Modifier</button>
      <button type="button" class="supprimer-infirmier">Supprimer</button>
    </li>
  </xsl:template>

  <!-- Un patient -->
  <xsl:template match="med:patient">
    <li>
      <strong>
        <xsl:value-of select="concat(med:prenom, ' ', med:nom)"/>
      </strong>
      <p>
        <xsl:text>Né le </xsl:text>
        <xsl:value-of select="med:naissance"/>
        <xsl:text> à </xsl:text>
        <xsl:value-of select="med:adresse/med:ville"/>
      </p>
      <button type="button" class="modifier-patient">Modifier</button>
      <button type="button" class="supprimer-patient">Supprimer</button>
    </li>
  </xsl:template>

</xsl:stylesheet>
