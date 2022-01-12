<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/instruments">
        <html>
            <head>
                <meta charset="utf-8"/>
                <title>Musical instruments</title>
                <link rel="stylesheet" href="style.css" type="text/css"/>

            </head>

            <body>
                <h1>Popular musical instruments</h1>
                <div class="container">

                    <xsl:for-each select="instrument">
                        <xsl:choose>
                            <xsl:when test="@type='wind'">
                                <div class="card">
                                    <img>
                                        <xsl:attribute name="src">
                                            <xsl:value-of select="image"/>
                                        </xsl:attribute>
                                    </img>
                                    <div class="text-container red">
                                        <span class="name">
                                            <xsl:value-of select="name"/>
                                        </span>
                                        <p>
                                            <xsl:value-of select="description"/>
                                        </p>
                                        <span class="category-span">Category:
                                            <xsl:value-of select="category/text() "/>
                                        </span>
                                    </div>

                                </div>
                            </xsl:when>
                            <xsl:when test="@type='key'">
                                <div class="card">
                                    <img>
                                        <xsl:attribute name="src">
                                            <xsl:value-of select="image"/>
                                        </xsl:attribute>
                                    </img>
                                    <div class="text-container green">
                                        <span class="name">
                                            <xsl:value-of select="name"/>
                                        </span>
                                        <p>
                                            <xsl:value-of select="description"/>
                                        </p>
                                        <span class="category-span">Category:
                                            <xsl:value-of select="category/text() "/>
                                        </span>
                                    </div>

                                </div>
                            </xsl:when>

                            <xsl:otherwise>
                                <div class="card">
                                    <img>
                                        <xsl:attribute name="src">
                                            <xsl:value-of select="image"/>
                                        </xsl:attribute>
                                    </img>
                                    <div class="text-container blue">
                                        <span class="name">
                                            <xsl:value-of select="name"/>
                                        </span>
                                        <p>
                                            <xsl:value-of select="description"/>
                                        </p>
                                        <span class="category-span">Category:
                                            <xsl:value-of select="category/text() "/>
                                        </span>
                                    </div>

                                </div>

                        </xsl:otherwise>
                    </xsl:choose>

                </xsl:for-each>
            </div>
        </body>
    </html>
</xsl:template>
        </xsl:stylesheet>