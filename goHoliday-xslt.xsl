<!--
	Filename: goHoliday-xslt.xsl
	Author: Connor Marsden
	Student Number: c3349479
	Creation date: 27/10/2020
-->

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!--Outputs in html-->
<xsl:output method="html" />
    <!--Matchs DOCTYPE goHoliday-->
    <xsl:template match="goHoliday">
        <html>
            <head>
                <!--Linking CSS-->
                <link rel="stylesheet" type="text/css" href="style.css" />
                <meta charset="UTF-8" />
                <!--Setting website tab title name-->
                <title> About | goHoliday</title>  
            </head>
            <body>
                <header>
                    <!--References a class to format the text and box surrounding it-->	
                    <h1 class="headerbox">goHoliday Vacations</h1>
                    <!--In p references a class to format surrounding underhead box-->
                    <p class="underheaderbox">
                        <a href = "index.html"> Home</a>	<!--Navigates to home page-->
                    </p>
                
                    <!--Adds tag that formats white box surrounding all of main-->
                    <main id="xslBackgroundBox">
                        <!--Orders name location of packages in descending-->
                        <xsl:apply-templates select="package">
                            <xsl:sort select="accommodationOptions/location" />
                        </xsl:apply-templates>
                        
                        <hr/>
                        <p id="copyright">
                            Copyright (c) 2020 by Connor Marsden (c3349479)<br/> <!--Adds copyright class-->
                            <a href="https://www.google.com.au">c3349479@uon.edu.au</a><br/>
                            SENG1050 - Assignment 2<br/> 
                        </p>   
                    </main>
                </header>
            </body> 
        </html>
    </xsl:template>

    <!--Creates template that can be applied for all packages-->
    <xsl:template match="package">
    
            <main> 
                    <h2>
                        <xsl:text> Holiday for </xsl:text>
                        <xsl:value-of select="accommodationOptions/location" />
                        <xsl:text>, </xsl:text>
                        <xsl:value-of select="packageName"/>
                        
                    </h2>
                    <section class="sidetexthead">
                        <div class="sidetext">
                        <!--Outputs popularity rating and reviews-->
                        <b><xsl:value-of select="popularity"/></b>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="reviews"/><br/>
                        
                        <!--Outputs cost then additional costs for x nights with avalibility of x-->
                        <xsl:text>Cost: </xsl:text>
                        <xsl:value-of select="cost"/>
                        <xsl:text> + </xsl:text>
                        <xsl:value-of select="accommodationOptions/additionalCost"/> 
                        <xsl:text> for </xsl:text>
                        <xsl:value-of select="nightNo"/>
                        <xsl:text> nights, with </xsl:text>
                        <xsl:value-of select="availability"/>
                        <xsl:text> avaliability </xsl:text><br/>
                        
                        <!--Outputs description alongside special event-->
                        <xsl:text>Description: </xsl:text>
                        <xsl:value-of select="description"/>
                        <xsl:text> With events like </xsl:text>
                        <xsl:value-of select="specialEvent"/>
                        <xsl:text>. </xsl:text>
                        </div>
                        
                        <!--Outputs image correlated to package-->
                        <img alt="XML Image">
                            <xsl:attribute name="src">
                                <xsl:value-of select="xmlImage"/>
                            </xsl:attribute>    
                        </img>
                    </section>     
            </main>
    </xsl:template> 
</xsl:stylesheet> 