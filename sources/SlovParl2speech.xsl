<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei"
    version="2.0">
    
    <!-- izhodiščni dokument je SSK11-list.xml -->
    
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:variable name="terms" xmlns="http://www.siparl.si" xmlns:parl="http://www.siparl.si">
        <term n="11" start="1990-05-05" end="1992-12-23">11. mandat (1990-1992)</term>
    </xsl:variable>
    
    <xsl:param name="taxonomy-legislature">
        <taxonomy>
            <desc xml:lang="en">Legislature</desc>
            <desc xml:lang="sl">Zakonodajna oblast</desc>
            <category>
                <desc xml:lang="en">Geo-political or administrative units</desc>
                <desc xml:lang="sl">Geopolitične ali upravne enote</desc>
                <category xml:id="parl.supranational">
                    <catDesc xml:lang="en"><term>Supranational legislature</term></catDesc>
                    <catDesc xml:lang="sl"><term>Nadnacionalna zakonodajna oblast</term></catDesc>
                </category>
                <category xml:id="parl.national">
                    <catDesc xml:lang="en"><term>National legislature</term></catDesc>
                    <catDesc xml:lang="sl"><term>Nacionalna zakonodajna oblast</term></catDesc>
                </category>
                <category xml:id="parl.regional">
                    <catDesc xml:lang="en"><term>Regional legislature</term></catDesc>
                    <catDesc xml:lang="sl"><term>Regionalna zakonodajna oblast</term></catDesc>
                </category>
                <category xml:id="parl.local">
                    <catDesc xml:lang="en"><term>Local legislature</term></catDesc>
                    <catDesc xml:lang="sl"><term>Lokalna zakonodajna oblast</term></catDesc>
                </category>
            </category>
            <category>
                <desc xml:lang="en">Organization</desc>
                <desc xml:lang="sl">Organiziranost</desc>
                <category>
                    <desc xml:lang="en">Chambers</desc>
                    <desc xml:lang="sl">Zbori</desc>
                    <category xml:id="par.uni">
                        <catDesc xml:lang="en"><term>Unicameralism</term></catDesc>
                        <catDesc xml:lang="sl"><term>Enodomen</term></catDesc>
                    </category>
                    <category xml:id="par.bi">
                        <catDesc xml:lang="en"><term>Bicameralism</term></catDesc>
                        <catDesc xml:lang="sl"><term>Dvodomen</term></catDesc>
                        <category xml:id="par.upper">
                            <catDesc xml:lang="en"><term>Upper house</term></catDesc>
                            <catDesc xml:lang="sl"><term>Zgornji dom</term></catDesc>
                        </category>
                        <category xml:id="par.lower">
                            <catDesc xml:lang="en"><term>Lower house</term></catDesc>
                            <catDesc xml:lang="sl"><term>Spodnji dom</term></catDesc>
                        </category>
                    </category>
                    <category xml:id="par.multi">
                        <catDesc xml:lang="en"><term>Multicameralism</term></catDesc>
                        <catDesc xml:lang="sl"><term>Večdomen</term></catDesc>
                        <category xml:id="par.chamber">
                            <catDesc xml:lang="en"><term>Chamber</term></catDesc>
                            <catDesc xml:lang="sl"><term>Zbor</term></catDesc>
                        </category>
                    </category>
                </category>
                <category xml:id="parl.committee">
                    <catDesc xml:lang="en"><term>Committee</term></catDesc>
                    <catDesc xml:lang="sl"><term>Delovno telo</term></catDesc>
                    <category xml:id="parl.committee.standing">
                        <catDesc xml:lang="en"><term>Standing committee</term></catDesc>
                        <catDesc xml:lang="sl"><term>Stalno delovno telo</term></catDesc>
                    </category>
                    <category xml:id="parl.committee.special">
                        <catDesc xml:lang="en"><term>Special committee</term></catDesc>
                        <catDesc xml:lang="sl"><term>Začasno delovno telo</term></catDesc>
                    </category>
                    <category xml:id="parl.committee.inquiry">
                        <catDesc xml:lang="en"><term>Committee of inquiry </term></catDesc>
                        <catDesc xml:lang="sl"><term>Preiskovalna komisija</term></catDesc>
                    </category>
                </category>
            </category>
            <category xml:id="parl.term">
                <catDesc xml:lang="en"><term>Legislative period</term>: term of the parliament between
                    general elections.</catDesc>
                <catDesc xml:lang="sl">Zakonodajno obdobje</catDesc>
                <category xml:id="parl.session">
                    <catDesc xml:lang="en"><term>Legislative session</term>: the period of time in which
                        a legislature is convened for purpose of lawmaking, usually being
                        one of two or more smaller divisions of the entire time between two
                        elections. A session is a meeting or series of connected meetings
                        devoted to a single order of business, program, agenda, or announced
                        purpose.</catDesc>
                    <catDesc xml:lang="sl">Parlamentaro zasedanje</catDesc>
                    <category xml:id="parl.meeting">
                        <catDesc xml:lang="en"><term>Meeting</term>: Each meeting may be a
                            separate session or part of a group of meetings constituting a
                            session. The session/meeting may take one or more
                            days.</catDesc>
                        <catDesc xml:lang="sl"><term>Seja</term></catDesc>
                        <category>
                            <desc xml:lang="en">Types of meetings</desc>
                            <category xml:id="parl.meeting.regular">
                                <catDesc xml:lang="en"><term>Regular meeting</term></catDesc>
                                <catDesc xml:lang="sl"><term>Redna seja</term></catDesc>
                            </category>
                            <category xml:id="parl.meeting.special">
                                <catDesc xml:lang="en"><term>Special meeting</term></catDesc>
                                <catDesc xml:lang="sl"><term>Posebna seja</term></catDesc>
                                <category xml:id="parl.meeting.extraordinary">
                                    <catDesc xml:lang="en"><term>Extraordinary meeting</term></catDesc>
                                    <catDesc xml:lang="sl"><term>Izredna seja</term></catDesc>
                                </category>
                                <category xml:id="parl.meeting.urgent">
                                    <catDesc xml:lang="en"><term>Urgent meeting</term></catDesc>
                                    <catDesc xml:lang="sl"><term>Nujna seja</term></catDesc>
                                </category>
                                <category xml:id="parl.meeting.ceremonial">
                                    <catDesc xml:lang="en"><term>Ceremonial meeting</term></catDesc>
                                    <catDesc xml:lang="sl"><term>Slavnostna seja</term></catDesc>
                                </category>
                                <category xml:id="parl.meeting.commemorative">
                                    <catDesc xml:lang="en"><term>Commemorative meeting</term></catDesc>
                                    <catDesc xml:lang="sl"><term>Žalna seja</term></catDesc>
                                </category>
                                <category xml:id="parl.meeting.opinions">
                                    <catDesc xml:lang="en"><term>Public presentation of opinions</term></catDesc>
                                    <catDesc xml:lang="sl"><term>Javna predstavitev mnenj</term></catDesc>
                                </category>
                            </category>
                            <category xml:id="parl.meeting.continued">
                                <catDesc xml:lang="en"><term>Continued meeting</term></catDesc>
                            </category>
                            <category xml:id="parl.meeting.public">
                                <catDesc xml:lang="en"><term>Public meeting</term></catDesc>
                                <catDesc xml:lang="sl"><term>Javna seja</term></catDesc>
                            </category>
                            <category xml:id="parl.meeting.executive">
                                <catDesc xml:lang="en"><term>Executive meeting</term></catDesc>
                                <catDesc xml:lang="sl"><term>Zaprta seja</term></catDesc>
                            </category>
                        </category>
                        <category xml:id="parl.sitting">
                            <catDesc xml:lang="en"><term>Sitting</term>: sitting day</catDesc>
                            <catDesc xml:lang="sl"><term>Dan seje</term></catDesc>
                        </category>
                    </category>
                </category>
            </category>
        </taxonomy>
    </xsl:param>
    
    <xsl:param name="taxonomy-speakers">
        <taxonomy>
            <desc xml:lang="en">Types of speakers</desc>
            <desc xml:lang="sl">Vrste govornikov</desc>
            <category xml:id="chair">
                <catDesc xml:lang="en"><term>Chairperson</term>: chairman of a meeting</catDesc>
                <catDesc xml:lang="sl"><term>Predsedujoči</term>: predsedujoči zasedanja</catDesc>
            </category>
            <category xml:id="regular">
                <catDesc xml:lang="en"><term>Regular speaker</term>:</catDesc>
                <catDesc xml:lang="sl"><term>Regularni govornik</term>:</catDesc>
            </category>
            <category xml:id="unauthorized">
                <catDesc xml:lang="en"><term>Unauthorized speaker</term>: unauthorized intervention in the speech of the main speaker.</catDesc>
                <catDesc xml:lang="sl"><term>Neavtorizirani govornik</term>: Neavtorizirana intervencija v govor glavnega govornika.</catDesc>
            </category>
        </taxonomy>
    </xsl:param>
    
    <xsl:template match="documentsList">
        <xsl:variable name="corpus-label" select="tokenize(ref[1],'/')[1]"/>
        <xsl:variable name="corpus-term" select="substring($corpus-label,4)"/>
        <xsl:variable name="corpus-document" select="concat('../speech/',$corpus-label,'.xml')"/>
        <xsl:variable name="source-corpus-document" select="concat($corpus-label,'.xml')"/>
        <xsl:variable name="source-speaker-document" select="concat($corpus-label,'.xml')"/>
        <xsl:result-document href="{$corpus-document}">
            <teiCorpus xmlns:xi="http://www.w3.org/2001/XInclude">
                <teiHeader>
                    <fileDesc>
                        <titleStmt>
                            <title type="main" xml:lang="sl">Dobesedni zapis sej Skupščine Republike Sloveije</title>
                            <title type="main" xml:lang="en">Verbatim record of sessions of the Assembly of the Republic of Slovenia</title>
                            <title type="sub" xml:lang="sl">
                                <xsl:value-of xmlns:parl="http://www.siparl.si" select="$terms/parl:term[@n=$corpus-term]"/>
                            </title>
                            <meeting n="{number($corpus-term)}" ana="#parl.term">
                                <xsl:value-of select="$corpus-term"/>
                                <xsl:text>. mandat</xsl:text>
                            </meeting>
                            <respStmt>
                                <persName>Andrej Pančur</persName>
                                <resp xml:lang="sl">Kodiranje TEI</resp>
                                <resp xml:lang="en">TEI corpus encoding</resp>
                            </respStmt>
                            <respStmt>
                                <persName>Mojca Šorn</persName>
                                <resp xml:lang="sl">Kodiranje TEI</resp>
                                <resp xml:lang="en">TEI corpus encoding</resp>
                            </respStmt>
                        </titleStmt>
                        <extent>
                            <xsl:variable name="count-files" select="count(ref)"/>
                            <measure unit="file" quantity="{$count-files}">
                                <xsl:text>Število TEI datotek: </xsl:text>
                                <xsl:value-of select="$count-files"/>
                            </measure>
                            <!-- Štetje besed -->
                            <xsl:variable name="counting">
                                <xsl:for-each select="ref">
                                    <string>
                                        <xsl:apply-templates select="document(.)/tei:TEI/tei:text/tei:body"/>
                                    </string>
                                </xsl:for-each>
                            </xsl:variable>
                            <xsl:variable name="compoundString" select="normalize-space(string-join($counting/tei:string,' '))"/>
                            <xsl:variable name="count-words" select="count(tokenize($compoundString,'\W+')[. != ''])"/>
                            <measure unit="word" quantity="{$count-words}">
                                <xsl:text>Število besed zapisnikov sej: </xsl:text>
                                <xsl:value-of select="$count-words"/>
                            </measure>
                        </extent>
                        <publicationStmt>
                            <publisher>
                                <orgName xml:lang="sl">Inštitut za novejšo zgodovino</orgName>
                                <orgName xml:lang="en">Institute of Contemporary History</orgName>
                                <ref target="http://www.inz.si/">http://www.inz.si/</ref>
                                <address>
                                    <street>Kongresni trg 1</street>
                                    <settlement>Ljubljana</settlement>
                                    <postCode>1000</postCode>
                                    <country xml:lang="sl">Slovenija</country>
                                    <country xml:lang="en">Slovenia</country>
                                </address>
                                <email>inz@inz.si</email>
                            </publisher>
                            <distributor>DARIAH-SI</distributor>
                            <distributor>CLARIN.SI</distributor>
                            <pubPlace>http://hdl.handle.net/11356/1236</pubPlace>
                            <pubPlace>https://github.com/DARIAH-SI/siParl</pubPlace>
                            <availability status="free">
                                <licence>http://creativecommons.org/licenses/by/4.0/</licence>
                                <p xml:lang="en">This work is licensed under the <ref target="http://creativecommons.org/licenses/by/4.0/">Creative Commons
                                    Attribution 4.0 International License</ref>.</p>
                                <p xml:lang="sl">To delo je ponujeno pod <ref target="http://creativecommons.org/licenses/by/4.0/">Creative Commons
                                    Priznanje avtorstva 4.0 mednarodna licenca</ref>.</p>
                            </availability>
                            <date when="{current-date()}"><xsl:value-of select="format-date(current-date(),'[D1]. [M1]. [Y0001]')"/></date>
                        </publicationStmt>
                        <sourceDesc>
                            <biblStruct>
                                <monogr>
                                    <title>Slovenian parliamentary corpus SlovParl 2.0</title>
                                    <author>Andrej Pančur</author>
                                    <author>Mojca Šorn</author>
                                    <author>Tomaž Erjavec</author>
                                    <imprint>
                                        <distributor>Slovenian language resource repository CLARIN.SI</distributor>
                                        <pubPlace>http://hdl.handle.net/11356/1167</pubPlace>
                                    </imprint>
                                </monogr>
                            </biblStruct>
                        </sourceDesc>
                    </fileDesc>
                    <encodingDesc>
                        <classDecl>
                            <xsl:copy-of select="$taxonomy-legislature"/>
                            <xsl:copy-of select="$taxonomy-speakers"/>
                        </classDecl>
                    </encodingDesc>
                    <profileDesc>
                        <settingDesc>
                            <setting>
                                <name type="city">Ljubljana</name>
                                <name type="country" key="YU" notAfter="1991-06-25">Jugoslavija</name>
                                <name type="region" notAfter="1991-06-25">Slovenija</name>
                                <name type="country" key="SI" notBefore="1991-06-25">Slovenija</name>
                                <date ana="#parl.term">
                                    <xsl:attribute name="notBefore" xmlns:parl="http://www.siparl.si">
                                        <xsl:value-of select="$terms/parl:term[@n=$corpus-term]/@start"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="notAfter" xmlns:parl="http://www.siparl.si">
                                        <xsl:value-of select="$terms/parl:term[@n=$corpus-term]/@end"/>
                                    </xsl:attribute>
                                    <xsl:value-of xmlns:parl="http://www.siparl.si" select=" concat(format-date($terms/parl:term[@n=$corpus-term]/@start,'[D1]. [M1]. [Y0001]'),' / ',format-date($terms/parl:term[@n=$corpus-term]/@end,'[D1]. [M1]. [Y0001]'))"/>
                                </date>
                            </setting>
                        </settingDesc>
                        <particDesc>
                            <org xml:id="SK" ana="#parl.regional #parl.national #par.multi">
                                <orgName from="1990-06-23" to="1992-12-23" xml:lang="sl">Skupščina Republike Slovenije</orgName>
                                <orgName from="1990-06-23" to="1992-12-23" xml:lang="en">Assembly of the Republic of Slovenia</orgName>
                                <orgName from="1963-06-24" to="1990-06-23" xml:lang="sl">Skupščina Socialistične republike Slovenije</orgName>
                                <orgName from="1963-06-24" to="1990-06-23" xml:lang="en">Assembly of Socialist Republic of Slovenia</orgName>
                                <listOrg xml:id="chambers">
                                    <head xml:lang="sl">Zbori Skupščine Republike Slovenije</head>
                                    <head xml:lang="en">Chambers of the Assembly of the Republic of Slovenia</head>
                                    <org xml:id="DruzPolZb" ana="#par.chamber">
                                        <orgName from="1974" to="1992-12-23" xml:lang="sl">Družbeno-politični zbor</orgName>
                                        <orgName from="1974" to="1992-12-23" xml:lang="en">Socio-Political Chamber</orgName>
                                    </org>
                                    <org xml:id="ZbObc" ana="#par.chamber">
                                        <orgName from="1974" to="1992-12-23" xml:lang="sl">Zbor občin</orgName>
                                        <orgName from="1974" to="1992-12-23" xml:lang="en">Chamber of Municipalities</orgName>
                                    </org>
                                    <org xml:id="ZbZdruDel" ana="#par.chamber">
                                        <orgName from="1974" to="1992-12-23" xml:lang="sl">Zbor združenega dela</orgName>
                                        <orgName from="1974" to="1992-12-23" xml:lang="en">Chamber of Associated Labour</orgName>
                                    </org>
                                </listOrg>
                            </org>
                            <listPerson type="speaker">
                                <head xml:lang="sl">Seznam govornikov</head>
                                <head xml:lang="en">List of speakers</head>
                                <personGrp xml:id="{$corpus-label}.unknown">
                                    <state>
                                        <desc xml:lang="sl">Neidentificirani govornik</desc>
                                        <desc xml:lang="en">Unidentified speaker</desc>
                                    </state>
                                </personGrp>
                                <xsl:for-each select="document($source-speaker-document)/tei:teiCorpus/tei:teiHeader/tei:profileDesc/tei:particDesc/tei:listPerson[position() = 2 or position() =3]/tei:person">
                                    <xsl:sort select="@xml:id"/>
                                    <person xml:id="{$corpus-label}.{@xml:id}">
                                        <xsl:copy-of select="tei:persName[1]" copy-namespaces="no"/>
                                        <xsl:copy-of select="tei:sex" copy-namespaces="no"/>
                                    </person>
                                </xsl:for-each>
                            </listPerson>
                        </particDesc>
                        <langUsage>
                            <language ident="sl" xml:lang="sl">slovenski</language>
                            <language ident="sl" xml:lang="en">Slovenian</language>
                            <language ident="en" xml:lang="sl">angleški</language>
                            <language ident="en" xml:lang="en">English</language>
                        </langUsage>
                    </profileDesc>
                </teiHeader>
                <xsl:for-each select="ref">
                    <xsl:variable name="sourceDocument" select="tokenize(.,'/')[2]"/>
                    <xsl:variable name="year" select="tokenize($sourceDocument,'-')[1]"/>
                    <xsl:variable name="month" select="tokenize($sourceDocument,'-')[2]"/>
                    <xsl:variable name="day" select="tokenize($sourceDocument,'-')[3]"/>
                    <xsl:variable name="chamber" select="tokenize($sourceDocument,'-')[4]"/>
                    <xsl:variable name="sessionNum">
                        <xsl:analyze-string select="tokenize($sourceDocument,'-')[5]" regex="\d+">
                            <xsl:matching-substring>
                                <xsl:value-of select="."/>
                            </xsl:matching-substring>
                        </xsl:analyze-string>
                    </xsl:variable>
                    <xsl:variable name="sessionLabel">
                        <xsl:analyze-string select="tokenize($sourceDocument,'-')[5]" regex="\d+">
                            <xsl:non-matching-substring>
                                <xsl:choose>
                                    <xsl:when test=". = 's'">Seja</xsl:when>
                                    <xsl:when test=". = 'z'">Zasedanje</xsl:when>
                                    <xsl:when test=". = 'd'">Delovna</xsl:when>
                                    <xsl:when test=". = 'sl'">Slavnostna</xsl:when>
                                    <xsl:otherwise>
                                        <xsl:message terminate="yes">Manjka session-type vrednost</xsl:message>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:non-matching-substring>
                        </xsl:analyze-string>
                    </xsl:variable>
                    
                    <xsl:element name="xi:include">
                        <xsl:attribute name="href">
                            <xsl:value-of select="concat($corpus-label,'/',$chamber,'-',$sessionLabel,'-',$sessionNum,'-',$year,'-',$month,'-',$day,'.xml')"/>
                        </xsl:attribute>
                    </xsl:element>
                    
                    <!-- TEI dokumenti -->
                    <xsl:variable name="document" select="concat('../speech/',$corpus-label,'/',$chamber,'-',$sessionLabel,'-',$sessionNum,'-',$year,'-',$month,'-',$day,'.xml')"/>
                    <xsl:result-document href="{$document}">
                        <xsl:apply-templates select="document(.)" mode="pass0">
                            <xsl:with-param name="corpus-label" select="$corpus-label"/>
                            <xsl:with-param name="chamber" select="$chamber"/>
                            <xsl:with-param name="sessionNum" select="$sessionNum"/>
                            <xsl:with-param name="sessionLabel" select="$sessionLabel"/>
                        </xsl:apply-templates>
                    </xsl:result-document>          
                </xsl:for-each>
            </teiCorpus>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="/" mode="pass0">
        <xsl:param name="corpus-label"/>
        <xsl:param name="chamber"/>
        <xsl:param name="sessionNum"/>
        <xsl:param name="sessionLabel"/>
        <xsl:variable name="var1">
            <xsl:apply-templates mode="pass1">
                <xsl:with-param name="corpus-label" select="$corpus-label"/>
                <xsl:with-param name="chamber" select="$chamber"/>
                <xsl:with-param name="sessionNum" select="$sessionNum"/>
                <xsl:with-param name="sessionLabel" select="$sessionLabel"/>
            </xsl:apply-templates>
        </xsl:variable>
        <xsl:variable name="var2">
            <xsl:apply-templates select="$var1" mode="pass2"/>
        </xsl:variable>
        <xsl:variable name="var3">
            <xsl:apply-templates select="$var2" mode="pass3"/>
        </xsl:variable>
        <xsl:variable name="var4">
            <xsl:apply-templates select="$var3" mode="pass4"/>
        </xsl:variable>
        
        <!-- kopiram zadnjo variablo z vsebino celotnega dokumenta -->
        <xsl:copy-of select="$var4" copy-namespaces="no"/>
    </xsl:template>
    
    <xsl:template match="@* | node()" mode="pass1">
        <xsl:param name="corpus-label"/>
        <xsl:param name="chamber"/>
        <xsl:param name="sessionNum"/>
        <xsl:param name="sessionLabel"/>
        <xsl:copy>
            <xsl:apply-templates select="@* | node()" mode="pass1">
                <xsl:with-param name="corpus-label" select="$corpus-label"/>
                <xsl:with-param name="chamber" select="$chamber"/>
                <xsl:with-param name="sessionNum" select="$sessionNum"/>
                <xsl:with-param name="sessionLabel" select="$sessionLabel"/>
            </xsl:apply-templates>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="tei:TEI" mode="pass1">
        <xsl:param name="corpus-label"/>
        <xsl:param name="chamber"/>
        <xsl:param name="sessionNum"/>
        <xsl:param name="sessionLabel"/>
        <TEI>
            <xsl:apply-templates select="@*" mode="pass1"/>
            <xsl:attribute name="ana">#parl.sitting</xsl:attribute>
            <xsl:apply-templates mode="pass1">
                <xsl:with-param name="corpus-label" select="$corpus-label"/>
                <xsl:with-param name="chamber" select="$chamber"/>
                <xsl:with-param name="sessionNum" select="$sessionNum"/>
                <xsl:with-param name="sessionLabel" select="$sessionLabel"/>
            </xsl:apply-templates>
        </TEI>
    </xsl:template>
    
    <xsl:template match="tei:titleStmt" mode="pass1">
        <xsl:param name="corpus-label"/>
        <xsl:param name="chamber"/>
        <xsl:param name="sessionNum"/>
        <xsl:param name="sessionLabel"/>
        <titleStmt>
            <title type="main" xml:lang="sl">Dobesedni zapis seje Skupščine Republike Slovenije</title>
            <title type="main" xml:lang="en">Verbatim record of the session of the Assembly of the Republic of Slovenia</title>
            <title type="sub" xml:lang="sl">
                <xsl:choose>
                    <xsl:when test="$chamber = 'DruzPolZb'">Družbeno-politični zbor</xsl:when>
                    <xsl:when test="$chamber = 'ZbObc'">Zbor občin</xsl:when>
                    <xsl:when test="$chamber = 'ZbZdruDel'">Zbor združenega dela</xsl:when>
                    <xsl:when test="$chamber = 'VsiZbor'">Vsi zbori zasedajo skupaj</xsl:when>
                    <xsl:otherwise>
                        <xsl:message>Neznana vrsta zbora: <xsl:value-of select="ancestor::tei:TEI/@xml:id"/></xsl:message>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:text>: </xsl:text>
                <xsl:if test="string-length($sessionNum) gt 0">
                    <xsl:value-of select="concat(number($sessionNum),'. ')"/>
                </xsl:if>
                <xsl:choose>
                    <xsl:when test="$sessionLabel = 'Seja'">seja</xsl:when>
                    <xsl:when test="$sessionLabel = 'Zasedanje'">zasedanje</xsl:when>
                    <xsl:when test="$sessionLabel = 'Delovna'">delovna seja</xsl:when>
                    <xsl:when test="$sessionLabel = 'Slavnostna'">slavnostna seja</xsl:when>
                    <xsl:otherwise>
                        <xsl:message>Neznana vrsta seje: <xsl:value-of select="ancestor::tei:TEI/@xml:id"/></xsl:message>
                    </xsl:otherwise>
                </xsl:choose>
            </title>
            <meeting n="{number($sessionNum)}">
                <xsl:variable name="teiIdentifier" select="ancestor::tei:TEI/@xml:id"/>
                <xsl:attribute name="corresp">
                    <xsl:choose>
                        <xsl:when test="$chamber = 'DruzPolZb'">
                            <xsl:value-of select="concat('#',$teiIdentifier,'.DruzPolZb')"/>
                        </xsl:when>
                        <xsl:when test="$chamber = 'ZbObc'">
                            <xsl:value-of select="concat('#',$teiIdentifier,'.ZbObc')"/>
                        </xsl:when>
                        <xsl:when test="$chamber = 'ZbZdruDel'">
                            <xsl:value-of select="concat('#',$teiIdentifier,'.ZbZdruDel')"/>
                        </xsl:when>
                        <xsl:when test="$chamber = 'VsiZbor'">
                            <xsl:value-of select="concat('#',$teiIdentifier,'.DruzPolZb ','#',$teiIdentifier,'.ZbObc ','#',$teiIdentifier,'.ZbZdruDel')"/>
                            
                        </xsl:when>
                    </xsl:choose>
                </xsl:attribute>
                <xsl:attribute name="ana">
                    <xsl:choose>
                        <xsl:when test="$sessionLabel = 'Seja'">#parl.meeting.regular</xsl:when>
                        <xsl:when test="$sessionLabel = 'Zasedanje'">#parl.meeting.special</xsl:when>
                        <xsl:when test="$sessionLabel = 'Delovna'">#parl.meeting.special</xsl:when>
                        <xsl:when test="$sessionLabel = 'Slavnostna'">#parl.meeting.ceremonial</xsl:when>
                    </xsl:choose>
                </xsl:attribute>
            </meeting>
            <xsl:apply-templates select="tei:respStmt" mode="pass1">
                <xsl:with-param name="corpus-label" select="$corpus-label"/>
                <xsl:with-param name="chamber" select="$chamber"/>
                <xsl:with-param name="sessionNum" select="$sessionNum"/>
                <xsl:with-param name="sessionLabel" select="$sessionLabel"/>
            </xsl:apply-templates>
        </titleStmt>
    </xsl:template>
    
    <xsl:template match="tei:pubPlace" mode="pass1">
        <pubPlace>
            <xsl:choose>
                <xsl:when test="matches(.,'github')">https://github.com/DARIAH-SI/siParl</xsl:when>
                <xsl:otherwise>http://hdl.handle.net/11356/1236</xsl:otherwise>
            </xsl:choose>
        </pubPlace>
    </xsl:template>
    
    <xsl:template match="tei:publicationStmt/tei:date" mode="pass1">
        <date when="{current-date()}"><xsl:value-of select="format-date(current-date(),'[D1]. [M1]. [Y0001]')"/></date>
    </xsl:template>
    
    <xsl:template match="tei:sourceDesc/tei:bibl" mode="pass1">
        <biblStruct>
            <monogr>
                <title>Slovenian parliamentary corpus SlovParl 2.0</title>
                <author>Andrej Pančur</author>
                <author>Mojca Šorn</author>
                <author>Tomaž Erjavec</author>
                <imprint>
                    <distributor>Slovenian language resource repository CLARIN.SI</distributor>
                    <pubPlace>http://hdl.handle.net/11356/1167</pubPlace>
                </imprint>
            </monogr>
        </biblStruct>
    </xsl:template>
    
    <xsl:template match="tei:profileDesc" mode="pass1">
        <xsl:param name="corpus-label"/>
        <xsl:param name="chamber"/>
        <xsl:param name="sessionNum"/>
        <xsl:param name="sessionLabel"/>
        <profileDesc>
            <abstract>
                <list type="agenda">
                    <xsl:for-each select="ancestor::tei:TEI/tei:text/tei:front/tei:div[@type='contents']/tei:list/tei:item">
                        <xsl:copy-of select="." copy-namespaces="no"/>
                    </xsl:for-each>
                </list>
            </abstract>
            <xsl:apply-templates mode="pass1">
                <xsl:with-param name="corpus-label" select="$corpus-label"/>
                <xsl:with-param name="chamber" select="$chamber"/>
                <xsl:with-param name="sessionNum" select="$sessionNum"/>
                <xsl:with-param name="sessionLabel" select="$sessionLabel"/>
            </xsl:apply-templates>
        </profileDesc>
    </xsl:template>
    
    <xsl:template match="tei:settingDesc" mode="pass1">
        <settingDesc>
            <setting>
                <name type="city">Ljubljana</name>
                <xsl:choose>
                    <xsl:when test="xs:date(tei:setting/tei:date/@when) lt xs:date('1991-06-25')">
                        <name type="country" key="YU">Jugoslavija</name>
                        <name type="region">Slovenija</name>
                    </xsl:when>
                    <xsl:otherwise>
                        <name type="country" key="SI">Slovenija</name>
                    </xsl:otherwise>
                </xsl:choose>
                <date when="{tei:setting/tei:date/@when}" ana="#parl.sitting">
                    <xsl:value-of select="format-date(tei:setting[1]/tei:date/@when,'[D1]. [M1]. [Y0001]')"/>
                </date>
            </setting>
        </settingDesc>
    </xsl:template>
    
    <xsl:template match="tei:particDesc" mode="pass1">
        <xsl:param name="corpus-label"/>
        <xsl:param name="chamber"/>
        <xsl:param name="sessionNum"/>
        <xsl:param name="sessionLabel"/>
        <xsl:param name="DruzPolZb">
            <org xml:id="{ancestor::tei:TEI/@xml:id}.DruzPolZb" ana="#par.chamber" corresp="#DruzPolZb">
                <orgName>Družbeno-politični zbor</orgName>
            </org>
        </xsl:param>
        <xsl:param name="ZbObc">
            <org xml:id="{ancestor::tei:TEI/@xml:id}.ZbObc" ana="#par.chamber" corresp="#ZbObc">
                <orgName>Zbor občin</orgName>
            </org>
        </xsl:param>
        <xsl:param name="ZbZdruDel">
            <org xml:id="{ancestor::tei:TEI/@xml:id}.ZbZdruDel" ana="#par.chamber" corresp="#ZbZdruDel">
                <orgName>Zbor združenega dela</orgName>
            </org>
        </xsl:param>
        <particDesc>
            <xsl:choose>
                <xsl:when test="$chamber = 'VsiZbor'">
                    <xsl:copy-of select="$DruzPolZb"/>
                    <xsl:copy-of select="$ZbObc"/>
                    <xsl:copy-of select="$ZbZdruDel"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:choose>
                        <xsl:when test="$chamber = 'DruzPolZb'">
                            <xsl:copy-of select="$DruzPolZb"/>
                        </xsl:when>
                        <xsl:when test="$chamber = 'ZbObc'">
                            <xsl:copy-of select="$ZbObc"/>
                        </xsl:when>
                        <xsl:when test="$chamber = 'ZbZdruDel'">
                            <xsl:copy-of select="$ZbZdruDel"/>
                        </xsl:when>
                    </xsl:choose>
                </xsl:otherwise>
            </xsl:choose>
            <!-- v vmesni fazi procesiram še povezave na predsedujoče -->
            <!--<xsl:apply-templates mode="pass1">
                <xsl:with-param name="corpus-label" select="$corpus-label"/>
                <xsl:with-param name="chamber" select="$chamber"/>
                <xsl:with-param name="sessionNum" select="$sessionNum"/>
                <xsl:with-param name="sessionLabel" select="$sessionLabel"/>
            </xsl:apply-templates>-->
        </particDesc>
    </xsl:template>
    
    <xsl:template match="tei:front" mode="pass1">
        <!-- ga odstranim -->
    </xsl:template>
    <xsl:template match="tei:timeline" mode="pass1">
        <!-- ga odstranim -->
    </xsl:template>
    <xsl:template match="tei:anchor" mode="pass1">
        <!-- jih odstranim -->
    </xsl:template>
    
    <xsl:template match="tei:body" mode="pass1">
        <xsl:param name="corpus-label"/>
        <xsl:param name="chamber"/>
        <xsl:param name="sessionNum"/>
        <xsl:param name="sessionLabel"/>
        <body>
            <div type="minutes">
                <xsl:for-each select="tei:div[@type='preface']/tei:head">
                    <head>
                        <xsl:if test="position() = 2">
                            <xsl:attribute name="type">session</xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="."/>
                    </head>
                </xsl:for-each>
                <xsl:for-each select="tei:div[@type='preface']/tei:note">
                    <xsl:choose>
                        <xsl:when test="@type = 'date'">
                            <docDate>
                                <xsl:value-of select="."/>
                            </docDate>
                        </xsl:when>
                        <xsl:otherwise>
                            <note type="{if (@type='president') then 'chairman' else @type}">
                                <xsl:value-of select="."/>
                            </note>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
                <xsl:apply-templates mode="pass1">
                    <xsl:with-param name="corpus-label" select="$corpus-label"/>
                    <xsl:with-param name="chamber" select="$chamber"/>
                    <xsl:with-param name="sessionNum" select="$sessionNum"/>
                    <xsl:with-param name="sessionLabel" select="$sessionLabel"/>
                </xsl:apply-templates>
            </div>
        </body>
    </xsl:template>
    
    <xsl:template match="tei:div[@type='preface']" mode="pass1">
        <!-- ga odstranim, ker sem ga procesiral zgoraj -->
    </xsl:template>
    
    <xsl:template match="tei:div[@type='sp'] | tei:div[@type='inter']" mode="pass1">
        <xsl:param name="corpus-label"/>
        <xsl:param name="chamber"/>
        <xsl:param name="sessionNum"/>
        <xsl:param name="sessionLabel"/>
        <u>
            <xsl:attribute name="who">
                <xsl:choose>
                    <xsl:when test="not(tei:u/@who)">
                        <xsl:choose>
                            <xsl:when test="tei:note[@type='speaker'] = 'LEOPOLD FRELIH:'">#SSK11.FrelihLeopold</xsl:when>
                            <xsl:when test="tei:note[@type='speaker'] = 'DR. JOŽE MENCINGER:'">#SSK11.MencingerJoze1941</xsl:when>
                            <xsl:when test="tei:note[@type='speaker'] = 'BRANIMIR BRAČKO:'">#SSK11.BrackoBranko</xsl:when>
                            <xsl:when test="tei:note[@type='speaker'] = 'BRANKO BRAČKO:'">#SSK11.BrackoBranko</xsl:when>
                            <xsl:when test="tei:note[@type='speaker'] = 'MARTINA LIPPAI:'">#SSK11.LippaiMartina</xsl:when>
                            <xsl:when test="tei:note[@type='speaker'] = 'NEIDENTIFICIRANI GOVORNIK:'">#SSK11.unknown</xsl:when>
                            <xsl:when test="tei:note[@type='speaker'] = 'ALENKA MARKIČ:'">#SSK11.MarkicAlenka</xsl:when>
                            <xsl:when test="tei:note[@type='speaker'] = 'MILAN VOLK:'">#SSK11.VovkMilan1956</xsl:when>
                            <xsl:when test="tei:note[@type='speaker'] = 'DR. STANKO BUSER:'">#SSK11.BuserStanko1932</xsl:when>
                            <xsl:when test="tei:note[@type='speaker'] = 'ANKA OSTERMAN:'">#SSK11.OstermanAnka1940</xsl:when>
                            <xsl:when test="tei:note[@type='speaker'] = 'FRANC ERCE:'">#SSK11.ErceFranc1951</xsl:when>
                            <xsl:when test="tei:note[@type='speaker'] = 'MIHA JAZBINŠEK:'">#SSK11.JazbinsekMiha1941</xsl:when>
                            <xsl:when test="tei:note[@type='speaker'] = 'R. Jakič'">#SSK11.JakicRoman1967</xsl:when>
                            <xsl:when test="tei:note[@type='speaker'] = 'Neidentificiran govornik:'">#SSK11.unknown</xsl:when>
                            <xsl:when test="tei:note[@type='speaker'] = 'MILOŠ SENČUR:'">#SSK11.SencurMilos1957</xsl:when>
                            <xsl:when test="tei:note[@type='speaker'] = 'FEDJA KLAVORA:'">#SSK11.KlavoraFedja1940</xsl:when>
                            <xsl:when test="tei:note[@type='speaker'] = 'MARCEL ŠTEFANČIČ:'">#SSK11.StefancicMarcel1937</xsl:when>
                            <xsl:when test="tei:note[@type='speaker'] = 'MAG. JANEZ JUG:'">#SSK11.JugJanez1947</xsl:when>
                            <xsl:otherwise>
                                <xsl:message>Unknown speaker "<xsl:value-of select="tei:note[@type='speaker']"/>"  with tei:note[@type='speaker']/@xml:id <xsl:value-of select="tei:note[@type='speaker']/@xml:id"/></xsl:message>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="concat('#',$corpus-label,'.',substring-after(tei:u[1]/@who,'#'))"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            <xsl:attribute name="ana">
                <xsl:variable name="personID" select="tei:u[1]/@xml:id"/>
                <xsl:variable name="chairperson">
                    <xsl:for-each select="ancestor::tei:TEI/tei:teiHeader/tei:profileDesc/tei:particDesc/tei:listPerson/tei:person/tokenize(@corresp,' ')">
                        <xsl:if test="substring-after(.,'#') = $personID">#chair</xsl:if>
                    </xsl:for-each>
                </xsl:variable>
                <xsl:choose>
                    <xsl:when test="@type='inter'">#unauthorized</xsl:when>
                    <xsl:when test="string-length($chairperson) != 0"><xsl:value-of select="$chairperson"/></xsl:when>
                    <xsl:otherwise>#regular</xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            <xsl:apply-templates mode="pass1">
                <xsl:with-param name="corpus-label" select="$corpus-label"/>
                <xsl:with-param name="chamber" select="$chamber"/>
                <xsl:with-param name="sessionNum" select="$sessionNum"/>
                <xsl:with-param name="sessionLabel" select="$sessionLabel"/>
            </xsl:apply-templates>
        </u>
    </xsl:template>
    
    <xsl:template match="tei:u" mode="pass1">
        <xsl:param name="corpus-label"/>
        <xsl:param name="chamber"/>
        <xsl:param name="sessionNum"/>
        <xsl:param name="sessionLabel"/>
        <xsl:variable name="num">
            <xsl:number count="tei:u[@xml:id]" level="any"/>
        </xsl:variable>
        <!-- začasen ana atribut za povezave na agendo -->
        <seg xml:id="{$corpus-label}-{ancestor::tei:TEI/@xml:id}.seg{$num}" ana="{@xml:id}">
            <xsl:apply-templates mode="pass1"/>
        </seg>
    </xsl:template>
    
    <xsl:template match="tei:note" mode="pass1">
        <note>
             <xsl:if test="@type = 'speaker' or @type = 'time'">
                 <xsl:attribute name="type">
                     <xsl:value-of select="@type"/>
                 </xsl:attribute>
             </xsl:if>
            <xsl:apply-templates mode="pass1"/>
        </note>
    </xsl:template>
    
    <xsl:template match="tei:gap[@n]" mode="pass1">
        <gap reason="inaudible"/>
    </xsl:template>
    
    <xsl:template match="tei:gap[tei:desc]" mode="pass1">
        <note>
            <xsl:value-of select="tei:desc"/>
        </note>
    </xsl:template>
    
    <xsl:template match="tei:vocal[tei:desc]" mode="pass1">
        <note>
            <xsl:value-of select="tei:desc"/>
        </note>
    </xsl:template>
    
    <xsl:template match="tei:kinesic[tei:desc]" mode="pass1">
        <note>
            <xsl:value-of select="tei:desc"/>
        </note>
    </xsl:template>
    
    <xsl:template match="tei:incident[tei:desc]" mode="pass1">
        <note>
            <xsl:value-of select="tei:desc"/>
        </note>
    </xsl:template>
    
    <xsl:template match="tei:writing[tei:desc]" mode="pass1">
        <note>
            <xsl:value-of select="tei:desc"/>
        </note>
    </xsl:template>
    
    <xsl:template match="@* | node()" mode="pass2">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()" mode="pass2"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="tei:list[@type='agenda']/tei:item" mode="pass2">
        <item xml:id="{@xml:id}">
            <xsl:apply-templates mode="pass2"/>
            <xsl:variable name="corresp">
                <xsl:for-each select="tokenize(@corresp,' ')">
                    <item>
                        <xsl:value-of select="substring-after(.,'#')"/>
                    </item>
                </xsl:for-each>
            </xsl:variable>
            <xsl:for-each select="ancestor::tei:TEI/tei:text/tei:body/tei:div/tei:u/tei:seg[@ana = $corresp/tei:item]">
                <ptr target="#{@xml:id}"/>
            </xsl:for-each>
        </item>
    </xsl:template>
    
    <xsl:template match="tei:seg" mode="pass2">
        <seg xml:id="{@xml:id}">
            <xsl:apply-templates mode="pass2"/>
        </seg>
    </xsl:template>
    
    <xsl:template match="@* | node()" mode="pass3">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()" mode="pass3"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- premaknem u/note[@type='speaker'] pred u in u/note[@type='time'] za dotični u -->
    <xsl:template match="tei:u" mode="pass3">
        <xsl:apply-templates select="tei:note[@type='speaker']" mode="pass3"/>
        <u>
            <xsl:apply-templates select="@*" mode="pass3"/>
            <xsl:apply-templates select="*[not(self::tei:note[@type='speaker'] or (position() = last() and self::tei:note[@type='time']))]" mode="pass3"/>
        </u>
        <xsl:apply-templates select="*[position() = last()][self::tei:note[@type='time']]" mode="pass3"/>
    </xsl:template>
    
    <!-- čisto na koncu še preštejem vse elemente -->
    <xsl:template match="@* | node()" mode="pass4">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()" mode="pass4"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:key name="elements" match="*[ancestor-or-self::tei:text]" use="name()"/>
    
    <xsl:template match="tei:tagsDecl" mode="pass4">
        <tagsDecl>
            <namespace name="http://www.tei-c.org/ns/1.0">
                <xsl:for-each select="//*[ancestor-or-self::tei:text][count(.|key('elements', name())[1]) = 1]">
                    <tagUsage gi="{name()}" occurs="{count(key('elements', name()))}"/>
                </xsl:for-each>
            </namespace>
        </tagsDecl>
    </xsl:template>
    
    
</xsl:stylesheet>