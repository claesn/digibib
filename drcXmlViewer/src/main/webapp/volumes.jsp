<%@ page pageEncoding="utf-8"%>
<%@ page import="java.util.List"%>
<%
	List<String> volumes = (List<String>) request
			.getAttribute("volumes");
%>

<jsp:include page="/modules/htmlhead.jsp" />

<body>
	<div id="top">
		<jsp:include page="/modules/drc_header_small.jsp" />
	</div>

	<!-- RECOMMENDED if your web app will not function without JavaScript enabled -->
	<noscript>
		<div
			style="width: 22em; position: absolute; left: 50%; margin-left: -11em; color: red; background-color: white; border: 1px solid red; padding: 4px; font-family: sans-serif">
			Your web browser must have JavaScript enabled in order for this
			application to display correctly.</div>
	</noscript>

	<div class="container-fluid">

		<div class="row-fluid">
			<div class="page-header text-center">
				<h1>
					<a style="color: black;" href="/drc">Crestomazia Retoromontscha
						<small>Caspar Decurtins</small>
					</a>
				</h1>
			</div>
		</div>
		<div class="row-fluid">
			<div class="span12"></div>
		</div>

		<div class="row-fluid">
			<div class="span3 well">

				<ul class="nav nav-list">
					<li class="nav-header">Wählen Sie einen Band:</li>

					<%
						for (String volume : volumes) {
					%>
					<li><a href="/volumeSelected?volume=<%=volume%>"> <%=volume%>
					</a></li>
					<%
						}
					%>
				</ul>
				<legend></legend>
				<p>
					<a class="btn" href="/">Zurück zur Übersicht</a>
				</p>
			</div>
			<div class="span6 lead text-left">
				<p align="center">
					<img src="images/494px-Decurtins_Caspar.jpg" class="img-rounded"
						width="30%">
				</p>
				<!-- 
				Blättern Sie hier durch die Rätoromanische Chrestomathie von Caspar
				Decurtins, die im Rahmen des Projekts <a
					href="http://www.crestomazia.ch">Digitale Rätoromanische
					Chrestomathie</a> (DRC) digitalisiert und unter Mithilfe von
				Freiwilligen korrigiert wurde.
				<p>Die Bandbezeichnungen folgen der Ausgabe in der Zeitschrift
					"Romanische Forschungen". Benennungen und Paginierung gemäß des
					Reprints des Octopus Verlags folgen in Kürze.
					 -->
				<p>La Crestomazia Retoromontscha ei la raccolta da texts la pli
					impurtonta e la pli gronda dils Romontschs. Ella ensiara sin pli
					che 7000 paginas differents geners da texts: raquents,
					tschentaments da vischnaunca, poesias, dramas, scartiras
					religiusas, versets d’affons, legns, praulas, legendas, detgas,
					giugs dalla Passiun ed aunc ulteriurs geners. Quels texts
					representan 4 tschentaners, tut ils idioms en ortografias fetg
					differentas. Tut quels texts stattan a disposiziun cheu sin
					www.biblioteca-digitala.ch a scadin interessent sco texts cumpleins
					(modificabels). Quei vul dir, quels texts ein vegni legi dal
					computer cun OCR e vegni curregi. Els san vegnir exzerpai
					cumpleinamein cun agid dallas funcziuns da tscherca. In pulit
					diember da Romotschs ha procurau la correctura dils texts,
					oravontut Michele Badilatti. Senza siu engaschi enorm e sia
					cumpetenza havessen ils texts dalla Crestomazia buca saviu vegnir
					curregi en in temps aschi cuort. La pusseivladad da saver exzerpar
					electronicamein mintga singul plaid dalla Crestomazia ei da grond
					nez per tut ils Romontschs, romanists, historicists, ethnologs,
					theologs, anthropologs etc. Caspar Decurtins (1855-1916) ha rimnau
					sez sur ils cunfins indiomatics bia texts dalla Crestomazia e
					procurau ch’els vegnien edi. Denter 1891 e 1916 ha el possibilitau
					l’ediziun da buca meins che 13 toms. Suenter la mort da C.
					Decurtins ha Maria Decurtins-Geronimi, la dunna da C. Decurtins,
					procurau ensemen cun Cristian Caminada il tom 14 (Val Schons).
					Quella ovra monumentala ei cumparida naven da 1981 en la revista
					„Romanische Forschungen“ e naven da 1986 broschurada en la casa
					editura Jung ad Erlangen. Quella derasaziun dall’ovra ha buc
					cuntonschiu il pievel Romontsch da valer. Aschia ei la Crestomazia,
					igl element propi essenzial dalla „Renaschientscha Romontscha“ alla
					sava dil 20avel tschentar mai propi daventada populara. Perquei ha
					la Societad Retoromontscha all‘entschatta dils onns 80 sut l’egida
					da Gion Deplazes ughegiau da derasar danovamein la Crestomazia. En
					sia casa editura Octopus a Cuera ha Andreas Joos ediu quella gronda
					ovra danovamein, e quei en ina restampa facsimile sin fundament
					dalla ediziun d‘ Erlangen. Cun quella caschun ei vegniu aschuntau
					in register, il tom 15 ch’ei medemamein cumparius en la casa
					editura Octopus. Quei register ei vegnius cumpilaus da Peter Egloff
					e Jon Mathieu cun tutta precauziun e prudientscha. Els han elavurau
					registers da persunas, da loghens e da materias. Els han
					classificau ils texts dalla Crestomazia tenor motivs e cuntegn. Els
					han mess a liug ils texts pertuccont lur origin geografic e
					temporal e commentau ils texts davart genesa ed authenticitad.
					Entras il register ei la valeta dalla Crestomazia aunc s’augmentada
					considerablamein. Il register ensiara era l’historia dall genesa
					dalla Crestomazia e la biografia da siu autur. Ils differents toms
					dalla Crestomazia ein vegni edi egl interval da 25 onns, quei che
					ha giu per consequenza diversas midadas dils principis d’ediziun.
					Era quei ein ina raschun daco che la raccolta da texts semuossa al
					lectur a moda aschi heterogena.</p>
				<p>Caspar Decurtins, „il Liun da Trun“ ei naschius 1855 a Trun
					sco fegl d’in miedi e mistral. El ha absolviu ilg gimnasi a Mustér
					en claustra ed a Cuera. Silsuenter eis el serendius a Heidelberg,
					Minca e Strassburg per sededicar als studi dalla historiografia,
					dall’historia d’art e dil dretg public. Cun 22 onns eis el vegnius
					elegius mistral dalla Cadi (1877-1883) e commember dil Cussegl
					Grond ed ei staus da 1881-1905 cusseglier naziunal. Silsuenter eis
					el staus entochen 1913 professer d’historia culturala
					all’universitad da Friburg. Siu program politic ei stau dad ina
					vart ina risposta sin il cumbat cultural dils liberals radicals e
					da l’autra vart ina risposta sil cumbat dallas classas dils
					socialdemocrats da gliez temps. El ha cussegliau Papa Leo XIII, cu
					lez ha elaborau la ductrina sociala catolica en l’Enziclica Rerum
					Novarum. Decurtins ei staus confundatur dall’universitad da
					Friburg, ha iniziau la retscha „Nies Tschespet“ ed „Igl Ischi“ ed
					ei era staus fundatur spirtal dalla Romania Studentica (Mira era
					Egloff, Peter / Mathieu , Jon: Rätoromanische Chrestomathie.
					Begründet von Caspar Decurtins, Bd. 15: Register, Chur 1986).</p>
				<p></p>
				<p>Jürgen Rolshoven e Florentin Lutz</p>
			</div>

			<!-- 
			<div class="span3">
				<legend> Hinweise: </legend>
				<p>
					Die Rätoromanische Chrestomathie wurde im Rahmen des Projekts <a
						href="http://www.crestomazia.ch">Digitale Rätoromanische
						Chrestomathie</a> (DRC) digitalisiert und unter Mithilfe von
					Freiwilligen korrigiert. Die Bandbezeichnungen folgen der Ausgabe
					in der Zeitschrift "Romanische Forschungen". Benennungen und
					Paginierung gemäß des Reprints des Octopus Verlags folgen in Kürze.
				</p>
			</div>
 -->

			</ div>
		</div>
</body>
</html>
