<?xml version="1.0" encoding="UTF-8"?>
<!--
    Progetto esame-corso Codifica di testi 19-20
    Studente: Simona Sette
    Matricola: 544298
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" version="1.0">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/"> 
        <html>
            <head>
                <meta name="viewport" content="width=device-width, initial-scale=1"/> 
                <xsl:element name="meta">
                    <xsl:attribute name="name">author</xsl:attribute>
                    <xsl:attribute name="content">
                        <xsl:value-of select="//tei:titleStmt/tei:respStmt[1]/tei:name"/>
                    </xsl:attribute>
                </xsl:element>
                <title>
                    <xsl:value-of select="//tei:titleStmt/tei:title"/>
                </title>
                <link rel="stylesheet" href="graf.css"></link>
            </head>
            <body>
                <header>
                    <ul>
                        <li><a href ="#info">Informazioni sul Corpus</a></li>
                        <li><a href ="#c17">Cartolina 17</a></li>
                        <li><a href ="#c18">Cartolina 18</a></li>
                        <li><a href ="#about">Crediti</a></li>
                    </ul> 
                    <h1>
                        <xsl:value-of select="//tei:titleStmt/tei:title"/>
                    </h1>
                </header>
                <div id="info">
                    <section class="boxed">
                        <div class="main">
                            <h2>Informazioni sul Corpus</h2>
                            <div class="boxed">
                                <p><b>Nome del Corpus: </b><xsl:value-of select="//tei:titleStmt/tei:title"/></p>
                                <p><b>Numero di testi che compongono il corpus: </b><xsl:value-of select="count(/tei:teiCorpus/tei:TEI)"/></p>
                                <p><b><xsl:value-of select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:respStmt[2]/tei:resp"/></b><xsl:text> </xsl:text>
                                    <xsl:value-of select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:respStmt[2]/tei:name"/>
                                </p>
                                <p><b>Luogo di conservazione delle risorse: </b><xsl:value-of select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:repository"/>, 
                                    <xsl:value-of select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:settlement"/>,
                                    <xsl:value-of select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:country"/>
                                </p>
                                <p><b>Edizione: </b><xsl:value-of select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:editionStmt/tei:edition/text()"/></p>
                                <p><b>Editore: </b><xsl:value-of select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:publisher"/></p>
                                <p><b>Distribuzione da parte di: </b><xsl:value-of select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:distributor"/>, 
                                <xsl:value-of select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:address/tei:addrLine[1]"/></p>
                                <p><b>Luogo di pubblicazione: </b><xsl:value-of select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:pubPlace"/></p>
                                <p><b>Anno di compilazione: </b><xsl:value-of select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:editionStmt/tei:edition/tei:date"/></p>
                                <p><b>Anno di rilascio: </b><xsl:value-of select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:date"/></p>
                                <p><b>Disponibilità: </b><xsl:value-of select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:availability/tei:p"/></p>
                                <h4>Luoghi citati:</h4>
                                <xsl:for-each select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPlace/tei:place">
                                    <p>- <xsl:value-of select="tei:placeName"/>
                                        <xsl:if test="tei:district[2]">
                                            (<xsl:value-of select="tei:district[2]"/>)
                                        </xsl:if>
                                    </p>   
                                </xsl:for-each>
                                <h4>Persone citate:</h4>
                                <xsl:for-each select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPerson/tei:person">
                                    <p>- <xsl:value-of select="tei:persName/tei:forename"/><xsl:text> </xsl:text>
                                        <xsl:value-of select="tei:persName/tei:surname"/>
                                        <xsl:if test="tei:occupation">
                                            <xsl:text> </xsl:text>
                                            <xsl:value-of select="tei:occupation"/>
                                        </xsl:if>
                                        <xsl:if test="tei:note">
                                            (<xsl:value-of select="tei:note"/>)
                                        </xsl:if>
                                    </p>   
                                </xsl:for-each>    
                            </div>
                        </div>
                    </section> 
                </div>
                <div id="c17">
                    <section class="boxed">
                        <div class="main">
                            <xsl:apply-templates select="tei:teiCorpus/tei:TEI[1]/tei:teiHeader/tei:fileDesc/tei:titleStmt"/>
                            <h3>-Cartolina 017-</h3>
                            <div class="insidebox">
                                <xsl:apply-templates select="tei:teiCorpus/tei:TEI[1]/tei:teiHeader"/>
                                <h3>Dati sulla corrispondenza:</h3>
                                <p>La cartolina è stata inviata da <xsl:value-of select="tei:teiCorpus/tei:teiHeader//tei:person[@xml:id='RB']/tei:persName"/>
                                a <xsl:value-of select="tei:teiCorpus/tei:teiHeader//tei:person[@xml:id='GT']/tei:persName"/> 
                                (il quale risiedeva presso la città di <xsl:value-of select="tei:teiCorpus/tei:teiHeader//tei:place[@xml:id='RV']/tei:placeName"/>).
                                Dai dati estrapolabili dalla cartolina si può assumere che essa sia stata scritta e spedita il giorno
                                <xsl:value-of select="tei:teiCorpus/tei:TEI[1]/tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction/tei:date[1]"/>.</p>
                            </div>
                            <div class="insidebox">
                                <h3>Scannerizzazioni e Codifica</h3>
                                <h4>Fronte della cartolina</h4>
                                <xsl:element name="img">
                                    <xsl:attribute name="src">
                                        <xsl:value-of select="tei:teiCorpus/tei:TEI/tei:facsimile/tei:surface[@xml:id='cart017F']/tei:graphic/@url"/>
                                    </xsl:attribute>
                                </xsl:element>
                                <xsl:apply-templates select="tei:teiCorpus/tei:TEI[1]/tei:text"/>
                                <h4>Retro della cartolina</h4>
                                <xsl:element name="img">
                                    <xsl:attribute name="src">
                                        <xsl:value-of select="tei:teiCorpus/tei:TEI/tei:facsimile/tei:surface[@xml:id='cart017R']/tei:graphic/@url"/>
                                    </xsl:attribute>
                                </xsl:element>
                                <div class="cards">
                                    <div class="sectioncardl">
                                        <p><xsl:value-of select="tei:teiCorpus/tei:TEI[1]/tei:text/tei:body/tei:div[2]/tei:div[2]/tei:p[3]/tei:idno"/></p>
                                        <p><xsl:apply-templates select="tei:teiCorpus/tei:TEI[1]/tei:text/tei:body/tei:div[2]/tei:div[2]/tei:p/tei:stamp[3]/tei:mentioned/tei:unclear"/>
                                          <xsl:value-of select="tei:teiCorpus/tei:TEI[1]/tei:text/tei:body/tei:div[2]/tei:div[2]/tei:p/tei:stamp[3]"/></p><br/>
                                        <p><xsl:value-of select="tei:teiCorpus/tei:TEI[1]/tei:text/tei:body/tei:div[2]/tei:div[1]/tei:opener/tei:date"/></p>
                                        <p>
                                            <xsl:for-each select="tei:teiCorpus/tei:TEI[1]/tei:text/tei:body/tei:div[2]/tei:div[1]/tei:closer/tei:salute/tei:s">
                                               <xsl:apply-templates/>
                                            </xsl:for-each>
                                        </p>
                                        <p>
                                            <xsl:for-each select="tei:teiCorpus/tei:TEI[1]/tei:text/tei:body/tei:div[2]/tei:div[1]/tei:closer/tei:signed">
                                               <xsl:apply-templates/>
                                            </xsl:for-each>
                                        </p>
                                    <div class="paintbox">
                                        <p><xsl:value-of select="tei:teiCorpus/tei:TEI[1]/tei:text/tei:body/tei:div[2]/tei:div[3]/tei:p[2]/tei:s"/></p>
                                    </div>
                                    </div>
                                    <div class="vl"></div>
                                    <div class="sectioncardr"> 
                                        <div class="twostampsL">
                                            <xsl:apply-templates select="tei:teiCorpus/tei:TEI[1]/tei:text/tei:body/tei:div[2]/tei:div[2]/tei:p[1]/tei:stamp[1]"/>
                                        </div>
                                        <div class="twostampsR">
                                            <xsl:apply-templates select="tei:teiCorpus/tei:TEI[1]/tei:text/tei:body/tei:div[2]/tei:div[2]/tei:p[1]/tei:stamp[2]"/>   
                                        </div>
                                        <span class="comm">
                                            <p><xsl:apply-templates select="tei:teiCorpus/tei:TEI[1]/tei:text/tei:body/tei:div[2]/tei:div[3]/tei:p/tei:figure/tei:head"/></p><br/>
                                        </span>
                                        <div class="smallrect">
                                            <xsl:apply-templates select="tei:teiCorpus/tei:TEI[1]/tei:text/tei:body/tei:div[2]/tei:div[3]/tei:p/tei:figure"/>
                                        </div>
                                        <xsl:apply-templates select="tei:teiCorpus/tei:TEI[1]/tei:text/tei:body/tei:div[2]/tei:div[2]/tei:p[2]/tei:address"/>  
                                    </div>
                                </div>
                                <div>
                                    <h3>Fenomeni linguistici particolari</h3>
                                    <p>All'interno della cartolina sono presenti due casi di utilizzo del grafema <i>V</i> in sostituzione al grafema <i>U</i>.
                                    La distinzione grafica fra <i>U</i> e <i>V</i> divenne di uso comune solo alla fine del XVII secolo e definitiva alla fine del XVIII secolo.</p>
                                </div>
                            </div>   
                        </div>
                    </section> 
                </div>
                <div id="c18">
                    <section class="boxed">
                        <div class="main">
                            <xsl:apply-templates select="tei:teiCorpus/tei:TEI[2]/tei:teiHeader/tei:fileDesc/tei:titleStmt"/>
                            <h3>-Cartolina 018-</h3>
                            <div class="insidebox">
                                <xsl:apply-templates select="tei:teiCorpus/tei:TEI[2]/tei:teiHeader"/>  
                                <h3>Dati sulla corrispondenza:</h3>
                                <p>La cartolina è stata inviata da <xsl:value-of select="tei:teiCorpus/tei:teiHeader//tei:person[@xml:id='BR']/tei:persName"/>
                                    a <xsl:value-of select="tei:teiCorpus/tei:teiHeader//tei:person[@xml:id='OT']/tei:persName"/> 
                                    (la quale risiedeva presso la città di <xsl:value-of select="tei:teiCorpus/tei:teiHeader//tei:place[@xml:id='RV']/tei:placeName"/>).
                                    Non è stato possibile risalire con precisione alle date di questa corrispondenza, ma dal contenuto della cartolina è possibile ipotizzare che sia stata scritta nel mese di ottobre del 1915.
                                </p>
                            </div>
                            <div class="insidebox">
                                <h3>Scannerizzazioni e Codifica</h3>
                                <h4>Fronte della cartolina</h4>
                                <xsl:element name="img">
                                    <xsl:attribute name="src">
                                        <xsl:value-of select="tei:teiCorpus/tei:TEI/tei:facsimile/tei:surface[@xml:id='cart018F']/tei:graphic/@url"/>
                                    </xsl:attribute>
                                </xsl:element>
                                <xsl:apply-templates select="tei:teiCorpus/tei:TEI[2]/tei:text"/>  
                                <h4>Retro della cartolina</h4>
                                <xsl:element name="img">
                                    <xsl:attribute name="src">
                                        <xsl:value-of select="tei:teiCorpus/tei:TEI/tei:facsimile/tei:surface[@xml:id='cart018R']/tei:graphic/@url"/>
                                    </xsl:attribute>
                                </xsl:element> 
                                <div class="cards">
                                    <div class="sectioncardl">
                                        <p><xsl:value-of select="tei:teiCorpus/tei:TEI[2]/tei:text/tei:body/tei:div[2]/tei:div[2]/tei:p[3]/tei:idno"/></p>
                                        <p>Timbro postale:<xsl:apply-templates select="tei:teiCorpus/tei:TEI[2]/tei:text/tei:body/tei:div[2]/tei:div[2]/tei:p/tei:stamp[1]/tei:mentioned/tei:gap"/> </p>
                                        <p><xsl:value-of select="tei:teiCorpus/tei:TEI[2]/tei:text/tei:body/tei:div[2]/tei:div[2]/tei:p/tei:stamp[3]"/></p>
                                        <p><xsl:apply-templates select="tei:teiCorpus/tei:TEI[2]/tei:text/tei:body/tei:div[2]/tei:div[2]/tei:p/tei:stamp[2]//tei:mentioned/tei:unclear"/> 
                                        <xsl:value-of select="tei:teiCorpus/tei:TEI[2]/tei:text/tei:body/tei:div[2]/tei:div[2]/tei:p/tei:stamp[2]"/></p><br/>
                                        <p><xsl:for-each select="tei:teiCorpus/tei:TEI[2]/tei:text/tei:body/tei:div[2]/tei:div[1]/tei:opener/tei:salute">
                                          <xsl:apply-templates/>
                                        </xsl:for-each></p>
                                        <p><xsl:value-of select="tei:teiCorpus/tei:TEI[2]/tei:text/tei:body/tei:div[2]/tei:div[1]/tei:closer/tei:signed"/></p>
                                        <p><xsl:apply-templates select="tei:teiCorpus/tei:TEI[2]/tei:text/tei:body/tei:div[2]/tei:div[1]/tei:closer/tei:date"/></p>
                                        <div class="small">
                                            <p>
                                                <xsl:for-each select="tei:teiCorpus/tei:TEI[2]/tei:text/tei:body/tei:div[2]/tei:div[3]/tei:p[2]">
                                                    <xsl:apply-templates/>   
                                                </xsl:for-each>
                                            </p>
                                        </div>
                                    </div>
                                    <div class="vl"></div>
                                    <div class="sectioncardr">
                                        <span class="comm">
                                            <p><xsl:apply-templates select="tei:teiCorpus/tei:TEI[2]/tei:text/tei:body/tei:div[2]/tei:div[3]/tei:p/tei:figure/tei:head"/></p><br/>
                                        </span>
                                        <div class="smallrect">
                                            <xsl:apply-templates select="tei:teiCorpus/tei:TEI[2]/tei:text/tei:body/tei:div[2]/tei:div[3]/tei:p/tei:figure"/> 
                                        </div><br/>
                                        <p><xsl:apply-templates select="tei:teiCorpus/tei:TEI[2]/tei:text/tei:body/tei:div[2]/tei:div[2]/tei:p[2]/tei:address"/></p>    
                                    </div>   
                                </div>
                                <div>
                                    <h3>Fenomeni linguistici particolari</h3>
                                    <p>All'interno della cartolina sono presenti due casi di utilizzo del grafema <i>V</i> in sostituzione al grafema <i>U</i>.
                                    La distinzione grafica fra <i>U</i> e <i>V</i> divenne di uso comune solo alla fine del XVII secolo e definitiva alla fine del XVIII secolo.</p>
                                </div>
                            </div>
                        </div>
                    </section>  
                </div>          
                <div id="about">
                    <section class="boxed">
                        <div class="main">
                            <h2>Crediti</h2>
                            <div class="boxed">
                                <p><b><xsl:value-of select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:respStmt/tei:resp"/></b><xsl:value-of select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:respStmt/tei:name"/></p>
                                <xsl:for-each select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:editionStmt/tei:respStmt">
                                    <p><b><xsl:value-of select="tei:resp"/></b><xsl:text> </xsl:text><xsl:value-of select="tei:name"/></p>   
                                </xsl:for-each>
                            </div>
                        </div>
                    </section> 
                </div>
            </body>
        </html>
    </xsl:template>
    <!--template informazioni singole cartoline-->
    <xsl:template match="tei:teiCorpus/tei:TEI/tei:teiHeader">
        <h3>Informazioni</h3>
        <p><b>N. Identificativo: </b><xsl:value-of select="tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:idno"/></p>
        <p><b>Oggetto: </b><xsl:value-of select="tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:physDesc/tei:objectDesc/tei:supportDesc/tei:support/tei:objectType"/></p>
        <p><b>Materiale di supporto: </b><xsl:value-of select="tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:physDesc/tei:objectDesc/tei:supportDesc/tei:support/tei:material"/></p>
        <p><b>Dimensioni del supporto: </b><xsl:value-of select="tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:physDesc/tei:objectDesc/tei:supportDesc/tei:support/tei:dimensions/tei:height"/>x<xsl:value-of select="//tei:TEI[2]/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:physDesc/tei:objectDesc/tei:supportDesc/tei:support/tei:dimensions/tei:width"/>cm</p>
        <p><b>Condizioni: </b><xsl:value-of select="tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:physDesc/tei:objectDesc/tei:supportDesc/tei:condition"/></p>
        <p><b>Lingua: </b><xsl:value-of select="tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msContents/tei:textLang"/></p>
        <p><b>Caratteristica: </b><xsl:value-of select="tei:fileDesc/tei:notesStmt/tei:note"/></p>
        <p><b>Descrizione: </b><xsl:value-of select="tei:profileDesc/tei:textClass/tei:keywords/tei:term[2]"/></p>
        <p><b>Rappresentazione: </b><xsl:value-of select="tei:profileDesc/tei:textClass/tei:keywords/tei:term[3]"/></p>
        <p><b>Titolo dell'opera sul fronte: </b><xsl:value-of select="tei:fileDesc/tei:sourceDesc/tei:bibl/tei:title"/></p>
        <p><b>Autore dell'opera sul fronte: </b><xsl:value-of select="tei:fileDesc/tei:sourceDesc/tei:bibl/tei:author"/></p>
    </xsl:template>

    <!--template titoli  cartoline-->
    <xsl:template match="tei:teiCorpus/tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt">
        <h2><xsl:value-of select="tei:title"/></h2>
    </xsl:template>

    <!--tamplate dati immagini fronte cartoline -->
     <xsl:template match="tei:teiCorpus/tei:TEI/tei:text">
        <p><b>Opera: </b><xsl:value-of select="tei:body/tei:div[1]/tei:figure/tei:head"/></p>
        <p><b>Descrizione dell'opera: </b><xsl:value-of select="tei:body/tei:div[1]/tei:figure/tei:figDesc"/></p> 
    </xsl:template>
         
    <!--template stamps cart17-->
    <xsl:template match="tei:teiCorpus/tei:TEI[1]/tei:text/tei:body/tei:div[2]/tei:div[2]/tei:p[1]/tei:stamp">   
       <p><xsl:value-of select="tei:mentioned/tei:placeName[1]"/></p>
       <p><xsl:value-of select="tei:mentioned/tei:placeName[2]"/></p>
       <p><xsl:value-of select="tei:date"/></p>
    </xsl:template>

    <!--template quotefig-->
    <xsl:template match="tei:teiCorpus/tei:TEI/tei:text/tei:body/tei:div[2]/tei:div[3]/tei:p/tei:figure">   
        <xsl:for-each select="tei:figDesc/tei:quote/tei:s">
            <p><xsl:apply-templates/></p>  
        </xsl:for-each>
    </xsl:template>

    <!--template casistica gap-->
    <xsl:template match="tei:gap">
            <xsl:choose>
                <xsl:when test="./@reason='illegible'"><span class="blue">[illeggibile]</span></xsl:when>
                <xsl:when test="./@reason='position'"><span class="blue">[illeggibile causa posizionamento]</span></xsl:when>
            </xsl:choose>
	</xsl:template>

    <!--template casistica unclear-->
    <xsl:template match="tei:unclear">
            <xsl:choose>
                <xsl:when test="./@reason='illegible'"><span class="blue">[illeggibile]</span></xsl:when>
                <xsl:when test="./@reason='faded'"><span class="blue">[non chiaro causa sbiadimento]</span></xsl:when>
            </xsl:choose>
	</xsl:template>

    <!--template casistica lb-->
    <xsl:template match="tei:lb">
        <br/>
    </xsl:template>

    <!--template casistica distinct(U-V)-->
    <xsl:template match="tei:distinct">
        <span class="green">V</span>
	</xsl:template>

    <!--template head-->
    <xsl:template match="tei:head">
        <xsl:for-each select="tei:s">
            <xsl:apply-templates/>  
        </xsl:for-each>
    </xsl:template>

    <!--template casistica choice-->
    <xsl:template match="tei:choice">
        <xsl:value-of select="tei:abbr"/>
        <span class="green"> [Interpretazione: <xsl:value-of select="tei:expan"/>]</span>
     </xsl:template>
</xsl:stylesheet>