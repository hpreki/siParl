<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei"
    version="2.0">
    
    <!-- izhodiščni dokument je vsakokratni drama/*-list.xml (mogoče naredim skupni seznam datotek?) -->
    <!-- Za neavtorizirane govore (unauthorised and authorised interventions) uporabi @decls s kazalko na ustrezen del teiHeader -->
    <!-- V teiCorpus/teiHeader dodaj za chairpersons še <particDesc><personGrp xml:id="chair"> -->
    
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:variable name="terms" xmlns="http://www.siparl.si" xmlns:parl="http://www.siparl.si">
        <term n="1" start="1992-12-23" end="1996-11-28">1. mandat (1992-1996)</term>
        <term n="2" start="1996-11-28" end="2000-10-27">2. mandat (1996-2000)</term>
        <term n="3" start="2000-10-27" end="2004-10-22">3. mandat (2000-2004)</term>
        <term n="4" start="2004-10-22" end="2008-10-15">4. mandat (2004-2008)</term>
        <term n="5" start="2008-10-15" end="2011-12-15">5. mandat (2008-2011)</term>
        <term n="6" start="2011-12-16" end="2014-08-01">6. mandat (2011-2014)</term>
        <term n="7" start="2014-08-01" end="2018-06-22">7. mandat (2014-2018)</term>
    </xsl:variable>
    
    <xsl:template match="documentsList">
        <xsl:variable name="corpus-label" select="tokenize(ref[1],'/')[1]"/>
        <xsl:variable name="corpus-term" select="substring($corpus-label,4,4)"/>
        <xsl:variable name="corpus-document" select="concat('../speech/',$corpus-label,'.xml')"/>
        <xsl:variable name="source-corpus-document" select="concat('drama/',$corpus-label,'.xml')"/>
        <xsl:variable name="source-speaker-document" select="concat('drama/',$corpus-label,'-speaker.xml')"/>
        <xsl:result-document href="{$corpus-document}">
            <teiCorpus xmlns:xi="http://www.w3.org/2001/XInclude">
                <teiHeader>
                    <fileDesc>
                        <titleStmt>
                            <xsl:choose>
                                <xsl:when test="matches($corpus-label,'^SDZ')">
                                    <title type="main" xml:lang="sl">Dobesedni zapis sej Državnega zbora Republike Slovenije</title>
                                    <title type="main" xml:lang="en">Verbatim record of sessions of the National Assembly of the Republic of Slovenia</title>
                                </xsl:when>
                                <xsl:when test="matches($corpus-label,'^SDT')">
                                    <title type="main" xml:lang="sl">Dobesedni zapis sej delovnih teles Državnega zbora Republike Slovenije</title>
                                    <title type="main" xml:lang="en">Verbatim record of sessions of the working bodies of the National Assembly of the Republic of Slovenia</title>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:message>Neznana oznaka <xsl:value-of select="$corpus-label"/></xsl:message>
                                </xsl:otherwise>
                            </xsl:choose>
                            <title type="sub" xml:lang="sl">
                                <xsl:value-of xmlns:parl="http://www.siparl.si" select="$terms/parl:term[@n=$corpus-term]"/>
                            </title>
                            <meeting n="{$corpus-term}" ana="#parl.term">
                                <xsl:value-of select="$corpus-term"/>
                                <xsl:text>. mandat</xsl:text>
                            </meeting>
                            <xsl:for-each-group select="document($source-corpus-document)/tei:teiCorpus/tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:respStmt" group-by="tei:persName">
                                <respStmt>
                                    <persName>
                                        <xsl:value-of select="current-grouping-key()"/>
                                    </persName>
                                    <resp xml:lang="sl">Kodiranje TEI</resp>
                                    <resp xml:lang="en">TEI corpus encoding</resp>
                                </respStmt>
                            </xsl:for-each-group>
                            <xsl:for-each-group select="document($source-speaker-document)/tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:respStmt" group-by="tei:persName">
                                <respStmt>
                                    <persName>
                                        <xsl:value-of select="current-grouping-key()"/>
                                    </persName>
                                    <resp xml:lang="sl">Urejanje seznama govornikov</resp>
                                    <resp xml:lang="en">Editing a list of speakers</resp>
                                </respStmt>
                            </xsl:for-each-group>
                        </titleStmt>
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
                            <bibl>
                                <title>Portal Državnega zbora Republike Slovenije</title>
                                <idno type="URI">https://www.dz-rs.si</idno>
                            </bibl>
                        </sourceDesc>
                    </fileDesc>
                    <encodingDesc>
                        <editorialDecl>
                            <correction xml:id="unauthorized" method="markup">
                                <p>Unauthorized intervention in the speech of the main speaker. In the text of
                                    the main speech, the unauthorized intervention was written in brackets. The
                                    braces are removed. The text of an unauthorized intervention is marked with
                                    <gi>u</gi> element.</p>
                                <p>Neavtorizirana intervencija v govor glavnega govornika. V besedilu glavnega
                                    govora je bila neavtorizirana intervencija zapisana v oklepajih. Oklepaji so
                                    odstranjeni. Besedilo neavtorizirane intervencije je označeno z elementom
                                    <gi>u</gi>.</p>
                            </correction>
                        </editorialDecl>
                        <classDecl>
                            <taxonomy>
                                <desc xml:lang="en">Legislature</desc>
                                <desc xml:lang="sl">Zakonodajna oblast</desc>
                                <category>
                                    <desc xml:lang="en">Geo-political or administrative units</desc>
                                    <desc xml:lang="sl">Geopolitične ali upravne enote</desc>
                                    <category xml:id="parl.supranational">
                                        <catDesc xml:lang="en">Supranational legislature</catDesc>
                                        <catDesc xml:lang="sl">Nadnacionalna zakonodajna oblast</catDesc>
                                    </category>
                                    <category xml:id="parl.national">
                                        <catDesc xml:lang="en">National legislature</catDesc>
                                        <catDesc xml:lang="sl">Nacionalna zakonodajna oblast</catDesc>
                                    </category>
                                    <category xml:id="parl.regional">
                                        <catDesc xml:lang="en">Regional legislature</catDesc>
                                        <catDesc xml:lang="sl">Regionalna zakonodajna oblast</catDesc>
                                    </category>
                                    <category xml:id="parl.local">
                                        <catDesc xml:lang="en">Local legislature</catDesc>
                                        <catDesc xml:lang="sl">Lokalna zakonodajna oblast</catDesc>
                                    </category>
                                </category>
                                <category>
                                    <desc xml:lang="en">Organization</desc>
                                    <desc xml:lang="sl">Organiziranost</desc>
                                    <category>
                                        <desc xml:lang="en">Chambers</desc>
                                        <desc xml:lang="sl">Zbori</desc>
                                        <category xml:id="par.uni">
                                            <catDesc xml:lang="en">Unicameralism</catDesc>
                                            <catDesc xml:lang="sl">Enodomnost</catDesc>
                                        </category>
                                        <category xml:id="par.bi">
                                            <catDesc xml:lang="en">Bicameralism</catDesc>
                                            <catDesc xml:lang="sl">Dvodomnost</catDesc>
                                            <category xml:id="par.upper">
                                                <catDesc xml:lang="en">Upper house</catDesc>
                                                <catDesc xml:lang="sl">Zgornji dom</catDesc>
                                            </category>
                                            <category xml:id="par.lower">
                                                <catDesc xml:lang="en">Lower house</catDesc>
                                                <catDesc xml:lang="sl">Spodnji dom</catDesc>
                                            </category>
                                        </category>
                                        <category xml:id="par.multi">
                                            <catDesc xml:lang="en">Multicameralism</catDesc>
                                            <catDesc xml:lang="sl">Večdomnost</catDesc>
                                            <category xml:id="par.chamber">
                                                <catDesc xml:lang="en">Chamber</catDesc>
                                                <catDesc xml:lang="sl">Zbor</catDesc>
                                            </category>
                                        </category>
                                    </category>
                                    <category xml:id="parl.committee">
                                        <catDesc xml:lang="en">Committee</catDesc>
                                        <catDesc xml:lang="sl">Delovno telo</catDesc>
                                        <category xml:id="parl.committee.standing">
                                            <catDesc xml:lang="en">Standing committee</catDesc>
                                            <catDesc xml:lang="sl">Stalno delovno telo</catDesc>
                                        </category>
                                        <category xml:id="parl.committee.special">
                                            <catDesc xml:lang="en">Special committee</catDesc>
                                            <catDesc xml:lang="sl">Začasno delovno telo</catDesc>
                                        </category>
                                        <category xml:id="parl.committee.inquiry">
                                            <catDesc xml:lang="en">Committee of inquiry </catDesc>
                                            <catDesc xml:lang="sl">Preiskovalna komisija</catDesc>
                                        </category>
                                    </category>
                                </category>
                                <category xml:id="parl.term">
                                    <catDesc xml:lang="en">Legislative period: term of the parliament between
                                        general elections.</catDesc>
                                    <catDesc xml:lang="sl">Zakonodajno obdobje</catDesc>
                                    <category xml:id="parl.session">
                                        <catDesc xml:lang="en">Legislative session: the period of time in which
                                            a legislature is convened for purpose of lawmaking, usually being
                                            one of two or more smaller divisions of the entire time between two
                                            elections. A session is a meeting or series of connected meetings
                                            devoted to a single order of business, program, agenda, or announced
                                            purpose.</catDesc>
                                        <catDesc xml:lang="sl">Parlamentaro zasedanje</catDesc>
                                        <category xml:id="parl.meeting">
                                            <catDesc xml:lang="en">Meeting/sitting: Each meeting may be a
                                                separate session or part of a group of meetings constituting a
                                                session. The session/meeting may take one or more
                                                days.</catDesc>
                                            <catDesc xml:lang="sl">Seja</catDesc>
                                            <category>
                                                <desc xml:lang="en">Types of meetings</desc>
                                                <category xml:id="parl.meeting.regular">
                                                    <catDesc xml:lang="en">Regular session/meeting</catDesc>
                                                    <catDesc xml:lang="sl">Redna seja</catDesc>
                                                </category>
                                                <category xml:id="parl.meeting.special">
                                                    <catDesc xml:lang="en">Special meeting</catDesc>
                                                    <catDesc xml:lang="sl">Posebna seja</catDesc>
                                                    <category xml:id="parl.meeting.extraordinary">
                                                        <catDesc xml:lang="en">Extraordinary session</catDesc>
                                                        <catDesc xml:lang="sl">Izredna seja</catDesc>
                                                    </category>
                                                    <category xml:id="parl.meeting.urgent">
                                                        <catDesc xml:lang="en">Urgent session</catDesc>
                                                        <catDesc xml:lang="sl">Nujna seja</catDesc>
                                                    </category>
                                                    <category xml:id="parl.meeting.ceremonial">
                                                        <catDesc xml:lang="en">Ceremonial sessions</catDesc>
                                                        <catDesc xml:lang="sl">Slavnostna seja</catDesc>
                                                    </category>
                                                    <category xml:id="parl.meeting.commemorative">
                                                        <catDesc xml:lang="en">Commemorative session</catDesc>
                                                        <catDesc xml:lang="sl">Žalna seja</catDesc>
                                                    </category>
                                                    <category xml:id="parl.meeting.opinions">
                                                        <catDesc xml:lang="en">Public presentation of
                                                            opinions</catDesc>
                                                        <catDesc xml:lang="sl">Javna predstavitev
                                                            mnenj</catDesc>
                                                    </category>
                                                </category>
                                                <category xml:id="parl.meeting.continued">
                                                    <catDesc xml:lang="en">Continued meeting</catDesc>
                                                </category>
                                                <category xml:id="parl.meeting.public">
                                                    <catDesc xml:lang="en">Public session</catDesc>
                                                    <catDesc xml:lang="sl">Javna seja</catDesc>
                                                </category>
                                                <category xml:id="parl.meeting.executive">
                                                    <catDesc xml:lang="en">Executive session</catDesc>
                                                    <catDesc xml:lang="sl">Zaprta seja</catDesc>
                                                </category>
                                            </category>
                                            <category xml:id="parl.sitting">
                                                <catDesc xml:lang="en">Sitting: sitting day</catDesc>
                                                <catDesc xml:lang="sl">Dan seje</catDesc>
                                            </category>
                                        </category>
                                    </category>
                                </category>
                            </taxonomy>
                        </classDecl>
                    </encodingDesc>
                    <profileDesc>
                        <settingDesc>
                            <setting>
                                <name type="city">Ljubljana</name>
                                <name type="country" key="SI">Slovenija</name>
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
                            <personGrp xml:id="chair" role="chairperson"/>
                            <org xml:id="DZ" ana="#parl.national #par.lower">
                                <orgName xml:lang="sl">Državni zbor Republike Slovenije</orgName>
                                <orgName xml:lang="en">National Assembly of the Republic of Slovenia</orgName>
                                <xsl:if test="matches($corpus-label,'^SDT')">
                                    <listOrg xml:id="workingBodies">
                                        <head xml:lang="sl">Delovna telesa Državnega zbora Republike Slovenije</head>
                                        <head xml:lang="en">Working bodies of the National Assembly of the Republic of Slovenia</head>
                                        <xsl:for-each-group select="document($source-corpus-document)/tei:teiCorpus/tei:TEI/tei:teiHeader/tei:profileDesc/tei:particDesc/tei:listOrg/tei:org/tei:listOrg/tei:org" group-by="tei:orgName/@key">
                                            <xsl:sort select="normalize-space(current-group()[1]/tei:orgName)"/>
                                            <org xml:id="{current-grouping-key()}" ana="#parl.committee">
                                                <orgName>
                                                    <xsl:value-of select="normalize-space(current-group()[1]/tei:orgName)"/>
                                                </orgName>
                                            </org>
                                        </xsl:for-each-group>
                                    </listOrg>
                                </xsl:if>
                            </org>
                            <listPerson>
                                <head xml:lang="sl">Seznam govornikov</head>
                                <head xml:lang="en">List of speakers</head>
                                <xsl:for-each select="document($source-speaker-document)/tei:TEI/tei:text/tei:body/tei:listPerson/tei:person">
                                    <xsl:copy-of select="." copy-namespaces="no"/>
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
                    <xsl:element name="xi:include">
                        <xsl:attribute name="href">
                            <xsl:value-of select="."/>
                        </xsl:attribute>
                    </xsl:element>
                    
                    <!-- TEI dokumenti -->
                    <xsl:variable name="document" select="concat('../speech/',.)"/>
                    <xsl:result-document href="{$document}">
                        <xsl:apply-templates select="document(.)" mode="pass0"/>
                    </xsl:result-document>          </xsl:for-each>
            </teiCorpus>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="/" mode="pass0">
        <xsl:variable name="var1">
            <xsl:apply-templates mode="pass1"/>
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
        <xsl:variable name="var5">
            <xsl:apply-templates select="$var4" mode="pass5"/>
        </xsl:variable>
        <xsl:variable name="var6">
            <xsl:apply-templates select="$var5" mode="pass6"/>
        </xsl:variable>
        <xsl:variable name="var7">
            <xsl:apply-templates select="$var6" mode="pass7"/>
        </xsl:variable>
        <!-- kopiram zadnjo variablo z vsebino celotnega dokumenta -->
        <xsl:copy-of select="$var7" copy-namespaces="no"/>
    </xsl:template>
    
    <xsl:template match="@* | node()" mode="pass1">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()" mode="pass1"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="tei:publicationStmt/tei:date" mode="pass1">
        <date when="{current-date()}"><xsl:value-of select="format-date(current-date(),'[D1]. [M1]. [Y0001]')"/></date>
    </xsl:template>
    
    <xsl:template match="tei:text" mode="pass1">
        <text xml:lang="sl">
            <front>
                <docTitle>
                    
                </docTitle>
                <xsl:for-each select="tei:body/tei:div/tei:head | tei:body/tei:div/tei:stage[@type][not(preceding::tei:sp)] | tei:body/tei:div/tei:p[not(preceding::tei:sp)]">
                    <xsl:copy-of select="."/>
                </xsl:for-each>
            </front>
            <xsl:apply-templates mode="pass1"/>    
        </text>
    </xsl:template>
    <xsl:template match="tei:body/tei:div/tei:head" mode="pass1">
        <!-- ne procesiram -->
    </xsl:template>
    <xsl:template match="tei:body/tei:div/tei:stage[@type][not(preceding::tei:sp)]" mode="pass1">
        <!-- ne procesiram -->
    </xsl:template>
    <xsl:template match="tei:body/tei:div/tei:p[not(preceding::tei:sp)]" mode="pass1">
        <!-- ne procesiram -->
    </xsl:template>
    
    <xsl:template match="tei:sp" mode="pass1">
        <u who="#{tokenize(@who,':')[2]}">
            <xsl:apply-templates mode="pass1"/>
        </u>
    </xsl:template>
    
    <xsl:template match="tei:speaker" mode="pass1">
        <note type="speaker">
            <xsl:apply-templates mode="pass1"/>
        </note>
    </xsl:template>
    
    <xsl:template match="tei:sp/tei:p" mode="pass1">
        <xsl:variable name="document-name-id" select="ancestor::tei:TEI/@xml:id"/>
        <xsl:variable name="num">
            <xsl:number count="tei:sp/tei:p" level="any"/>
        </xsl:variable>
        <seg xml:id="{$document-name-id}.p{$num}">
            <xsl:apply-templates mode="pass1"/>
        </seg>
    </xsl:template>
    
    <xsl:template match="tei:sp/tei:p/tei:title[1]" mode="pass1">
        <xsl:variable name="document-name-id" select="ancestor::tei:TEI/@xml:id"/>
        <xsl:variable name="num">
            <xsl:number count="tei:sp/tei:p/tei:title[1]" level="any"/>
        </xsl:variable>
        <title xml:id="{$document-name-id}.title{$num}">
            <xsl:apply-templates mode="pass1"/>
        </title>
    </xsl:template>
    
    <xsl:template match="tei:TEI" mode="pass1">
        <TEI>
            <xsl:apply-templates select="@*" mode="pass1"/>
            <xsl:attribute name="ana">#parl.sitting</xsl:attribute>
            <xsl:apply-templates mode="pass1"/>
        </TEI>
    </xsl:template>
    <xsl:template match="tei:body/tei:div" mode="pass1">
        <div type="minutes">
            <xsl:apply-templates mode="pass1"/>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:sourceDesc/tei:bibl" mode="pass1">
        <bibl>
            <xsl:choose>
                <xsl:when test="@type='mag'">
                    <title xml:lang="sl">Nepreverjen zapis seje</title>
                    <title xml:lang="en">Unverified session record</title>
                </xsl:when>
                <xsl:otherwise>
                    <title xml:lang="sl">Preverjen zapis seje</title>
                    <title xml:lang="en">Verified session record</title>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:apply-templates mode="pass1"/>
        </bibl>
    </xsl:template>
    
    <xsl:template match="tei:titleStmt" mode="pass1">
        <titleStmt>
            <xsl:choose>
                <xsl:when test="tei:title[2]">
                    <xsl:choose>
                        <xsl:when test="tokenize(ancestor::tei:TEI/@xml:id,'-')[2] = 'KKPD'">
                            <title type="main" xml:lang="sl">Dobesedni zapis seje Kolegija predsednika Državnega zbora Republike Slovenije</title>
                            <title type="main" xml:lang="en">Verbatim record of the session of the Council of the President of the National Assembly of the Republic of Slovenia</title>
                        </xsl:when>
                        <xsl:otherwise>
                            <title type="main" xml:lang="sl">Dobesedni zapis seje delovnih teles Državnega zbora Republike Slovenije</title>
                            <title type="main" xml:lang="en">Verbatim record of the session of the working bodies of the National Assembly of the Republic of Slovenia</title>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <xsl:otherwise>
                    <title type="main" xml:lang="sl">Dobesedni zapis seje Državnega zbora Republike Slovenije</title>
                    <title type="main" xml:lang="en">Verbatim record of the session of the National Assembly of the Republic of Slovenia</title>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:for-each select="ancestor::tei:teiHeader/tei:profileDesc/tei:settingDesc/tei:setting">
                <xsl:variable name="workingGroup" select="substring-after(@who,'#')"/>
                <title type="sub" xml:lang="sl">
                    <xsl:if test="ancestor::tei:profileDesc/tei:particDesc/tei:listOrg/tei:org/tei:listOrg/tei:org[not(tei:orgName/@key='KKPD')]">
                        <xsl:value-of select="normalize-space(ancestor::tei:profileDesc/tei:particDesc/tei:listOrg/tei:org/tei:listOrg/tei:org[@xml:id=$workingGroup]/tei:orgName)"/>
                        <xsl:text>: </xsl:text>
                    </xsl:if>
                    <xsl:value-of select="concat(number(@n),'. ')"/>
                    <xsl:choose>
                        <xsl:when test="tei:name = 'Redna'">redna seja</xsl:when>
                        <xsl:when test="tei:name = 'Izredna'">izredna seja</xsl:when>
                        <xsl:when test="tei:name = 'Nujna'">nujna seja</xsl:when>
                        <xsl:when test="tei:name = 'Javna predstavitev'">javna predstavitev mnenj</xsl:when>
                        <xsl:otherwise>
                            <xsl:message>Neznana vrsta seje: <xsl:value-of select="ancestor::tei:TEI/@xml:id"/></xsl:message>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:value-of select="concat(' (',format-date(tei:date/@when,'[D1]. [M1]. [Y0001]'),')')"/>
                </title>
            </xsl:for-each>
            <xsl:for-each select="ancestor::tei:teiHeader/tei:profileDesc/tei:settingDesc/tei:setting">
                <meeting n="{@n}" corresp="{@who}">
                    <xsl:attribute name="ana">
                        <xsl:choose>
                            <xsl:when test="tei:name = 'Redna'">#parl.meeting.regular</xsl:when>
                            <xsl:when test="tei:name = 'Izredna'">#parl.meeting.extraordinary</xsl:when>
                            <xsl:when test="tei:name = 'Nujna'">#parl.meeting.urgent</xsl:when>
                            <xsl:when test="tei:name = 'Javna predstavitev'">#parl.meeting.opinions</xsl:when>
                            <xsl:otherwise>
                                <xsl:message>Neznana vrsta seje: <xsl:value-of select="ancestor::tei:TEI/@xml:id"/></xsl:message>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:attribute>
                    <xsl:value-of select="tei:name"/>
                </meeting>
            </xsl:for-each>
            <xsl:apply-templates select="tei:respStmt" mode="pass1"/>
        </titleStmt>
    </xsl:template>
    
    <xsl:template match="tei:settingDesc" mode="pass1">
        <settingDesc>
            <setting>
                <name type="city">Ljubljana</name>
                <name type="country" key="SI">Slovenija</name>
                <!-- vzamem samo prvega, saj se podatki drugače ponavljajo -->
                <date when="{tei:setting[1]/tei:date/@when}" ana="#parl.sitting">
                    <xsl:value-of select="format-date(tei:setting[1]/tei:date/@when,'[D1]. [M1]. [Y0001]')"/>
                </date>
            </setting>
        </settingDesc>
    </xsl:template>
    
    <xsl:template match="tei:particDesc" mode="pass1">
        <particDesc>
            <xsl:choose>
                <xsl:when test="tei:listOrg/tei:org/tei:listOrg/tei:org">
                    <xsl:for-each select="tei:listOrg/tei:org/tei:listOrg/tei:org">
                        <org xml:id="{@xml:id}" ana="#parl.committee" corresp="#{tei:orgName/@key}">
                            <orgName>
                                <xsl:value-of select="normalize-space(tei:orgName)"/>
                            </orgName>
                        </org>
                    </xsl:for-each>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:for-each select="tei:listOrg/tei:org">
                        <org xml:id="{@xml:id}" ana="#par.lower" corresp="#DZ">
                            <orgName>
                                <xsl:value-of select="normalize-space(tei:orgName)"/>
                            </orgName>
                        </org>
                    </xsl:for-each>
                </xsl:otherwise>
            </xsl:choose>
        </particDesc>
    </xsl:template>
    
    <xsl:template match="@* | node()" mode="pass2">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()" mode="pass2"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="tei:profileDesc" mode="pass2">
        <profileDesc>
            <abstract>
                <list type="agenda">
                    <item xml:id="{ancestor::tei:TEI/@xml:id}.toc-item0">
                        <title>Pred dnevnim redom</title>
                    </item>
                    <xsl:for-each select="//tei:title[@xml:id]">
                        <xsl:variable name="document-name-id" select="ancestor::tei:TEI/@xml:id"/>
                        <xsl:variable name="num">
                            <xsl:number count="tei:title[@xml:id]" level="any"/>
                        </xsl:variable>
                        <item xml:id="{$document-name-id}.toc-item{$num}" corresp="{@xml:id}">
                            <title><xsl:value-of select="normalize-space(.)"/></title>
                            <xsl:for-each select="parent::tei:p/tei:title[not(@xml:id)]">
                                <title><xsl:value-of select="normalize-space(.)"/></title>
                            </xsl:for-each>
                        </item>
                    </xsl:for-each>
                </list>
            </abstract>
            <xsl:apply-templates mode="pass2"/>
        </profileDesc>
    </xsl:template>
    
    <xsl:template match="tei:front/tei:docTitle" mode="pass2">
        <docTitle>
            <xsl:for-each select="parent::tei:front/tei:stage[@type='title'] | parent::tei:front/tei:head">
                <titlePart>
                    <xsl:value-of select="normalize-space(.)"/>
                </titlePart>
            </xsl:for-each>
        </docTitle>
    </xsl:template>
    <xsl:template match="tei:front/tei:stage[@type='title']" mode="pass2">
        <!-- sem procesiral že zgoraj -->
    </xsl:template>
    <xsl:template match="tei:front/tei:head" mode="pass2">
        <!-- sem procesiral že zgoraj -->
    </xsl:template>
    <xsl:template match="tei:front/tei:stage[@type='session']" mode="pass2">
        <docEdition>
            <xsl:value-of select="normalize-space(.)"/>
        </docEdition>
    </xsl:template>
    <xsl:template match="tei:front/tei:stage[@type='date']" mode="pass2">
        <docDate>
            <date>
                <xsl:value-of select="normalize-space(.)"/>
            </date>
        </docDate>
    </xsl:template>
    <xsl:template match="tei:front/tei:stage[@type='chairman']" mode="pass2">
        <castList>
            <castItem>
                <xsl:value-of select="normalize-space(.)"/>
            </castItem>
        </castList>
    </xsl:template>
    <xsl:template match="tei:front/tei:stage[@type='time']" mode="pass2">
        <docDate>
            <time>
                <xsl:value-of select="normalize-space(.)"/>
            </time>
        </docDate>
    </xsl:template>
    <xsl:template match="tei:front/tei:p" mode="pass2">
        <note>
            <xsl:value-of select="normalize-space(.)"/>
        </note>
    </xsl:template>
    
    <xsl:template match="tei:seg" mode="pass2">
        <seg>
            <xsl:apply-templates select="@*" mode="pass2"/>
            <xsl:attribute name="ana">
                <xsl:choose>
                    <xsl:when test="tei:title[@xml:id]">
                        <xsl:value-of select="tei:title[@xml:id]/@xml:id"/>
                    </xsl:when>
                    <xsl:when test="preceding::tei:title[@xml:id]">
                        <xsl:value-of select="preceding::tei:title[@xml:id][1]/@xml:id"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="concat(ancestor::tei:TEI/@xml:id,'.toc-item0')"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            <xsl:apply-templates mode="pass2"/>
        </seg>
    </xsl:template>
    
    <xsl:template match="@* | node()" mode="pass3">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()" mode="pass3"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="tei:list[@type='agenda']/tei:item[tei:title[2]]" mode="pass3">
        <item>
            <xsl:apply-templates select="@*" mode="pass3"/>
            <title>
                <xsl:value-of select="string-join(tei:title,' ')"/>
            </title>
        </item>
    </xsl:template>
    
    <!-- odstranim title oznake -->
    <xsl:template match="tei:u/tei:seg/tei:title" mode="pass3">
        <xsl:apply-templates mode="pass3"/>
    </xsl:template>
    
    <!-- povsod odstranim še q (citate in ostale navedke) -->
    <xsl:template match="tei:q" mode="pass3">
        <xsl:apply-templates mode="pass3"/>
    </xsl:template>
    
   <!-- odstranim @n in mu dam enoten @reason -->
   <xsl:template match="tei:gap" mode="pass3">
       <gap reason="inaudible"/>
   </xsl:template>
    
    <!-- stage v note, ga še prečistim -->
    <xsl:template match="tei:stage" mode="pass3">
        <note>
            <xsl:apply-templates select="@*" mode="pass3"/>
            <xsl:apply-templates mode="pass3"/>
        </note>
    </xsl:template>
    
    <!-- zamenjam seg/@xml:id, ki so prej veljali za p, z novimi za seg -->
    <xsl:template match="@* | node()" mode="pass4">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()" mode="pass4"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="tei:u/tei:seg" mode="pass4">
        <xsl:variable name="document-name-id" select="ancestor::tei:TEI/@xml:id"/>
        <xsl:variable name="num">
            <xsl:number count="tei:u/tei:seg" level="any"/>
        </xsl:variable>
        <seg xml:id="{$document-name-id}.seg{$num}" ana="{@ana}">
            <xsl:apply-templates mode="pass4"/>
        </seg>
    </xsl:template>
    
    <xsl:template match="tei:u" mode="pass4">
        <xsl:variable name="speaker" select="tokenize(tei:note[@type='speaker'],' ')[1]"/>
        <xsl:variable name="chair">
                <item>P0DPREDSEDNIK</item>
                <item>PEDSEDNICA</item>
                <item>PEDSEDNIK</item>
                <item>PERDSEDNICA</item>
                <item>PERDSEDNIK</item>
                <item>POD</item>
                <item>PODOPREDSEDNIK</item>
                <item>PODOPRESEDNIK</item>
                <item>PODOREDSEDNIK</item>
                <item>PODPDREDSEDNICA</item>
                <item>PODPEDSEDNIK</item>
                <item>PODPPREDSEDNIK</item>
                <item>PODPPREDSENIK</item>
                <item>PODPRDESEDNICA</item>
                <item>PODPRDESENIK</item>
                <item>PODPRDSEDNICA</item>
                <item>PODPRDSEDNIK</item>
                <item>PODPREDEDNICA</item>
                <item>PODPREDEDNIK</item>
                <item>PODPREDESEDNIK</item>
                <item>PODPREDSDEDNIK</item>
                <item>PODPREDSDENIK</item>
                <item>PODPREDSDNIK</item>
                <item>PODPREDSEDENIK</item>
                <item>PODPREDSEDICA</item>
                <item>PODPREDSEDIK</item>
                <item>PODPREDSEDNCA</item>
                <item>PODPREDSEDNI</item>
                <item>PODPREDSEDNIA</item>
                <item>PODPREDSEDNIC</item>
                <item>PODPREDSEDNICA</item>
                <item>PODPREDSEDNIDA</item>
                <item>PODPREDSEDNIK</item>
                <item>PODPREDSEDNIKA</item>
                <item>PODPREDSEDNIKCA</item>
                <item>PODPREDSEDNIKI</item>
                <item>PODPREDSEDNIKMAG.</item>
                <item>PODPREDSEDNIKN</item>
                <item>PODPREDSEDNK</item>
                <item>PODPREDSEDNNIK</item>
                <item>PODPREDSEEDNIK</item>
                <item>PODPREDSENDICA</item>
                <item>PODPREDSENDIK</item>
                <item>PODPREDSENICA</item>
                <item>PODPREDSENIK</item>
                <item>PODPREDSETNIK</item>
                <item>PODPREDSEVNIK</item>
                <item>PODPRESDEDNIK</item>
                <item>PODPRESEDNICA</item>
                <item>PODPRESEDNIK</item>
                <item>PODPRESENICA</item>
                <item>PODPRREDSEDNICA</item>
                <item>PODREDSEDNICA</item>
                <item>PODREDSEDNIK</item>
                <item>PODRPEDSEDNIK</item>
                <item>PODRPREDSEDNICA</item>
                <item>PODRPREDSEDNIK</item>
                <item>POPDPREDSEDNICA</item>
                <item>POPDPREDSEDNIK</item>
                <item>POPDREDSEDNICA</item>
                <item>POPDREDSEDNIK</item>
                <item>POPPREDSEDNICA</item>
                <item>POPREDSEDNICA</item>
                <item>POPREDSEDNIK</item>
                <item>POREDSDNICA</item>
                <item>PPRDSEDNIK</item>
                <item>PPREDSEDNIK</item>
                <item>PRDEDSEDNIK</item>
                <item>PRDSEDNICA</item>
                <item>PRDSEDNIK</item>
                <item>PRDSENIK</item>
                <item>PRE</item>
                <item>PREDDSEDNIK</item>
                <item>PREDEDNIK</item>
                <item>PREDESEDNICA</item>
                <item>PREDESEDNIK</item>
                <item>PREDESENIK</item>
                <item>PREDNICA</item>
                <item>PREDPREDSEDNICA</item>
                <item>PREDPREDSEDNIK</item>
                <item>PREDSDEDNIK</item>
                <item>PREDSDENIK</item>
                <item>PREDSDNIK</item>
                <item>PREDSEBNIK</item>
                <item>PREDSECNICA</item>
                <item>PREDSEDDNIK</item>
                <item>PREDSEDEDNIK</item>
                <item>PREDSEDENIK</item>
                <item>PREDSEDICA</item>
                <item>PREDSEDIK</item>
                <item>PREDSEDINK</item>
                <item>PREDSEDN</item>
                <item>PREDSEDNCA</item>
                <item>PREDSEDNDIK</item>
                <item>PREDSEDNI</item>
                <item>PREDSEDNIAC</item>
                <item>PREDSEDNIC</item>
                <item>PREDSEDNICA</item>
                <item>PREDSEDNICA.</item>
                <item>PREDSEDNICA:</item>
                <item>PREDSEDNICa</item>
                <item>PREDSEDNIDK</item>
                <item>PREDSEDNIIK</item>
                <item>PREDSEDNIK</item>
                <item>PREDSEDNIK.</item>
                <item>PREDSEDNIK:</item>
                <item>PREDSEDNIKA</item>
                <item>PREDSEDNIKCA</item>
                <item>PREDSEDNIKDR</item>
                <item>PREDSEDNIKI</item>
                <item>PREDSEDNIKJAKOB</item>
                <item>PREDSEDNIVA</item>
                <item>PREDSEDNIk</item>
                <item>PREDSEDNK</item>
                <item>PREDSEDNKIK</item>
                <item>PREDSEDNNIK</item>
                <item>PREDSEDNUK</item>
                <item>PREDSEDSEDNICA</item>
                <item>PREDSEDSEDNIK</item>
                <item>PREDSEDSEDNIKA</item>
                <item>PREDSEDSENIK</item>
                <item>PREDSEDSNIK</item>
                <item>PREDSEDUJOČA</item>
                <item>PREDSEDUJOČI</item>
                <item>PREDSEDUJOČI:</item>
                <item>PREDSEDUJOČI____________:</item>
                <item>PREDSEEDNIK</item>
                <item>PREDSENDIK</item>
                <item>PREDSENICA</item>
                <item>PREDSENIK</item>
                <item>PREDSESDNIK</item>
                <item>PREEDSEDNICA</item>
                <item>PREEDSEDNIK</item>
                <item>PREESEDNIK</item>
                <item>PRERSEDNIK</item>
                <item>PRESDEDNICA</item>
                <item>PRESDEDNIK</item>
                <item>PRESDSEDNICA</item>
                <item>PRESEDNICA</item>
                <item>PRESEDNIK</item>
                <item>PRESEDNK</item>
                <item>PRESEDSEDNIK</item>
                <item>PREdSEDNIK</item>
                <item>PRFEDSEDNICA</item>
                <item>PRFEDSEDNIK</item>
                <item>PRREDSEDNIK</item>
        </xsl:variable>
        <u who="{@who}">
            <xsl:if test="$speaker = $chair/tei:item">
                <xsl:attribute name="ana">
                    <xsl:text>#chair</xsl:text>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates mode="pass4"/>
        </u>
    </xsl:template>
    
    <!-- uredim povezave na kazala -->
    <xsl:template match="@* | node()" mode="pass5">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()" mode="pass5"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- naredim povezavo iz kazal na tei:seg/@xml:id -->
    <xsl:template match="tei:abstract/tei:list[@type='agenda']/tei:item" mode="pass5">
        <item xml:id="{@xml:id}">
            <xsl:variable name="connection" select="@corresp"/>
            <xsl:variable name="id" select="@xml:id"/>
            <xsl:attribute name="corresp">
                <xsl:choose>
                    <xsl:when test="string-length($connection) = 0">
                        <xsl:for-each select="//tei:seg[@ana = $id]">
                            <xsl:value-of select="concat('#',@xml:id)"/>
                            <xsl:if test=" position() != last()">
                                <xsl:text> </xsl:text>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:for-each select="//tei:seg[@ana = $connection]">
                            <xsl:value-of select="concat('#',@xml:id)"/>
                            <xsl:if test=" position() != last()">
                                <xsl:text> </xsl:text>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            <xsl:apply-templates mode="pass5"/>
        </item>
    </xsl:template>
    
    <!-- odstranim začasni @ana atribut -->
    <xsl:template match="tei:seg" mode="pass5">
        <seg xml:id="{@xml:id}">
            <xsl:apply-templates mode="pass5"/>
        </seg>
    </xsl:template>
    
    <!-- odstranim kazala (Pred dnevnim redom), ki nimajo povezav preko corresp -->
    <xsl:template match="@* | node()" mode="pass6">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()" mode="pass6"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="tei:abstract/tei:list[@type='agenda']/tei:item[string-length(@corresp) = 0]" mode="pass6">
        <!-- ne procesiram -->
    </xsl:template>
    <!-- odstranim tudi prazna kazala -->
    <xsl:template match="tei:abstract[tei:list[@type='agenda']/tei:item[string-length(@corresp) = 0]][not(tei:list[@type='agenda']/tei:item[2])]" mode="pass6">
        <!-- ne procesiram -->
    </xsl:template>
    
    <!-- čisto na koncu še preštejem vse elemente -->
    <xsl:template match="@* | node()" mode="pass7">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()" mode="pass7"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:key name="elements" match="*[ancestor-or-self::tei:text]" use="name()"/>
    
    <xsl:template match="tei:fileDesc" mode="pass7">
        <fileDesc>
            <xsl:apply-templates mode="pass7"/>
        </fileDesc>
        <encodingDesc>
            <tagsDecl>
                <namespace name="http://www.tei-c.org/ns/1.0">
                    <xsl:for-each select="//*[ancestor-or-self::tei:text][count(.|key('elements', name())[1]) = 1]">
                        <tagUsage gi="{name()}" occurs="{count(key('elements', name()))}"/>
                    </xsl:for-each>
                </namespace>
            </tagsDecl>
        </encodingDesc>
    </xsl:template>
    
    
</xsl:stylesheet>