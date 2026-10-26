<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:etu="http://www.univ-grenoble-alpes.fr/l3miage/medical"
                version="3.0">

  <xsl:output method="html"/>

  <xsl:template match="/">
    <html>
      <head>
        <title>Cabinet médical</title>
      </head>
      <body>
        <h1>
          <xsl:value-of select="etu:cabinet/etu:nom"/>
        </h1>
        <h2>Adresse du cabinet</h2>
        <p>
          <!--
               returns the string value of an element,
               including the text of all its descendant elements
          -->
          <xsl:value-of select="etu:cabinet/etu:adresse"/>
        </p>
        <h2>Nos infirmiers</h2>
        <xsl:apply-templates select="etu:cabinet/etu:infirmiers/etu:infirmier"/>
        <h2>Liste des patients</h2>

        <table border="1">
          <thead>
            <tr>
              <th>Nom</th>
              <th>Prenom</th>
              <th>Sexe</th>
              <th>Date de naissance</th>
              <th>Adresse</th>
              <th>Visites</th>
            </tr>
          </thead>
          <tbody>
            <xsl:apply-templates select="etu:cabinet/etu:patients/etu:patient"/>
          </tbody>
        </table>
      </body>
    </html>
    
  </xsl:template>

  <xsl:template match="etu:infirmier">
    <div>
      <h4>
        <xsl:value-of select="etu:nom"/>
        <!-- this is used to avoid things like "nomprenom" -->
        <xsl:text> </xsl:text>
        <xsl:value-of select="etu:prenom"/>
      </h4>
    </div>
  </xsl:template>

  <xsl:template match="etu:patient">
    <tr>
      <td>
        <xsl:value-of select="etu:nom"/>
      </td>
      <td>
        <xsl:value-of select="etu:prenom"/>
      </td>
      <td>
        <xsl:value-of select="etu:sexe"/>
      </td>
      <td>
        <xsl:value-of select="etu:naissance"/>
      </td>
      <td>
        <xsl:value-of select="etu:adresse"/>
      </td>
      <td>
        <xsl:apply-templates select="etu:visite"/>
      </td>
    </tr>
  </xsl:template>


  <xsl:template match="etu:visite">
    <p>
      Date : <xsl:value-of select="@date"/>
    </p>
    <xsl:apply-templates select="etu:acte"/>
  </xsl:template>

  <xsl:template match="etu:acte">
    <p>
      <xsl:value-of select="."/>
    </p>
  </xsl:template>
  
</xsl:stylesheet>