<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    version="2.0">
    
    <!-- 1. Instruction d'output html -->
    <xsl:output method="html" indent="yes" omit-xml-declaration="yes"/>
    
    <!-- 2. Déclaration des variables -->
    
    <!-- Chemins des fichiers de sortie -->
    
    <xsl:variable name="accueil">
        <xsl:value-of select="concat('accueil','.html')"/>
        <!-- variable pour le contenu de la page d'accueil  -->
    </xsl:variable>
    <xsl:variable name="contrat1">
        <xsl:value-of select="concat('contrat_1','.html')"/>
        <!-- variable pour le contenu du premier contrat  -->
    </xsl:variable>
    <xsl:variable name="contrat2">
        <xsl:value-of select="concat('contrat_2','.html')"/>
        <!-- variable pour le contenu du deuxième contrat  -->
    </xsl:variable>
    <xsl:variable name="contrat3">
        <xsl:value-of select="concat('contrat_3','.html')"/>
        <!-- variable pour le contenu du troisième contrat  -->
    </xsl:variable>
    <xsl:variable name="tableau">
        <xsl:value-of select="concat('tableau','.html')"/>
        <!-- variable pour le contenu du tableau récapitulatif  -->
    </xsl:variable>
    <xsl:variable name="facs_1">
        <xsl:value-of select="concat('facs1','.html')"/>
        <!-- variable pour le contenu du fac-similé du premier contrat  -->
    </xsl:variable>
    <xsl:variable name="facs_2">
        <xsl:value-of select="concat('facs2','.html')"/>
        <!-- variable pour le contenu fac-similé du deuxième contrat  -->
    </xsl:variable>
    <xsl:variable name="facs_3">
        <xsl:value-of select="concat('facs3','.html')"/>
        <!-- variable pour le contenu fac-similé du troisième contrat  -->
    </xsl:variable>
    
    <!-- Variable avec le <head> -->
    <xsl:variable name="header">
        <head>
            <meta name="viewport" content="width=device-width, initial-scale=1"/>
            <title><xsl:value-of select="/teiCorpus/teiHeader/fileDesc/titleStmt/title"/></title>
            <meta name="description">
                <xsl:attribute name="content">
                    <xsl:value-of select="//titleStmt/title[@level='a']"/><xsl:text> par </xsl:text><xsl:value-of select="//titleStmt/author"/>
                </xsl:attribute>
            </meta>
            <meta name="author">
                <xsl:attribute name="content">
                    <xsl:value-of select="//editionStmt/editor"/>
                </xsl:attribute>
            </meta>
            <style>
                header {
                background-color: #333;
                color: #fff;
                padding: 10px;
                text-align: center;
                }
                nav {
                background-color: rgba(197, 221, 207, 0.9);
                }
                nav ul {
                list-style-type: none;
                margin: 0;
                padding: 0;
                text-align: center;
                }
                nav ul li {
                display: inline-block;
                position: relative;
                padding: 10px 20px;
                cursor: pointer;
                font-size: 20px;
                }
                nav ul li a {
                font-size: 20px;
                }
                nav ul li:hover {
                background-color: #518C97;
                }
                nav ul li ul {
                display: none;
                position: absolute;
                top: 100%;
                left: 0;
                background-color: #97BCAE;
                min-width: 150px;
                }
                nav ul li ul li a {
                font-size: 16px;
                }
                nav ul li:hover ul {
                display: block;
                }
                nav ul li ul li {
                display: block;
                padding: 10px;
                }
                nav ul li ul li:hover {
                background-color: #555;
                }
                nav ul li a:visited {
                color: #B1545E; 
                }
                nav {
                box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2); 
                border-bottom: 2px solid rgba(0, 0, 0, 0.1); 
                position: relative; 
                z-index: 1000; 
                }
                .container {
                display: flex; 
                align-items: center; 
                }
                .image {
                flex: 2; 
                padding-right: 20px; 
                overflow: hidden;
                position: relative;
                }
                .image img {
                width: 100%;
                height: auto; 
                transition: transform 0.3s ease; 
                }
                .image:hover {
                cursor: zoom-in; 
                }
                .text {
                flex: 1;
                }
                div a:visited {
                color: #B1545E; 
                }
                .tg {
                border-collapse: collapse;
                border-spacing: 0;
                width: 100%;
                background-color: #D9EBDB; 
                }
                .tg th {
                background-color: #65A8B3; 
                color: white; 
                font-weight: bold; 
                text-align: center; 
                border: 1px solid #dddddd;
                padding: 8px;
                }
                .tg td {
                border: 1px solid #dddddd; 
                padding: 8px;
                text-align: left;
                }
                .tg td:hover, .tg th:hover {
                background-color: #F8E0B7;
                }
                .content {
                box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2); 
                border: 2px solid rgba(0, 0, 0, 0.1); 
                padding: 20px; 
                background-color: rgba(250, 250, 240, 0.9);
                }
                .tg th:hover {
                background-color: #65A8B3; 
                }
                div a:visited {
                color: #B1545E; 
                }
            </style>
        </head>
    </xsl:variable>
    
    <!-- Variable avec le <footer> -->
    <xsl:variable name="footer">
        <footer>
            <p><i><xsl:value-of select="//teiCorpus/teiHeader/fileDesc/publicationStmt"/></i></p>
        </footer>
    </xsl:variable>
    
    <!-- Variable avec le css du <body>-->
    <xsl:variable name="body_css">
        <xsl:text>margin-right: 10%; margin-left: 10%; margin-top: 6%;</xsl:text>
        <xsl:text>background-image: url('./img/wallpaper.jpg');</xsl:text>
        <xsl:text>background-size: cover;</xsl:text>
        <xsl:text>background-position: center;</xsl:text>
        <xsl:text>background-repeat: no-repeat;</xsl:text>
        <xsl:text>background-attachment: fixed;</xsl:text>
        <xsl:text>font-family: Garamond, serif;</xsl:text>
    </xsl:variable>
    
    
    <!-- Variable avec le css des <div> -->
    <xsl:variable name="div_css">
        <xsl:text>
            background-color: rgba(250, 250, 240, 0.9);
            border: 5px solid rgba(0, 0, 0, 0.1);
            padding: 20px;
            text-align: justify;
            margin-bottom: 8%;
        </xsl:text>
    </xsl:variable>
    
    <!-- Variable avec les liens de retour (accueil/tableau) -->
    <xsl:variable name="return_accueil">
        <i><a href="{concat('./', $accueil)}">Revenir à l'accueil</a></i>
    </xsl:variable>
    <xsl:variable name="return_tableau">
        <i><a href="{concat('./', $tableau)}">Tableau récapitulatif</a></i>
    </xsl:variable>
    
    <!-- Variable avec l'en-tête du <body> -->
    <xsl:variable name="body_header">
        <div style="text-align: center; margin-bottom: 8%; margin-right: 20%; margin-left: 20%">
            <h1><i><xsl:value-of select="/teiCorpus/teiHeader//titleStmt/title"/></i></h1>
        </div>
        <nav>
            <ul>
                <li><a href="./{$accueil}">Accueil</a></li>
                <li>Éditions numériques
                    <ul>
                        <li><a href="./{$contrat1}"><xsl:value-of select="//TEI[1]//sourceDesc//idno"/></a></li>
                        <li><a href="./{$contrat2}"><xsl:value-of select="//TEI[2]//sourceDesc//idno"/></a></li>
                        <li><a href="./{$contrat3}"><xsl:value-of select="//TEI[3]//sourceDesc//idno"/></a></li>
                    </ul>
                </li>
                <li>Fac-similés
                    <ul>
                        <li><a href="./{$facs_1}"><xsl:value-of select="//TEI[1]//sourceDesc//idno"/></a></li>
                        <li><a href="./{$facs_2}"><xsl:value-of select="//TEI[2]//sourceDesc//idno"/></a></li>
                        <li><a href="./{$facs_3}"><xsl:value-of select="//TEI[3]//sourceDesc//idno"/></a></li>
                    </ul>
                </li>
                <li><a href="./{$tableau}">Tableau récapitulatif</a></li>
            </ul>
        </nav>
    </xsl:variable>
    
    <!-- Fin des déclarations de variables -->
    
    <!-- Template match sur la racine avec les call templates des pages-->
    <xsl:template match="/">
        <xsl:call-template name="accueil"/>
        <xsl:call-template name="contrat1"/>
        <xsl:call-template name="contrat2"/>
        <xsl:call-template name="contrat3"/>
        <xsl:call-template name="tableau"/>
        <xsl:call-template name="facs1"/>
        <xsl:call-template name="facs2"/>
        <xsl:call-template name="facs3"/>
    </xsl:template>
    
    <!-- Template de la page d'accueil -->
    <xsl:template name="accueil">
        <xsl:result-document href="{$accueil}" method="html">
            <html lang="fr">
                <xsl:copy-of select="$header"/>
                <body>
                    <xsl:attribute name="style">
                        <xsl:value-of select="$body_css"/>
                    </xsl:attribute>
                    <xsl:copy-of select="$body_header"/>
                    
                    <div>
                        <xsl:attribute name="style">
                            <xsl:value-of select="$div_css"/>
                        </xsl:attribute>
                        <!-- Présentation du projet de recherche dans lequel s'inscrit l'édition numérique -->
                        <div>
                            <h2>Les ouvrières en linge à Paris au XVIIIème siècle : de la grisette à la marchande lingère</h2>
                            <p>Qui sont les ouvrières en linge ? Ces femmes, ici identifiées uniquement par leur profession, semblent totalement absentes des dictionnaires commerciaux et des statuts de corporations. 
                                Elles ne constituent pas un corps de métier reconnu, et ne paraissent pas liées officiellement à une communauté de 
                                métier. Aucune étude historique ne leur est consacrée, bien qu’elles soient régulièrement mentionnées dans des ouvrages traitant du 
                                travail, des femmes et de la criminalité à Paris entre le XVIIe et le XIXe siècle.</p>
                            <h3>Dans la littérature...</h3>
                            <p>Les ouvrières en linge sont pour les observateurs contemporains comme Louis-Sébastien Mercier et Rétif de la Bretonne un objet de fantasme. 
                                Elles représentent la quintessence de la grisette, cette jeune ouvrière de condition médiocre, seule, coquette, et qui se laisse facilement séduire. 
                                Ces ouvrières, présentées d’un point de vue pour le moins paternaliste et moralisateur, sont jugées par ces observateurs avec plus ou moins de bienveillance. 
                                Certains, comme Louis-Sébastien Mercier, louent leur travail assidu et admirent ce qu’ils perçoivent comme un esprit libre des contraintes bourgeoises, et donc charmant. 
                                D’autres voient en elles des femmes dénaturées, masculines, arrachées à leur rôle naturel de femmes et donc dépourvues de toute grâce et féminité. Mais la définition ne couvre jamais le sujet de 
                                leur activité à proprement parler. Quelles sont leurs compétences ? En quoi consiste leur travail ? La réponse à ces questions, qui parait peut-être évidente à leurs contemporains, est toujours absente. 
                                La seule activité à laquelle elles sont associées est la prostitution. La première mention des ouvrières en linge dans le <i>Tableau de Paris</i> de Mercier est dans la rubrique intitulée : les matrones.</p>
                            <p>Les mentions d’ouvrières en linge dans la littérature des XVIIIe et XIXe siècles renvoient à une perception profondément ancrée du travail des femmes et de leur solitude dans l’espace urbain. 
                                L'ouvrière en linge symbolise la jeune fille du peuple qui, par un concours de circonstances plus ou moins rocambolesques, se retrouve seule et doit travailler pour subvenir à ses besoins. 
                                Dans les représentations iconographiques comme dans les écrits, elles sont un objet d’admiration et de désir pour les hommes qui les côtoient. Elles se trouvent souvent dans des situations de 
                                grande fragilité, contraintes de choisir entre la misère et le vice. Dans le roman <i>Magdeleine la Repentie</i> d’E.L. Guérin, publié en 1837, le personnage principal, employée comme ouvrière en linge, 
                                doit quitter son logement pour échapper aux avances de son employeur. Le conte d’Alfred de Musset, <i>Mimi Pinson, profil de grisette</i>, paru en 1845, raconte la rencontre de deux jeunes hommes avec 
                                leur voisine ouvrière en linge, Mimi Pinson, qui doit mettre son seul bien, sa robe, en gage pour survivre.</p>
                            <h3>Dans l'historiographie...</h3>
                            <p>Les travaux d’historiens qui font mention d’ouvrières en linge semblent confirmer l’image proposée par les écrits des XVIIIe et XIXe siècles. Nombreuses sont les jeunes femmes qui, 
                                arrêtées pour vol ou pour avoir fait commerce de leurs charmes, déclarent comme profession celle d’ouvrière en linge. Misère, fragilité et criminalité sont-elles le lot de toutes les ouvrières en linge ? 
                                Des données additionnelles nous invitent à nuancer le cliché figé dans le temps de l’inévitable précarité de ces femmes. 
                                Sabine Juratic remarque par exemple la situation économique tout à fait confortable d’un certain nombre d’entre elles à la fin de leur vie. Les situations domestique, professionnelle et économique de ces ouvrières 
                                sont en réalité beaucoup plus variées que celles présentées dans la littérature et généralement acceptées par les historiens. A partir d’un échantillon de contrats de mariage passés entre 1730 et 1789, nous nous évertuerons
                                à définir les rapports qu’elles entretiennent avec les corps d’arts et métiers du secteur du textile et de l’habillement. En reconstituant leurs réseaux de relation, nous parviendrons peut-être à mieux évaluer 
                                leur niveau de compétence, et ainsi leurs parcours d’apprentissage. Nous souhaitons grâce à ce travail proposer une définition neuve de ce métier, et d’en réaliser un portrait plus nuancé.</p>
                            <h2>Présentation de l'édition numérique</h2>
                            <p><xsl:value-of select="//sourceDesc/p"/><xsl:text> </xsl:text>
                            <xsl:value-of select="//projectDesc/p"/></p>
                            <h3>Règles de transcription et de normalisation</h3>
                            <p><xsl:value-of select="//normalization/p"/></p>
                            <p>Dans le cadre des versions fac-similé, les éléments biffés ont été rayés, tandis que les éléments incertains ont été mis entre crochets. 
                                Les ajouts marginaux ont quant à eux été insérés dans le corps du texte pour en faciliter la lecture.</p>
                        </div>
                        <div>
                            <p><a href="./{$contrat1}">Contrat 1</a> – <a href="./{$contrat2}">Contrat 2</a> – <a href="./{$contrat3}">Contrat 3</a> – <a href="./{$tableau}">Tableau</a></p>
                        </div>
                    </div>
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <!-- Template de l'édition numérique du premier contrat -->
    <xsl:template name="contrat1">
        <xsl:result-document href="{$contrat1}" method="html">
            <html lang="fr">
                <xsl:copy-of select="$header"/>
                <body>
                    <xsl:attribute name="style">
                        <xsl:value-of select="$body_css"/>
                    </xsl:attribute>
                    <xsl:copy-of select="$body_header"/>
                    <div>
                        <xsl:attribute name="style">
                            <xsl:value-of select="$div_css"/>
                        </xsl:attribute>
                        <h3 style="text-align: center; padding-bottom: 2%;">Contrat I.</h3>
                        <h4  style="text-align: justify"><xsl:value-of select="//TEI[@n='1']//msDesc//idno"/></h4>
                        <xsl:apply-templates select="//TEI[@n='1']/text"/>
                    </div>
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="//TEI[@n='1']/text">
        <div style="text-align: justify;">
            <xsl:for-each select="//TEI[@n='1']/text//div/p">
                <p><xsl:apply-templates/></p>
            </xsl:for-each>
            <xsl:for-each select="//TEI[@n='1']/text//signed">
                <p><xsl:apply-templates/></p>
            </xsl:for-each>
            <p><a href="./{$facs_1}">Version fac-similé</a></p>
            <p><a href="./{$contrat2}">Contrat suivant.</a> >> </p>
            <xsl:copy-of select="$return_accueil"/> – <xsl:copy-of select="$return_tableau"/>
        </div>
    </xsl:template>
    
    <!-- Template de l'édition numérique du deuxième contrat -->
    <xsl:template name="contrat2">
        <xsl:result-document href="{$contrat2}" method="html">
            <html lang="fr">
                <xsl:copy-of select="$header"/>
                <body>
                    <xsl:attribute name="style">
                        <xsl:value-of select="$body_css"/>
                    </xsl:attribute>
                    <xsl:copy-of select="$body_header"/>
                    <div>
                        <xsl:attribute name="style">
                            <xsl:value-of select="$div_css"/>
                        </xsl:attribute>
                        <h3 style="text-align: center; padding-bottom: 2%;">Contrat II.</h3>
                        <h4 style="text-align: justify"><xsl:value-of select="//TEI[@n='2']//msDesc//idno"/></h4>
                        <xsl:apply-templates select="//TEI[@n='2']/text"/>
                    </div>
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="//TEI[@n='2']/text">
        <div style="text-align: justify;">
            <xsl:for-each select="//TEI[@n='2']/text//div/p">
                <p><xsl:apply-templates/></p>
            </xsl:for-each>
            <xsl:for-each select="//TEI[@n='2']/text//signed">
                <p><xsl:apply-templates/></p>
            </xsl:for-each>
            <p><a href="./{$facs_2}">Version fac-similé</a></p>
            <p>&lt; &lt;  <a href="./{$contrat1}">Contrat précédent.</a>
                <xsl:text> </xsl:text>
                <a href="./{$contrat3}">Contrat suivant.</a> >> </p>
            <xsl:copy-of select="$return_accueil"/> – <xsl:copy-of select="$return_tableau"/>
        </div>
    </xsl:template>
    
    <!-- Template de l'édition numérique du troisième contrat -->
    <xsl:template name="contrat3">
        <xsl:result-document href="{$contrat3}" method="html">
            <html lang="fr">
                <xsl:copy-of select="$header"/>
                <body>
                    <xsl:attribute name="style">
                        <xsl:value-of select="$body_css"/>
                    </xsl:attribute>
                    <xsl:copy-of select="$body_header"/>
                    <div>
                        <xsl:attribute name="style">
                            <xsl:value-of select="$div_css"/>
                        </xsl:attribute>
                        <h3 style="text-align: center; padding-bottom: 2%;">Contrat III.</h3>
                        <h4 style="text-align: justify"><xsl:value-of select="//TEI[@n='3']//msDesc//idno"/></h4>
                        <xsl:apply-templates select="//TEI[@n='3']/text"/>
                    </div>
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="//TEI[@n='3']/text">
        <div style="text-align: justify;">
            <xsl:for-each select="//TEI[@n='3']/text//div/p">
                <p><xsl:apply-templates/></p>
            </xsl:for-each>
            <xsl:for-each select="//TEI[@n='3']/text//signed">
                <p><xsl:apply-templates/></p>
            </xsl:for-each>
            <p><a href="./{$facs_3}">Version fac-similé</a></p>
            <p>&lt; &lt;  <a href="./{$contrat2}">Contrat précédent.</a></p>
            <xsl:copy-of select="$return_accueil"/> – <xsl:copy-of select="$return_tableau"/>
        </div>
    </xsl:template>
    
    <!-- Template du tableau récapitulatif -->
    <xsl:template name="tableau">
        <xsl:result-document href="{$tableau}" method="html">
            <html lang="fr">
                <xsl:copy-of select="$header"/>
                <body>
                    <xsl:attribute name="style">
                        <xsl:value-of select="$body_css"/>
                    </xsl:attribute>
                    <xsl:copy-of select="$body_header"/>
                    <div class="content">
                        <div class="container">
                            <table class="tg">
                                <thead>
                                    <tr>
                                        <th class="tg-0pky">Nom</th>
                                        <th class="tg-0lax">Prénom(s)</th>
                                        <th class="tg-0lax">Adresse</th>
                                        <th class="tg-0lax">Profession de l'époux</th>
                                        <th class="tg-0lax">Adresse de l'époux</th>
                                        <th class="tg-0lax">Profession du père</th>
                                        <th class="tg-0lax">Adresse du père</th>
                                        <th class="tg-0lax">Apports au mariage*</th>
                                        <th class="tg-0lax">Douaire*</th>
                                        <th class="tg-0lax">Preciput*</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <xsl:for-each select="//TEI">
                                        <tr>
                                            <td><xsl:value-of select=".//particDesc//person[@role='epouse']//surname"/></td>
                                            <td><xsl:value-of select=".//particDesc//person[@role='epouse']//forename"/></td>
                                            <td><xsl:value-of select=".//particDesc//person[@role='epouse']/residence/placeName"/>, 
                                                <xsl:value-of select=".//particDesc//person[@role='epouse']/residence/settlement"/>, 
                                                <xsl:value-of select=".//particDesc//person[@role='epouse']/residence/country"/></td>
                                            <td><xsl:value-of select=".//particDesc//person[@role='epoux']/occupation"/></td>
                                            <td>
                                                <xsl:value-of select=".//particDesc//person[@role='epoux']/residence/placeName"/>, 
                                                <xsl:value-of select=".//particDesc//person[@role='epoux']/residence/settlement"/>, 
                                                <xsl:value-of select=".//particDesc//person[@role='epoux']/residence/country"/>
                                            </td>
                                            <td><xsl:value-of select=".//particDesc//person[@role='pere_epouse']/occupation"/></td>
                                            <td>
                                                <!-- Afficher l'adresse du père de l'épouse s'il est indiqué dans le texte -->
                                                <xsl:choose>
                                                    <xsl:when test="exists(.//particDesc//person[@role='pere_epouse']/residence)">
                                                        <xsl:value-of select=".//particDesc//person[@role='pere_epouse']/residence/placeName"/>,  
                                                        <xsl:value-of select=".//particDesc//person[@role='pere_epouse']/residence/country"/>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <i>Information manquante</i>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </td>
                                            <td>
                                                <!-- Variable contenant l'identifiant de l'épouse du contrat en cours -->
                                                <xsl:variable name="currentId" select=".//particDesc//person[@role='epouse']/@xml:id"/>
                                                <!-- Récupérer la valeur des biens propres de l'épouse, sans ceux de l'époux, en liant la valeur de l'attribut @corresp de l'élément 
                                                <measure> avec  l'identifiant unique de l'épouse contenu dans la variable $currentId -->
                                                <xsl:value-of select="//measure[@type='biens_propres'][contains(@corresp, concat('#', $currentId))]/@quantity"/>
                                            </td>
                                            <td>
                                                <xsl:value-of select=".//measure[@type='douaire']/[@quantity]"/>
                                            </td>
                                            <td>
                                                <xsl:value-of select=".//measure[@type='preciput']/[@quantity]"/>
                                            </td>
                                        </tr>
                                    </xsl:for-each>
                                </tbody>
                            </table>
                            <br/>
                        </div>
                        <div>
                            <p>* Les valeurs sont exprimées en livres.</p>
                        </div>
                        <p><xsl:copy-of select="$return_accueil"/> – <a href="./{$contrat1}">Contrat 1</a> – <a href="./{$contrat2}">Contrat 2</a> – <a href="./{$contrat3}">Contrat 3</a></p>
                    </div>
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <!-- Template du fac-similé du premier contrat-->
    <xsl:template name="facs1">
        <xsl:result-document href="{$facs_1}" method="html">
            <html lang="fr">
                <xsl:copy-of select="$header"/>
                <body>
                    <xsl:attribute name="style">
                        <xsl:value-of select="$body_css"/>
                    </xsl:attribute>
                    <xsl:copy-of select="$body_header"/>
                    <!-- Première page -->
                    <div id="c1p1" class="container">
                        <xsl:attribute name="style">
                            <xsl:value-of select="$div_css"/>
                        </xsl:attribute>
                        <!-- Insertion de l'image -->
                        <div class="image">
                            <a href="./img/MC-ET-XXVIII-468(1).jpg" target="_blank">
                                <img src="./img/MC-ET-XXVIII-468(1).jpg" alt="MC-ET-XXVIII-468(1)"/>
                            </a>
                        </div>
                        <!-- Insertion de chaque ligne transcrite en les numérotant -->
                        <div class="text" style="text-align:justify">
                            <xsl:for-each select="//TEI[1]//div[@type='titre']/*">
                                <p>
                                    <xsl:value-of select="."/>
                                </p>
                            </xsl:for-each>
                            <br/>
                            <xsl:for-each select="(//TEI[1]//l)[position() &gt;= 1 and position() &lt;= 20]">
                                <p>[<xsl:number level="any" count="(//TEI[1]//l)" format="1"/>]
                                    <xsl:text> </xsl:text>
                                    <xsl:apply-templates select="node()"/>
                                </p>
                            </xsl:for-each>
                        </div>
                    </div>
                    <!-- Deuxième page -->
                    <div id="c1p2" class="container">
                        <xsl:attribute name="style">
                            <xsl:value-of select="$div_css"/>
                        </xsl:attribute>
                        <div class="image">
                            <a href="./img/MC-ET-XXVIII-468(2).jpg" target="_blank">
                                <img src="./img/MC-ET-XXVIII-468(2).jpg" alt="MC-ET-XXVIII-468(2)"/>
                            </a>
                        </div>
                        <div class="text" style="text-align:justify">
                            <!-- La numérotation des lignes se fait à l'échelle de tout le document et non par page -->
                            <xsl:for-each select="(//TEI[1]//l)[position() &gt;= 21 and position() &lt;= 36]">
                                <p>[<xsl:number level="any" count="(//TEI[1]//l)" format="1"/>]
                                    <xsl:text> </xsl:text>
                                    <xsl:apply-templates select="node()"/>
                                </p>
                            </xsl:for-each>
                        </div>
                    </div>
                    <!-- Troisième page -->
                    <div id="c1p3" class="container">
                        <xsl:attribute name="style">
                            <xsl:value-of select="$div_css"/>
                        </xsl:attribute>
                        <div class="image">
                            <a href="./img/MC-ET-XXVIII-468(3).jpg" target="_blank">
                                <img src="./img/MC-ET-XXVIII-468(3).jpg" alt="MC-ET-XXVIII-468(3)"/>
                            </a>
                        </div>
                        <div class="text" style="text-align:justify">
                            <xsl:for-each select="(//TEI[1]//l)[position() &gt;= 37 and position() &lt;= 71]">
                                <p>[<xsl:number level="any" count="(//TEI[1]//l)" format="1"/>]
                                    <xsl:text> </xsl:text>
                                    <xsl:apply-templates select="node()"/>
                                </p>
                            </xsl:for-each>
                        </div>
                    </div>
                    <!-- Quatrième page -->
                    <div id="c1p4" class="container">
                        <xsl:attribute name="style">
                            <xsl:value-of select="$div_css"/>
                        </xsl:attribute>
                        <div class="image">
                            <a href="./img/MC-ET-XXVIII-468(4).jpg" target="_blank">
                                <img src="./img/MC-ET-XXVIII-468(4).jpg" alt="MC-ET-XXVIII-468(4)"/>
                            </a>
                        </div>
                        <div class="text" style="text-align:justify">
                            <xsl:for-each select="(//TEI[1]//l)[position() &gt;= 72 and position() &lt;= 91]">
                                <p>[<xsl:number level="any" count="(//TEI[1]//l)" format="1"/>]
                                    <xsl:text> </xsl:text>
                                    <xsl:apply-templates select="node()"/>
                                </p>
                            </xsl:for-each>
                            <br/>
                            <xsl:for-each select="//TEI[1]//div[@type='signatures']/*">
                                <p>
                                    <xsl:apply-templates select="node()"/>
                                </p>
                            </xsl:for-each>
                        </div>
                    </div>
                    <!-- Liens et footer -->
                    <div>
                        <p><a href="./{$facs_1}">Fac-similé 1</a> – <a href="./{$facs_2}">Fac-similé 2</a> – <a href="./{$facs_3}">Fac-similé 3</a> – <a href="./{$tableau}">Tableau</a></p>
                    </div>
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <!-- Template du fac-similé du deuxième contrat-->
    <xsl:template name="facs2">
        <xsl:result-document href="{$facs_2}" method="html">
            <html lang="fr">
                <xsl:copy-of select="$header"/>
                <body>
                    <xsl:attribute name="style">
                        <xsl:value-of select="$body_css"/>
                    </xsl:attribute>
                    <xsl:copy-of select="$body_header"/>
                    <!-- Première page -->
                    <div id="c2p1" class="container">
                        <xsl:attribute name="style">
                            <xsl:value-of select="$div_css"/>
                        </xsl:attribute>
                        <div class="image">
                            <a href="./img/MC-ET-LXIX-691(1).jpg" target="_blank">
                                <img src="./img/MC-ET-LXIX-691(1).jpg" alt="MC-ET-LXIX-691(1)"/>
                            </a>
                        </div>
                        <div class="text" style="text-align:justify">
                            
                            <xsl:for-each select="//TEI[2]//div[@type='titre']/*">
                                <p>
                                    <xsl:value-of select="."/>
                                </p>
                            </xsl:for-each>
                            <br/>
                            <xsl:for-each select="(//TEI[2]//l)[position() &gt;= 1 and position() &lt;= 18]">
                                <p>[<xsl:number level="any" count="(//TEI[2]//l)" format="1"/>]
                                    <xsl:text> </xsl:text>
                                    <xsl:apply-templates select="node()"/>
                                </p>
                            </xsl:for-each>
                        </div>
                    </div>
                    <!-- Deuxième page -->
                    <div id="c2p2" class="container">
                        <xsl:attribute name="style">
                            <xsl:value-of select="$div_css"/>
                        </xsl:attribute>
                        <div class="image">
                            <a href="./img/MC-ET-LXIX-691(2).jpg" target="_blank">
                                <img src="./img/MC-ET-LXIX-691(2).jpg" alt="MC-ET-LXIX-691(2)"/>
                            </a>
                        </div>
                        <div class="text" style="text-align:justify">
                            <xsl:for-each select="(//TEI[2]//l)[position() &gt;= 19 and position() &lt;= 48]">
                                <p>[<xsl:number level="any" count="(//TEI[2]//l)" format="1"/>]
                                    <xsl:text> </xsl:text>
                                    <xsl:apply-templates select="node()"/>
                                </p>
                            </xsl:for-each>
                        </div>
                    </div>
                    <!-- Troisième page -->
                    <div id="c2p3" class="container">
                        <xsl:attribute name="style">
                            <xsl:value-of select="$div_css"/>
                        </xsl:attribute>
                        <div class="image">
                            <a href="./img/MC-ET-LXIX-691(3).jpg" target="_blank">
                                <img src="./img/MC-ET-LXIX-691(3).jpg" alt="MC-ET-LXIX-691(3)"/>
                            </a>
                        </div>
                        <div class="text" style="text-align:justify">
                            <xsl:for-each select="(//TEI[2]//l)[position() &gt;= 49 and position() &lt;= 77]">
                                <p>[<xsl:number level="any" count="(//TEI[2]//l)" format="1"/>]
                                    <xsl:text> </xsl:text>
                                    <xsl:apply-templates select="node()"/>
                                </p>
                            </xsl:for-each>
                        </div>
                    </div>
                    <!-- Quatrième page -->
                    <div id="c2p4" class="container">
                        <xsl:attribute name="style">
                            <xsl:value-of select="$div_css"/>
                        </xsl:attribute>
                        <div class="image">
                            <a href="./img/MC-ET-LXIX-691(4).jpg" target="_blank">
                                <img src="./img/MC-ET-LXIX-691(4).jpg" alt="MC-ET-LXIX-691(4)"/>
                            </a>
                        </div>
                        <div class="text" style="text-align:justify">
                            <xsl:for-each select="(//TEI[2]//l)[position() &gt;= 78 and position() &lt;= 97]">
                                <p>[<xsl:number level="any" count="(//TEI[2]//l)" format="1"/>]
                                    <xsl:text> </xsl:text>
                                    <xsl:apply-templates select="node()"/>
                                </p>
                            </xsl:for-each>
                            <br/>
                            <xsl:for-each select="//TEI[2]//div[@type='signatures']/*">
                                <p>
                                    <xsl:apply-templates select="node()"/>
                                </p>
                            </xsl:for-each>
                        </div>
                    </div>
                    <!-- Liens et footer -->
                    <div>
                        <p><a href="./{$facs_1}">Fac-similé 1</a> – <a href="./{$facs_2}">Fac-similé 2</a> – <a href="./{$facs_3}">Fac-similé 3</a> – <a href="./{$tableau}">Tableau</a></p>
                    </div>
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <!-- Template du fac-similé du troisième contrat-->
    <xsl:template name="facs3">
        <xsl:result-document href="{$facs_3}" method="html">
            <html lang="fr">
                <xsl:copy-of select="$header"/>
                <body>
                    <xsl:attribute name="style">
                        <xsl:value-of select="$body_css"/>
                    </xsl:attribute>
                    <xsl:copy-of select="$body_header"/>
                    <!-- Première page -->
                    <div id="c3p1" class="container">
                        <xsl:attribute name="style">
                            <xsl:value-of select="$div_css"/>
                        </xsl:attribute>
                        <div class="image">
                            <a href="./img/MC-ET-IV-573(1).jpg" target="_blank">
                                <img src="./img/MC-ET-IV-573(1).jpg" alt="MC-ET-IV-573(1)"/>
                            </a>
                        </div>
                        <div class="text" style="text-align:justify">
                            <xsl:for-each select="//TEI[3]//div[@type='titre']/*">
                                <p>
                                    <xsl:value-of select="."/>
                                </p>
                            </xsl:for-each>
                            <br/>
                            <xsl:for-each select="(//TEI[3]//l)[position() &gt;= 1 and position() &lt;= 22]">
                                <p>[<xsl:number level="any" count="(//TEI[3]//l)" format="1"/>]
                                    <xsl:text> </xsl:text>
                                    <xsl:apply-templates select="node()"/>
                                </p>
                            </xsl:for-each>
                        </div>
                    </div>
                    <!-- Deuxième page -->
                    <div id="c2p2" class="container">
                        <xsl:attribute name="style">
                            <xsl:value-of select="$div_css"/>
                        </xsl:attribute>
                        <div class="image">
                            <a href="./img/MC-ET-IV-573(2).jpg" target="_blank">
                                <img src="./img/MC-ET-IV-573(2).jpg" alt="MC-ET-IV-573(2)"/>
                            </a>
                        </div>
                        <div class="text" style="text-align:justify">
                            <xsl:for-each select="(//TEI[3]//l)[position() &gt;= 23 and position() &lt;= 51]">
                                <p>[<xsl:number level="any" count="(//TEI[3]//l)" format="1"/>]
                                    <xsl:text> </xsl:text>
                                    <xsl:apply-templates select="node()"/>
                                </p>
                            </xsl:for-each>
                        </div>
                    </div>
                    <!-- Troisième page -->
                    <div id="c2p3" class="container">
                        <xsl:attribute name="style">
                            <xsl:value-of select="$div_css"/>
                        </xsl:attribute>
                        <div class="image">
                            <a href="./img/MC-ET-IV-573(3).jpg" target="_blank">
                                <img src="./img/MC-ET-IV-573(3).jpg" alt="MC-ET-IV-573(3)"/>
                            </a>
                        </div>
                        <div class="text" style="text-align:justify">
                            <xsl:for-each select="(//TEI[3]//l)[position() &gt;= 52 and position() &lt;= 80]">
                                <p>[<xsl:number level="any" count="(//TEI[3]//l)" format="1"/>]
                                    <xsl:text> </xsl:text>
                                    <xsl:apply-templates select="node()"/>
                                </p>
                            </xsl:for-each>
                        </div>
                    </div>
                    <!-- Quatrième page -->
                    <div id="c2p4" class="container">
                        <xsl:attribute name="style">
                            <xsl:value-of select="$div_css"/>
                        </xsl:attribute>
                        <div class="image">
                            <a href="./img/MC-ET-IV-573(4).jpg" target="_blank">
                                <img src="./img/MC-ET-IV-573(4).jpg" alt="MC-ET-IV-573(3)"/>
                            </a>
                        </div>
                        <div class="text" style="text-align:justify">
                            <xsl:for-each select="(//TEI[3]//l)[position() &gt;= 81 and position() &lt;= 106]">
                                <p>[<xsl:number level="any" count="(//TEI[3]//l)" format="1"/>]
                                    <xsl:text> </xsl:text>
                                    <xsl:apply-templates select="node()"/>
                                </p>
                            </xsl:for-each>
                            <br/>
                            <xsl:for-each select="//TEI[3]//div[@type='signatures']/*">
                                <p>
                                    <xsl:apply-templates select="node()"/>
                                </p>
                            </xsl:for-each>
                        </div>
                    </div>
                    <!-- Liens et footer -->
                    <div>
                        <p><a href="./{$facs_1}">Fac-similé 1</a> – <a href="./{$facs_2}">Fac-similé 2</a> – <a href="./{$facs_3}">Fac-similé 3</a> – <a href="./{$tableau}">Tableau</a></p>

                    </div>
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <!-- Template pour les éléments supprimés et incertant dans les fac-similés -->
    
    <xsl:template match="del">
        <del>
            <xsl:apply-templates/>
        </del>
    </xsl:template>
    
    <xsl:template match="unclear">
        <xsl:text>[</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>]</xsl:text>
    </xsl:template>
</xsl:stylesheet>
