<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : AwardsFilms.xsl
    Created on : 4 de mayo de 2023, 8:19
    Author     : 1dami
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/">
        <html>
            <head>
                <title>AwardsFilms.xsl</title>
            </head>
            <table border = "1">
                <tr>
                    <th>Film</th>
                    <th>Nº of nominations</th>
                    <th>Nº of victories</th>
                    <th>Awards</th>
                    <th>Result</th> 
                </tr>
                <xsl:for-each select="//film">
                    <tr>
                        <td>
                            <xsl:value-of select="name"/>
                        </td>
                        <td>
                            <xsl:for-each select="//film/awards/award/nomination">
                                <xsl:value-of select="count(//film/nomination)"/>
                            </xsl:for-each>
                        </td>                   
                        <td>
                            <xsl:for-each select="//award/nomination">
                                <xsl:variable name="id" select="//award/@id"/>
                                <xsl:if select="//film/awards/award/nomination[@id = id]">
                                    <xsl:value-of select="count(//awards/award/nomination/result/Won)"/>
                                </xsl:if>
                            </xsl:for-each>
                        </td> 
                        <td>
                                
                        </td>
                    </tr>
                </xsl:for-each>
                
            </table>
            <body>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
