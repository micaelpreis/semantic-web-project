<html>
	<head>
		<meta charset="UTF-8">
		<title>WS Project</title>
		<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/skeleton/2.0.4/skeleton.min.css">
		<link rel="stylesheet" type="text/css" href="css/style.css" />
 		<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
 		<script src="http://code.jquery.com/jquery-latest.js" type="text/javascript"></script>
	</head>
	<body>
		<%@page import="beans.*,entities.*,java.util.ArrayList" pageEncoding="UTF-8"%>
		<%
		    SearchBean bean = new SearchBean();
			String search = "", section = "", subsection = "", author = "", tagSub = "", tagOrg = "", tagPer = "", tagLoc = "";
			search = request.getParameter("search");
			section = request.getParameter("section");
			subsection = request.getParameter("subsection");
			author = request.getParameter("author");
			tagSub = request.getParameter("tagSub");
			tagOrg = request.getParameter("tagOrg");
			tagPer = request.getParameter("tagPer");
			tagLoc = request.getParameter("tagLoc");
			if(search==null) { search = ""; }
			if(section==null) { section = ""; }
			else { bean.addToHistory(section); }
			if(subsection==null) { subsection = ""; }
			if(author==null) { author = ""; }
			if(tagSub==null) { tagSub = ""; }
			if(tagOrg==null) { tagOrg = ""; }
			if(tagPer==null) { tagPer = ""; }
			if(tagLoc==null) { tagLoc = ""; }
			ArrayList <Article> articles = bean.getArticles(search, section, subsection, author, tagSub, tagOrg, tagPer, tagLoc);
			// ArrayList <Article> articlesRec = bean.getArticles("", "", "", "", "", "", "", "");
			ArrayList <Article> articlesRec = bean.getRecommendation();
			int number_articles = articles.size();
		%>
		<header>
			<div class="header-right">
				<form action="index.jsp" method="GET">
					<input type="text" name="search" width="60" placeholder="Search" >
					<input type="submit" value="Search" width="60">
				</form>
			</div>
			<div class="header-center">
				<a href="index.jsp" style="margin-right: 30px;">The New York Times Top Stories</a>
				<br>
				<div class="topics">
					<form class="topics" name="topicArts" action="index.jsp" method="GET">
					    <a id="topicArts">
					        <input type="text" name="section" style="display:none" value="Arts">
					        Arts
					    </a>
					</form>
					<form class="topics" name="topicBusiness" action="index.jsp" method="GET">
					    <a id="topicBusiness">
					        <input type="text" name="section" style="display:none" value="Business Day">
					        Business
					    </a>
					</form>
					<form class="topics" name="topicFashion" action="index.jsp" method="GET">
					    <a id="topicFashion">
					        <input type="text" name="section" style="display:none" value="Fashion & Style">
					        Fashion
					    </a>
					</form>
					<form class="topics" name="topicFood" action="index.jsp" method="GET">
					    <a id="topicFood">
					        <input type="text" name="section" style="display:none" value="Food">
					        Food
					    </a>
					</form>
					<form class="topics" name="topicHealth" action="index.jsp" method="GET">
					    <a id="topicHealth">
					        <input type="text" name="section" style="display:none" value="Health">
					        Health
					    </a>
					</form>
					<form class="topics" name="topicMagazine" action="index.jsp" method="GET">
					    <a id="topicMagazine">
					        <input type="text" name="section" style="display:none" value="Magazine">
					        Magazine
					    </a>
					</form>
					<form class="topics" name="topicMovies" action="index.jsp" method="GET">
					    <a id="topicMovies">
					        <input type="text" name="section" style="display:none" value="Movies">
					        Movies
					    </a>
					</form>
					<form class="topics" name="topicNY" action="index.jsp" method="GET">
					    <a id="topicNY">
					        <input type="text" name="section" style="display:none" value="N.Y. / Region">
					        NY Region
					    </a>
					</form>
					<form class="topics" name="topicOpinion" action="index.jsp" method="GET">
					    <a id="topicOpinion">
					        <input type="text" name="section" style="display:none" value="Opinion">
					        Opinion
					    </a>
					</form>
					<form class="topics" name="topicReal" action="index.jsp" method="GET">
					    <a id="topicReal">
					        <input type="text" name="section" style="display:none" value="Real Estate">
					        Real Estate
					    </a>
					</form>
					<form class="topics" name="topicSports" action="index.jsp" method="GET">
					    <a id="topicSports">
					        <input type="text" name="section" style="display:none" value="Sports">
					        Sports
					    </a>
					</form>
					<form class="topics" name="topicTechnology" action="index.jsp" method="GET">
					    <a id="topicTechnology">
					        <input type="text" name="section" style="display:none" value="Technology">
					        Technology
					    </a>
					</form>
					<form class="topics" name="topicTravel" action="index.jsp" method="GET">
					    <a id="topicTravel">
					        <input type="text" name="section" style="display:none" value="Travel">
					        Travel
					    </a>
					</form>
					<form class="topics" name="topicUS" action="index.jsp" method="GET">
					    <a id="topicUS">
					        <input type="text" name="section" style="display:none" value="U.S.">
					        U.S.
					    </a>
					</form>
					<form class="topics" name="topicWorld" action="index.jsp" method="GET">
					    <a id="topicWorld">
					        <input type="text" name="section" style="display:none" value="World">
					        World
					    </a>
					</form>
				</div>
			</div>
		</header>

		<%
			// First Article
			if (number_articles == 0) {
				out.println(
					"<div class = \"nothing\">" +
						"<br>" + "<br>" + "<br>" +
						"<p>Sorry!</p>" +
						"<p>We couldn't find articles for your search</p>" +
					"</div>" +
					"<br>" + "<br>" + "<br>" + "<br>" + "<br>" + "<br>"
				);
			}
			else {
				out.println(
					"<div class=\"row\">" +
						"<div class=\"six columns\">" +
							"<div class=\"news-top\">" +
								"<div class=\"news-img\">" +
									"<img src=\"" + articles.get(0).getImage() + "\">" +
								"</div>" +
							"</div>" +
						"</div>" +
						"<div class=\"six columns\">" +
							"<div class=\"news-top\">" +
								"<div class=\"news-section\">" +
									"<strong>" +
										"<form class=\"forms\" name=\"section0\"action=\"index.jsp\" method=\"GET\">" +
											"<a href=\"javascript: submitSection(0)\">" +
												"<input type=\"text\" name=\"section\" style=\"display:none\" value="+ "\'" + articles.get(0).getSection() + "\'" + ">" +
												articles.get(0).getSection() +
											"</a>" +
										"</form>" +
										" &nbsp > &nbsp " +
										"<form class=\"forms\" name=\"subsection0\"action=\"index.jsp\" method=\"GET\">" +
											"<a href=\"javascript: submitSubsection(0)\">" +
												"<input type=\"text\" name=\"subsection\" style=\"display:none\" value="+ "\'" + articles.get(0).getSubsection() + "\'" + ">" +
												articles.get(0).getSubsection() +
											"</a>" +
										"</form>" +
									"</strong>" +
								"</div>" +
								"<div class=\"news-title-top\">" +
									articles.get(0).getTitle() +
								"</div>" +
								"<div class=\"news-subtitle-top\">" +
									articles.get(0).getAbstract_() +
									"<br>" + "<br>" +
									"<strong>" +
										"By " +
									"</strong>" +
									"<form class=\"forms\" name=\"author0\"action=\"index.jsp\" method=\"GET\">" +
										"<a href=\"javascript: submitAuthor(0)\">" +
											"<input type=\"text\" name=\"author\" style=\"display:none\" value="+ "\'" + articles.get(0).getAuthor() + "\'" + ">" +
											articles.get(0).getAuthor() +
										"</a>" +
									"</form>" +
									"<br>" + "<br>" +
									"<span>" +
										"<strong>" +
											"Tags: " +
										"</strong>" );
										if(articles.get(0).getSubjects_description()!=null) {
											for (int i=0;i<articles.get(0).getSubjects_description().size();i++) {
												out.println(
													"<form class=\"forms\" name=\"tagSub"+i+"\"action=\"index.jsp\" method=\"GET\">" +
														"<a href=\"javascript: submitTagSub("+i+")\">" +
															"<input type=\"text\" name=\"tagSub\" style=\"display:none\" value="+ "\'" + articles.get(0).getSubjects_description().get(i) + "\'" + ">#" +
															articles.get(0).getSubjects_description().get(i).replaceAll(" ","") +
														"</a>" +
													"</form>"
												);
											}
										}
										if(articles.get(0).getOrganizations()!=null) {
											for (int i=0;i<articles.get(0).getOrganizations().size();i++) {
												out.println(
													"<form class=\"forms\" name=\"tagOrg"+i+"\"action=\"index.jsp\" method=\"GET\">" +
														"<a href=\"javascript: submitTagOrg("+i+")\">" +
															"<input type=\"text\" name=\"tagOrg\" style=\"display:none\" value="+ "\'" + articles.get(0).getOrganizations().get(i) + "\'" + ">#" +
															articles.get(0).getOrganizations().get(i).replaceAll(" ","") +
														"</a>" +
													"</form>"
												);
											}
										}
										if(articles.get(0).getPersons()!=null) {
											for (int i=0;i<articles.get(0).getPersons().size();i++) {
												out.println(
													"<form class=\"forms\" name=\"tagPer"+i+"\"action=\"index.jsp\" method=\"GET\">" +
														"<a href=\"javascript: submitTagPer("+i+")\">" +
															"<input type=\"text\" name=\"tagPer\" style=\"display:none\" value="+ "\'" + articles.get(0).getPersons().get(i) + "\'" + ">#" +
															articles.get(0).getPersons().get(i).replaceAll(" ","") +
														"</a>" +
													"</form>"
												);
											}
										}
										if(articles.get(0).getLocations()!=null) {
											for (int i=0;i<articles.get(0).getLocations().size();i++) {
												out.println(
													"<form class=\"forms\" name=\"tagLoc"+i+"\"action=\"index.jsp\" method=\"GET\">" +
														"<a href=\"javascript: submitTagLoc("+i+")\">" +
															"<input type=\"text\" name=\"tagLoc\" style=\"display:none\" value="+ "\'" + articles.get(0).getLocations().get(i) + "\'" + ">#" +
															articles.get(0).getLocations().get(i).replaceAll(" ","") +
														"</a>" +
													"</form>"
												);
											}
										}
									out.println(
									"</span>" +
									"<br>" + "<br>" +
									"<strong>" +
										"Published Date: " +
									"</strong>" +
										articles.get(0).getPublished_date().substring(0,10) +
									"<br>" + "<br>" +
									"<span>" +
										"<a href=\"" + articles.get(0).getUrl() + "\">Visit Article &#8594;</a>" +
									"</span>" +
								"</div>" +
							"</div>" +
						"</div>" +
					"</div>"
				);
			}

			// Recomendations
			out.println(
				"<hr>" +
				"<span class=\"separator\">" +
				    "Recommendations" +
				"</span>"
				// Show articles by author and sections
			);
			out.println(
				"<div class=\"row\">" +
					"<div class=\"two columns\">" +
						"<div id=\"recommendation\" class=\"recommendation closed\">" +
							"<div class=\"news-section-small\">" +
								"<strong>" +
									"<form class=\"forms\" name=\"section0\"action=\"index.jsp\" method=\"GET\">" +
                                        "<a href=\"javascript: submitSection(0)\">" +
                                            "<input type=\"text\" name=\"section\" style=\"display:none\" value=\'" + articlesRec.get(0).getSection() + "\'>" +
                                            articlesRec.get(0).getSection() +
                                        "</a>" +
                                    "</form>" +
                                    " &nbsp > &nbsp " +
                                    "<form class=\"forms\" name=\"subsection0\"action=\"index.jsp\" method=\"GET\">" +
                                        "<a href=\"javascript: submitSubsection(0)\">" +
                                            "<input type=\"text\" name=\"subsection\" style=\"display:none\" value=\'" + articlesRec.get(0).getSubsection() + "\'" + ">" +
                                            articlesRec.get(0).getSubsection() +
                                        "</a>" +
                                    "</form>" +
								"</strong>" +
							"</div>" +
							"<div class=\"news-title-small\" onclick=\"toggleRec();return false;\">" +
								articlesRec.get(0).getTitle() +
							"</div>" +
							"<div class=\"slider closed news-subtitle-small\" id=\"sliderR1\">" +
								articlesRec.get(0).getAbstract_() +
								"<br>" + "<br>" +
								"<strong>" +
									"By " +
								"</strong>" +
								"<form class=\"forms\" name=\"author0\"action=\"index.jsp\" method=\"GET\">" +
                                    "<a href=\"javascript: submitAuthor(0)\">" +
                                        "<input type=\"text\" name=\"author\" style=\"display:none\" value=\'" + articlesRec.get(0).getAuthor() + "\'" + ">" +
                                        articlesRec.get(0).getAuthor() +
                                    "</a>" +
                                "</form>" +
								"<br>" + "<br>" +
								"<span>" +
									"<strong>" +
										"Tags: " +
									"</strong>" );
									if(articlesRec.get(0).getSubjects_description()!=null) {
										for (int i=0;i<articlesRec.get(0).getSubjects_description().size();i++) {
											out.println(
												"<form class=\"forms\" name=\"tagSub0"+i+"\"action=\"index.jsp\" method=\"GET\">" +
                                                    "<a href=\"javascript: submitTagSub(0"+i+")\">" +
                                                        "<input type=\"text\" name=\"tagSub\" style=\"display:none\" value=\'" + articlesRec.get(0).getSubjects_description().get(i) + "\'" + ">#" +
                                                        articlesRec.get(0).getSubjects_description().get(i).replaceAll(" ","") +
                                                    "</a>" +
                                                "</form>"
											);
										}
									}
									if(articlesRec.get(0).getOrganizations()!=null) {
										for (int i=0;i<articlesRec.get(0).getOrganizations().size();i++) {
											out.println(
												"<form class=\"forms\" name=\"tagOrg0"+i+"\"action=\"index.jsp\" method=\"GET\">" +
                                                    "<a href=\"javascript: submitTagOrg(0"+i+")\">" +
                                                        "<input type=\"text\" name=\"tagOrg\" style=\"display:none\" value=\'" + articlesRec.get(0).getOrganizations().get(i) + "\'" + ">#" +
                                                        articlesRec.get(0).getOrganizations().get(i).replaceAll(" ","") +
                                                    "</a>" +
                                                "</form>"
											);
										}
									}
									if(articlesRec.get(0).getPersons()!=null) {
										for (int i=0;i<articlesRec.get(0).getPersons().size();i++) {
											out.println(
												"<form class=\"forms\" name=\"tagPer0"+i+"\"action=\"index.jsp\" method=\"GET\">" +
                                                    "<a href=\"javascript: submitTagPer(0"+i+")\">" +
                                                        "<input type=\"text\" name=\"tagPer\" style=\"display:none\" value=\'" + articlesRec.get(0).getPersons().get(i) + "\'" + ">#" +
                                                        articlesRec.get(0).getPersons().get(i).replaceAll(" ","") +
                                                    "</a>" +
                                                "</form>"
											);
										}
									}
									if(articlesRec.get(0).getLocations()!=null) {
										for (int i=0;i<articlesRec.get(0).getLocations().size();i++) {
											out.println(
												"<form class=\"forms\" name=\"tagLoc0"+i+"\"action=\"index.jsp\" method=\"GET\">" +
                                                    "<a href=\"javascript: submitTagLoc(0"+i+")\">" +
                                                        "<input type=\"text\" name=\"tagLoc\" style=\"display:none\" value=\'" + articlesRec.get(0).getLocations().get(i) + "\'" + ">#" +
                                                        articlesRec.get(0).getLocations().get(i).replaceAll(" ","") +
                                                    "</a>" +
                                                "</form>"
											);
										}
									}
								out.println(
								"</span>" +
								"<br>" +"<br>" +
								"<strong>" +
									"Published Date: " +
								"</strong>" +
									articlesRec.get(0).getPublished_date().substring(0,10) +
								"<br>" + "<br>" +
								"<span>" +
								"<a href=\"" + articlesRec.get(0).getUrl() + "\">Visit Article &#8594;</a>" +
								"</span>" +
								"<br>" + "<br>" +
							"</div>" +
						"</div>" +
					"</div>" +
					"<div class=\"two columns\">" +
						"<div id=\"recommendation\" class=\"recommendation closed\">" +
							"<div class=\"news-section-small\">" +
								"<strong>" +
									"<form class=\"forms\" name=\"section1\"action=\"index.jsp\" method=\"GET\">" +
                                        "<a href=\"javascript: submitSection(1)\">" +
                                            "<input type=\"text\" name=\"section\" style=\"display:none\" value="+ "\'" + articlesRec.get(1).getSection() + "\'" + ">" +
                                            articlesRec.get(1).getSection() +
                                        "</a>" +
                                    "</form>" +
                                    " &nbsp > &nbsp " +
                                    "<form class=\"forms\" name=\"subsection1\"action=\"index.jsp\" method=\"GET\">" +
                                        "<a href=\"javascript: submitSubsection(1)\">" +
                                            "<input type=\"text\" name=\"subsection\" style=\"display:none\" value="+ "\'" + articlesRec.get(1).getSubsection() + "\'" + ">" +
                                            articlesRec.get(1).getSubsection() +
                                        "</a>" +
                                    "</form>" +
								"</strong>" +
							"</div>" +
							"<div class=\"news-title-small\" onclick=\"toggleRec();return false;\">" +
								articlesRec.get(1).getTitle() +
							"</div>" +
							"<div class=\"slider closed news-subtitle-small\" id=\"sliderR2\">" +
								articlesRec.get(1).getAbstract_() +
								"<br>" + "<br>" +
								"<strong>" +
									"By " +
								"</strong>" +
								"<form class=\"forms\" name=\"author1\"action=\"index.jsp\" method=\"GET\">" +
                                    "<a href=\"javascript: submitAuthor(1)\">" +
                                        "<input type=\"text\" name=\"author\" style=\"display:none\" value=\'" + articlesRec.get(1).getAuthor() + "\'" + ">" +
                                        articlesRec.get(1).getAuthor() +
                                    "</a>" +
                                "</form>" +
								"<br>" + "<br>" +
								"<span>" +
									"<strong>" +
										"Tags: " +
									"</strong>" );
									if(articlesRec.get(1).getSubjects_description()!=null) {
										for (int i=0;i<articlesRec.get(1).getSubjects_description().size();i++) {
											out.println(
												"<form class=\"forms\" name=\"tagSub1"+i+"\"action=\"index.jsp\" method=\"GET\">" +
                                                    "<a href=\"javascript: submitTagSub(1"+i+")\">" +
                                                        "<input type=\"text\" name=\"tagSub\" style=\"display:none\" value=\'" + articlesRec.get(1).getSubjects_description().get(i) + "\'" + ">#" +
                                                        articlesRec.get(1).getSubjects_description().get(i).replaceAll(" ","") +
                                                    "</a>" +
                                                "</form>"
											);
										}
									}
									if(articlesRec.get(1).getOrganizations()!=null) {
										for (int i=0;i<articlesRec.get(1).getOrganizations().size();i++) {
											out.println(
												"<form class=\"forms\" name=\"tagOrg1"+i+"\"action=\"index.jsp\" method=\"GET\">" +
                                                    "<a href=\"javascript: submitTagOrg(1"+i+")\">" +
                                                        "<input type=\"text\" name=\"tagOrg\" style=\"display:none\" value=\'" + articlesRec.get(1).getOrganizations().get(i) + "\'" + ">#" +
                                                        articlesRec.get(1).getOrganizations().get(i).replaceAll(" ","") +
                                                    "</a>" +
                                                "</form>"
											);
										}
									}
									if(articlesRec.get(1).getPersons()!=null) {
										for (int i=0;i<articlesRec.get(1).getPersons().size();i++) {
											out.println(
												"<form class=\"forms\" name=\"tagPer1"+i+"\"action=\"index.jsp\" method=\"GET\">" +
                                                    "<a href=\"javascript: submitTagPer(1"+i+")\">" +
                                                        "<input type=\"text\" name=\"tagPer\" style=\"display:none\" value=\'" + articlesRec.get(1).getPersons().get(i) + "\'" + ">#" +
                                                        articlesRec.get(1).getPersons().get(i).replaceAll(" ","") +
                                                    "</a>" +
                                                "</form>"
											);
										}
									}
									if(articlesRec.get(1).getLocations()!=null) {
										for (int i=0;i<articlesRec.get(1).getLocations().size();i++) {
											out.println(
												"<form class=\"forms\" name=\"tagLoc1"+i+"\"action=\"index.jsp\" method=\"GET\">" +
                                                    "<a href=\"javascript: submitTagLoc(1"+i+")\">" +
                                                        "<input type=\"text\" name=\"tagLoc\" style=\"display:none\" value=\'" + articlesRec.get(1).getLocations().get(i) + "\'" + ">#" +
                                                        articlesRec.get(1).getLocations().get(i).replaceAll(" ","") +
                                                    "</a>" +
                                                "</form>"
											);
										}
									}
								out.println(
								"</span>" +
								"<br>" +"<br>" +
								"<strong>" +
									"Published Date: " +
								"</strong>" +
									articlesRec.get(1).getPublished_date().substring(0,10) +
								"<br>" + "<br>" +
								"<span>" +
								"<a href=\"" + articlesRec.get(1).getUrl() + "\">Visit Article &#8594;</a>" +
								"</span>" +
								"<br>" + "<br>" +
							"</div>" +
						"</div>" +
					"</div>" +
					"<div class=\"two columns\">" +
						"<div id=\"recommendation\" class=\"recommendation closed\">" +
							"<div class=\"news-section-small\">" +
								"<strong>" +
									"<form class=\"forms\" name=\"section2\"action=\"index.jsp\" method=\"GET\">" +
                                        "<a href=\"javascript: submitSection(2)\">" +
                                            "<input type=\"text\" name=\"section\" style=\"display:none\" value="+ "\'" + articlesRec.get(2).getSection() + "\'" + ">" +
                                            articlesRec.get(2).getSection() +
                                        "</a>" +
                                    "</form>" +
                                    " &nbsp > &nbsp " +
                                    "<form class=\"forms\" name=\"subsection2\"action=\"index.jsp\" method=\"GET\">" +
                                        "<a href=\"javascript: submitSubsection(2)\">" +
                                            "<input type=\"text\" name=\"subsection\" style=\"display:none\" value="+ "\'" + articlesRec.get(2).getSubsection() + "\'" + ">" +
                                            articlesRec.get(2).getSubsection() +
                                        "</a>" +
                                    "</form>" +
								"</strong>" +
							"</div>" +
							"<div class=\"news-title-small\" onclick=\"toggleRec();return false;\">" +
								articlesRec.get(2).getTitle() +
							"</div>" +
							"<div class=\"slider closed news-subtitle-small\" id=\"sliderR3\">" +
								articlesRec.get(2).getAbstract_() +
								"<br>" + "<br>" +
								"<strong>" +
									"By " +
								"</strong>" +
								"<form class=\"forms\" name=\"author2\"action=\"index.jsp\" method=\"GET\">" +
                                    "<a href=\"javascript: submitAuthor(2)\">" +
                                        "<input type=\"text\" name=\"author\" style=\"display:none\" value=\'" + articlesRec.get(2).getAuthor() + "\'" + ">" +
                                        articlesRec.get(2).getAuthor() +
                                    "</a>" +
                                "</form>" +
								"<br>" + "<br>" +
								"<span>" +
									"<strong>" +
										"Tags: " +
									"</strong>" );
									if(articlesRec.get(2).getSubjects_description()!=null) {
										for (int i=0;i<articlesRec.get(2).getSubjects_description().size();i++) {
											out.println(
												"<form class=\"forms\" name=\"tagSub2"+i+"\"action=\"index.jsp\" method=\"GET\">" +
                                                    "<a href=\"javascript: submitTagSub(2"+i+")\">" +
                                                        "<input type=\"text\" name=\"tagSub\" style=\"display:none\" value=\'" + articlesRec.get(2).getSubjects_description().get(i) + "\'" + ">#" +
                                                        articlesRec.get(2).getSubjects_description().get(i).replaceAll(" ","") +
                                                    "</a>" +
                                                "</form>"
											);
										}
									}
									if(articlesRec.get(2).getOrganizations()!=null) {
										for (int i=0;i<articlesRec.get(2).getOrganizations().size();i++) {
											out.println(
												"<form class=\"forms\" name=\"tagOrg2"+i+"\"action=\"index.jsp\" method=\"GET\">" +
                                                    "<a href=\"javascript: submitTagOrg(2"+i+")\">" +
                                                        "<input type=\"text\" name=\"tagOrg\" style=\"display:none\" value=\'" + articlesRec.get(2).getOrganizations().get(i) + "\'" + ">#" +
                                                        articlesRec.get(2).getOrganizations().get(i).replaceAll(" ","") +
                                                    "</a>" +
                                                "</form>"
											);
										}
									}
									if(articlesRec.get(2).getPersons()!=null) {
										for (int i=0;i<articlesRec.get(2).getPersons().size();i++) {
											out.println(
												"<form class=\"forms\" name=\"tagPer2"+i+"\"action=\"index.jsp\" method=\"GET\">" +
                                                    "<a href=\"javascript: submitTagPer(2"+i+")\">" +
                                                        "<input type=\"text\" name=\"tagPer\" style=\"display:none\" value=\'" + articlesRec.get(2).getPersons().get(i) + "\'" + ">#" +
                                                        articlesRec.get(2).getPersons().get(i).replaceAll(" ","") +
                                                    "</a>" +
                                                "</form>"
											);
										}
									}
									if(articlesRec.get(2).getLocations()!=null) {
										for (int i=0;i<articlesRec.get(2).getLocations().size();i++) {
											out.println(
												"<form class=\"forms\" name=\"tagLoc2"+i+"\"action=\"index.jsp\" method=\"GET\">" +
                                                    "<a href=\"javascript: submitTagLoc(2"+i+")\">" +
                                                        "<input type=\"text\" name=\"tagLoc\" style=\"display:none\" value=\'" + articlesRec.get(2).getLocations().get(i) + "\'" + ">#" +
                                                        articlesRec.get(2).getLocations().get(i).replaceAll(" ","") +
                                                    "</a>" +
                                                "</form>"
											);
										}
									}
								out.println(
								"</span>" +
								"<br>" +"<br>" +
								"<strong>" +
									"Published Date: " +
								"</strong>" +
									articlesRec.get(2).getPublished_date().substring(0,10) +
								"<br>" + "<br>" +
								"<span>" +
								"<a href=\"" + articlesRec.get(2).getUrl() + "\">Visit Article &#8594;</a>" +
								"</span>" +
								"<br>" + "<br>" +
							"</div>" +
						"</div>" +
					"</div>" +
					"<div class=\"two columns\">" +
						"<div id=\"recommendation\" class=\"recommendation closed\">" +
							"<div class=\"news-section-small\">" +
								"<strong>" +
									"<form class=\"forms\" name=\"section3\"action=\"index.jsp\" method=\"GET\">" +
                                        "<a href=\"javascript: submitSection(3)\">" +
                                            "<input type=\"text\" name=\"section\" style=\"display:none\" value="+ "\'" + articlesRec.get(3).getSection() + "\'" + ">" +
                                            articlesRec.get(3).getSection() +
                                        "</a>" +
                                    "</form>" +
                                    " &nbsp > &nbsp " +
                                    "<form class=\"forms\" name=\"subsection3\"action=\"index.jsp\" method=\"GET\">" +
                                        "<a href=\"javascript: submitSubsection(3)\">" +
                                            "<input type=\"text\" name=\"subsection\" style=\"display:none\" value="+ "\'" + articlesRec.get(3).getSubsection() + "\'" + ">" +
                                            articlesRec.get(3).getSubsection() +
                                        "</a>" +
                                    "</form>" +
								"</strong>" +
							"</div>" +
							"<div class=\"news-title-small\" onclick=\"toggleRec();return false;\">" +
								articlesRec.get(3).getTitle() +
							"</div>" +
							"<div class=\"slider closed news-subtitle-small\" id=\"sliderR4\">" +
								articlesRec.get(3).getAbstract_() +
								"<br>" + "<br>" +
								"<strong>" +
									"By " +
								"</strong>" +
								"<form class=\"forms\" name=\"author3\"action=\"index.jsp\" method=\"GET\">" +
                                    "<a href=\"javascript: submitAuthor(3)\">" +
                                        "<input type=\"text\" name=\"author\" style=\"display:none\" value=\'" + articlesRec.get(3).getAuthor() + "\'" + ">" +
                                        articlesRec.get(3).getAuthor() +
                                    "</a>" +
                                "</form>" +
								"<br>" + "<br>" +
								"<span>" +
									"<strong>" +
										"Tags: " +
									"</strong>" );
									if(articlesRec.get(3).getSubjects_description()!=null) {
										for (int i=0;i<articlesRec.get(3).getSubjects_description().size();i++) {
											out.println(
												"<form class=\"forms\" name=\"tagSub3"+i+"\"action=\"index.jsp\" method=\"GET\">" +
                                                    "<a href=\"javascript: submitTagSub(3"+i+")\">" +
                                                        "<input type=\"text\" name=\"tagSub\" style=\"display:none\" value=\'" + articlesRec.get(3).getSubjects_description().get(i) + "\'" + ">#" +
                                                        articlesRec.get(3).getSubjects_description().get(i).replaceAll(" ","") +
                                                    "</a>" +
                                                "</form>"
											);
										}
									}
									if(articlesRec.get(3).getOrganizations()!=null) {
										for (int i=0;i<articlesRec.get(3).getOrganizations().size();i++) {
											out.println(
												"<form class=\"forms\" name=\"tagOrg3"+i+"\"action=\"index.jsp\" method=\"GET\">" +
                                                    "<a href=\"javascript: submitTagOrg(3"+i+")\">" +
                                                        "<input type=\"text\" name=\"tagOrg\" style=\"display:none\" value=\'" + articlesRec.get(3).getOrganizations().get(i) + "\'" + ">#" +
                                                        articlesRec.get(3).getOrganizations().get(i).replaceAll(" ","") +
                                                    "</a>" +
                                                "</form>"
											);
										}
									}
									if(articlesRec.get(3).getPersons()!=null) {
										for (int i=0;i<articlesRec.get(3).getPersons().size();i++) {
											out.println(
												"<form class=\"forms\" name=\"tagPer3"+i+"\"action=\"index.jsp\" method=\"GET\">" +
                                                    "<a href=\"javascript: submitTagPer(3"+i+")\">" +
                                                        "<input type=\"text\" name=\"tagPer\" style=\"display:none\" value=\'" + articlesRec.get(3).getPersons().get(i) + "\'" + ">#" +
                                                        articlesRec.get(3).getPersons().get(i).replaceAll(" ","") +
                                                    "</a>" +
                                                "</form>"
											);
										}
									}
									if(articlesRec.get(3).getLocations()!=null) {
										for (int i=0;i<articlesRec.get(3).getLocations().size();i++) {
											out.println(
												"<form class=\"forms\" name=\"tagLoc3"+i+"\"action=\"index.jsp\" method=\"GET\">" +
                                                    "<a href=\"javascript: submitTagLoc(3"+i+")\">" +
                                                        "<input type=\"text\" name=\"tagLoc\" style=\"display:none\" value=\'" + articlesRec.get(3).getLocations().get(i) + "\'" + ">#" +
                                                        articlesRec.get(3).getLocations().get(i).replaceAll(" ","") +
                                                    "</a>" +
                                                "</form>"
											);
										}
									}
								out.println(
								"</span>" +
								"<br>" +"<br>" +
								"<strong>" +
									"Published Date: " +
								"</strong>" +
									articlesRec.get(3).getPublished_date().substring(0,10) +
								"<br>" + "<br>" +
								"<span>" +
								"<a href=\"" + articlesRec.get(3).getUrl() + "\">Visit Article &#8594;</a>" +
								"</span>" +
								"<br>" + "<br>" +
							"</div>" +
						"</div>" +
					"</div>" +
					"<div class=\"two columns\">" +
						"<div id=\"recommendation\" class=\"recommendation closed\">" +
							"<div class=\"news-section-small\">" +
								"<strong>" +
									"<form class=\"forms\" name=\"section4\"action=\"index.jsp\" method=\"GET\">" +
                                        "<a href=\"javascript: submitSection(4)\">" +
                                            "<input type=\"text\" name=\"section\" style=\"display:none\" value="+ "\'" + articlesRec.get(4).getSection() + "\'" + ">" +
                                            articlesRec.get(4).getSection() +
                                        "</a>" +
                                    "</form>" +
                                    " &nbsp > &nbsp " +
                                    "<form class=\"forms\" name=\"subsection4\"action=\"index.jsp\" method=\"GET\">" +
                                        "<a href=\"javascript: submitSubsection(4)\">" +
                                            "<input type=\"text\" name=\"subsection\" style=\"display:none\" value="+ "\'" + articlesRec.get(4).getSubsection() + "\'" + ">" +
                                            articlesRec.get(4).getSubsection() +
                                        "</a>" +
                                    "</form>" +
								"</strong>" +
							"</div>" +
							"<div class=\"news-title-small\" onclick=\"toggleRec();return false;\">" +
								articlesRec.get(4).getTitle() +
							"</div>" +
							"<div class=\"slider closed news-subtitle-small\" id=\"sliderR5\">" +
								articlesRec.get(4).getAbstract_() +
								"<br>" + "<br>" +
								"<strong>" +
									"By " +
								"</strong>" +
								"<form class=\"forms\" name=\"author4\"action=\"index.jsp\" method=\"GET\">" +
                                    "<a href=\"javascript: submitAuthor(4)\">" +
                                        "<input type=\"text\" name=\"author\" style=\"display:none\" value=\'" + articlesRec.get(4).getAuthor() + "\'" + ">" +
                                        articlesRec.get(4).getAuthor() +
                                    "</a>" +
                                "</form>" +
								"<br>" + "<br>" +
								"<span>" +
									"<strong>" +
										"Tags: " +
									"</strong>" );
									if(articlesRec.get(4).getSubjects_description()!=null) {
										for (int i=0;i<articlesRec.get(4).getSubjects_description().size();i++) {
											out.println(
												"<form class=\"forms\" name=\"tagSub4"+i+"\"action=\"index.jsp\" method=\"GET\">" +
                                                    "<a href=\"javascript: submitTagSub(4"+i+")\">" +
                                                        "<input type=\"text\" name=\"tagSub\" style=\"display:none\" value=\'" + articlesRec.get(4).getSubjects_description().get(i) + "\'" + ">#" +
                                                        articlesRec.get(4).getSubjects_description().get(i).replaceAll(" ","") +
                                                    "</a>" +
                                                "</form>"
											);
										}
									}
									if(articlesRec.get(4).getOrganizations()!=null) {
										for (int i=0;i<articlesRec.get(4).getOrganizations().size();i++) {
											out.println(
												"<form class=\"forms\" name=\"tagOrg4"+i+"\"action=\"index.jsp\" method=\"GET\">" +
                                                    "<a href=\"javascript: submitTagOrg(4"+i+")\">" +
                                                        "<input type=\"text\" name=\"tagOrg\" style=\"display:none\" value=\'" + articlesRec.get(4).getOrganizations().get(i) + "\'" + ">#" +
                                                        articlesRec.get(4).getOrganizations().get(i).replaceAll(" ","") +
                                                    "</a>" +
                                                "</form>"
											);
										}
									}
									if(articlesRec.get(4).getPersons()!=null) {
										for (int i=0;i<articlesRec.get(4).getPersons().size();i++) {
											out.println(
												"<form class=\"forms\" name=\"tagPer4"+i+"\"action=\"index.jsp\" method=\"GET\">" +
                                                    "<a href=\"javascript: submitTagPer(4"+i+")\">" +
                                                        "<input type=\"text\" name=\"tagPer\" style=\"display:none\" value=\'" + articlesRec.get(4).getPersons().get(i) + "\'" + ">#" +
                                                        articlesRec.get(4).getPersons().get(i).replaceAll(" ","") +
                                                    "</a>" +
                                                "</form>"
											);
										}
									}
									if(articlesRec.get(4).getLocations()!=null) {
										for (int i=0;i<articlesRec.get(4).getLocations().size();i++) {
											out.println(
												"<form class=\"forms\" name=\"tagLoc4"+i+"\"action=\"index.jsp\" method=\"GET\">" +
                                                    "<a href=\"javascript: submitTagLoc(4"+i+")\">" +
                                                        "<input type=\"text\" name=\"tagLoc\" style=\"display:none\" value=\'" + articlesRec.get(4).getLocations().get(i) + "\'" + ">#" +
                                                        articlesRec.get(4).getLocations().get(i).replaceAll(" ","") +
                                                    "</a>" +
                                                "</form>"
											);
										}
									}
								out.println(
								"</span>" +
								"<br>" +"<br>" +
								"<strong>" +
									"Published Date: " +
								"</strong>" +
									articlesRec.get(4).getPublished_date().substring(0,10) +
								"<br>" + "<br>" +
								"<span>" +
								"<a href=\"" + articlesRec.get(4).getUrl() + "\">Visit Article &#8594;</a>" +
								"</span>" +
								"<br>" + "<br>" +
							"</div>" +
						"</div>" +
					"</div>" +
					"<div class=\"two columns\">" +
						"<div id=\"recommendation\" class=\"recommendation closed\">" +
							"<div class=\"news-section-small\">" +
								"<strong>" +
									"<form class=\"forms\" name=\"section5\"action=\"index.jsp\" method=\"GET\">" +
                                        "<a href=\"javascript: submitSection(5)\">" +
                                            "<input type=\"text\" name=\"section\" style=\"display:none\" value="+ "\'" + articlesRec.get(5).getSection() + "\'" + ">" +
                                            articlesRec.get(5).getSection() +
                                        "</a>" +
                                    "</form>" +
                                    " &nbsp > &nbsp " +
                                    "<form class=\"forms\" name=\"subsection5\"action=\"index.jsp\" method=\"GET\">" +
                                        "<a href=\"javascript: submitSubsection(5)\">" +
                                            "<input type=\"text\" name=\"subsection\" style=\"display:none\" value="+ "\'" + articlesRec.get(5).getSubsection() + "\'" + ">" +
                                            articlesRec.get(5).getSubsection() +
                                        "</a>" +
                                    "</form>" +
								"</strong>" +
							"</div>" +
							"<div class=\"news-title-small\" onclick=\"toggleRec();return false;\">" +
								articlesRec.get(5).getTitle() +
							"</div>" +
							"<div class=\"slider closed news-subtitle-small\" id=\"sliderR6\">" +
								articlesRec.get(5).getAbstract_() +
								"<br>" + "<br>" +
								"<strong>" +
									"By " +
								"</strong>" +
								"<form class=\"forms\" name=\"author5\"action=\"index.jsp\" method=\"GET\">" +
                                    "<a href=\"javascript: submitAuthor(5)\">" +
                                        "<input type=\"text\" name=\"author\" style=\"display:none\" value=\'" + articlesRec.get(5).getAuthor() + "\'" + ">" +
                                        articlesRec.get(5).getAuthor() +
                                    "</a>" +
                                "</form>" +
								"<br>" + "<br>" +
								"<span>" +
									"<strong>" +
										"Tags: " +
									"</strong>" );
									if(articlesRec.get(5).getSubjects_description()!=null) {
										for (int i=0;i<articlesRec.get(5).getSubjects_description().size();i++) {
											out.println(
												"<form class=\"forms\" name=\"tagSub5"+i+"\"action=\"index.jsp\" method=\"GET\">" +
                                                    "<a href=\"javascript: submitTagSub(5"+i+")\">" +
                                                        "<input type=\"text\" name=\"tagSub\" style=\"display:none\" value=\'" + articlesRec.get(5).getSubjects_description().get(i) + "\'" + ">#" +
                                                        articlesRec.get(5).getSubjects_description().get(i).replaceAll(" ","") +
                                                    "</a>" +
                                                "</form>"
											);
										}
									}
									if(articlesRec.get(5).getOrganizations()!=null) {
										for (int i=0;i<articlesRec.get(5).getOrganizations().size();i++) {
											out.println(
												"<form class=\"forms\" name=\"tagOrg5"+i+"\"action=\"index.jsp\" method=\"GET\">" +
                                                    "<a href=\"javascript: submitTagOrg(5"+i+")\">" +
                                                        "<input type=\"text\" name=\"tagOrg\" style=\"display:none\" value=\'" + articlesRec.get(5).getOrganizations().get(i) + "\'" + ">#" +
                                                        articlesRec.get(5).getOrganizations().get(i).replaceAll(" ","") +
                                                    "</a>" +
                                                "</form>"
											);
										}
									}
									if(articlesRec.get(5).getPersons()!=null) {
										for (int i=0;i<articlesRec.get(5).getPersons().size();i++) {
											out.println(
												"<form class=\"forms\" name=\"tagPer5"+i+"\"action=\"index.jsp\" method=\"GET\">" +
                                                    "<a href=\"javascript: submitTagPer(5"+i+")\">" +
                                                        "<input type=\"text\" name=\"tagPer\" style=\"display:none\" value=\'" + articlesRec.get(5).getPersons().get(i) + "\'" + ">#" +
                                                        articlesRec.get(5).getPersons().get(i).replaceAll(" ","") +
                                                    "</a>" +
                                                "</form>"
											);
										}
									}
									if(articlesRec.get(5).getLocations()!=null) {
										for (int i=0;i<articlesRec.get(5).getLocations().size();i++) {
											out.println(
												"<form class=\"forms\" name=\"tagLoc5"+i+"\"action=\"index.jsp\" method=\"GET\">" +
                                                    "<a href=\"javascript: submitTagLoc(5"+i+")\">" +
                                                        "<input type=\"text\" name=\"tagLoc\" style=\"display:none\" value=\'" + articlesRec.get(5).getLocations().get(i) + "\'" + ">#" +
                                                        articlesRec.get(5).getLocations().get(i).replaceAll(" ","") +
                                                    "</a>" +
                                                "</form>"
											);
										}
									}
								out.println(
								"</span>" +
								"<br>" +"<br>" +
								"<strong>" +
									"Published Date: " +
								"</strong>" +
									articlesRec.get(5).getPublished_date().substring(0,10) +
								"<br>" + "<br>" +
								"<span>" +
								"<a href=\"" + articlesRec.get(5).getUrl() + "\">Visit Article &#8594;</a>" +
								"</span>" +
								"<br>" + "<br>" +
							"</div>" +
						"</div>" +
					"</div>" +
				"</div> "
			);

			// Other Articles
			if (number_articles >= 3 ) {
				out.println(
					"<hr>" +
					"<span class=\"separator\">" +
					    "Articles" +
					"</span>"
				);
				out.println(
					"<div class=\"row\">" +
						"<div class=\"three columns\">" +
							"<div class=\"news-img news-top2\" >" +
								"<img src=\"" + articles.get(1).getImage() + "\">" +
							"</div>" +
						"</div>" +
						"<div class=\"three columns\">" +
							"<div class=\"news-top2\">" +
								"<div class=\"news-section\">" +
									"<strong>" +
										"<form class=\"forms\" name=\"section1\"action=\"index.jsp\" method=\"GET\">" +
										    "<a href=\"javascript: submitSection(1)\">" +
										        "<input type=\"text\" name=\"section\" style=\"display:none\" value="+ "\'" + articles.get(1).getSection() + "\'" + ">" +
										        articles.get(1).getSection() +
										    "</a>" +
										"</form>" +
										" &nbsp > &nbsp " +
										"<form class=\"forms\" name=\"subsection1\"action=\"index.jsp\" method=\"GET\">" +
										    "<a href=\"javascript: submitSubsection(1)\">" +
										        "<input type=\"text\" name=\"subsection\" style=\"display:none\" value="+ "\'" + articles.get(1).getSubsection() + "\'" + ">" +
										        articles.get(1).getSubsection() +
										    "</a>" +
										"</form>" +
									"</strong>" +
								"</div>" +
								"<div class=\"news-title-top2\">" +
									articles.get(1).getTitle() +
								"</div>" +
								"<div class=\"news-subtitle-top2\">" +
									articles.get(1).getAbstract_() +
									"<br>" + "<br>" +
									"<strong>" +
										"By " +
									"</strong>" +
									"<form class=\"forms\" name=\"author1\"action=\"index.jsp\" method=\"GET\">" +
									    "<a href=\"javascript: submitAuthor(1)\">" +
									        "<input type=\"text\" name=\"author\" style=\"display:none\" value="+ "\'" + articles.get(1).getAuthor() + "\'" + ">" +
									        articles.get(1).getAuthor() +
									    "</a>" +
									"</form>" +
									"<br>" + "<br>" +
									"<span>" +
										"<strong>" +
											"Tags: " +
										"</strong>" );
										if(articles.get(1).getSubjects_description()!=null) {
											for (int i=0;i<articles.get(1).getSubjects_description().size();i++) {
												out.println(
													"<form class=\"forms\" name=\"tagSub1"+i+"\"action=\"index.jsp\" method=\"GET\">" +
							                            "<a href=\"javascript: submitTagSub(1"+i+")\">" +
							                                "<input type=\"text\" name=\"tagSub\" style=\"display:none\" value=\'" + articles.get(1).getSubjects_description().get(i) + "\'" + ">#" +
							                                articles.get(1).getSubjects_description().get(i).replaceAll(" ","") +
							                            "</a>" +
							                        "</form>"
												);
											}
										}
										if(articles.get(1).getOrganizations()!=null) {
											for (int i=0;i<articles.get(1).getOrganizations().size();i++) {
												out.println(
													"<form class=\"forms\" name=\"tagOrg1"+i+"\"action=\"index.jsp\" method=\"GET\">" +
													    "<a href=\"javascript: submitTagOrg(1"+i+")\">" +
													        "<input type=\"text\" name=\"tagOrg\" style=\"display:none\" value=\'" + articles.get(1).getOrganizations().get(i) + "\'" + ">#" +
													        articles.get(1).getOrganizations().get(i).replaceAll(" ","") +
													    "</a>" +
													"</form>"
												);
											}
										}
										if(articles.get(1).getPersons()!=null) {
											for (int i=0;i<articles.get(1).getPersons().size();i++) {
												out.println(
													"<form class=\"forms\" name=\"tagPer1"+i+"\"action=\"index.jsp\" method=\"GET\">" +
													    "<a href=\"javascript: submitTagPer(1"+i+")\">" +
													        "<input type=\"text\" name=\"tagPer\" style=\"display:none\" value=\'" + articles.get(1).getPersons().get(i) + "\'" + ">#" +
													        articles.get(1).getPersons().get(i).replaceAll(" ","") +
													    "</a>" +
													"</form>"
												);
											}
										}
										if(articles.get(1).getLocations()!=null) {
											for (int i=0;i<articles.get(1).getLocations().size();i++) {
												out.println(
													"<form class=\"forms\" name=\"tagLoc1"+i+"\"action=\"index.jsp\" method=\"GET\">" +
													    "<a href=\"javascript: submitTagLoc(1"+i+")\">" +
													        "<input type=\"text\" name=\"tagLoc\" style=\"display:none\" value=\'" + articles.get(1).getLocations().get(i) + "\'" + ">#" +
													        articles.get(1).getLocations().get(i).replaceAll(" ","") +
													    "</a>" +
													"</form>"
												);
											}
										}
									out.println(
									"</span>" +
									"<br>" + "<br>" +
									"<strong>" +
									"Published Date: " +
									"</strong>" +
										articles.get(1).getPublished_date().substring(0,10) +
									"<br>" + "<br>" +
									"<span>" +
									"<a href=\"" + articles.get(1).getUrl() + "\">Visit Article &#8594;</a>" +
									"</span>" +
								"</div>" +
							"</div>" +
						"</div>" +
						"<div class=\"three columns\">" +
							"<div class=\"news-img news-top2\" >" +
								"<img src=\"" + articles.get(2).getImage() + "\">" +
							"</div>" +
						"</div>" +
						"<div class=\"three columns\">" +
							"<div class=\"news-top2\">" +
								"<div class=\"news-section\">" +
									"<strong>" +
										"<form class=\"forms\" name=\"section2\"action=\"index.jsp\" method=\"GET\">" +
										    "<a href=\"javascript: submitSection(2)\">" +
										        "<input type=\"text\" name=\"section\" style=\"display:none\" value=\'" + articles.get(2).getSection() + "\'" + ">" +
										        articles.get(2).getSection() +
										    "</a>" +
										"</form>" +
										" &nbsp > &nbsp " +
										"<form class=\"forms\" name=\"subsection2\"action=\"index.jsp\" method=\"GET\">" +
										    "<a href=\"javascript: submitSubsection(2)\">" +
										        "<input type=\"text\" name=\"subsection\" style=\"display:none\" value=\'" + articles.get(2).getSubsection() + "\'" + ">" +
										        articles.get(2).getSubsection() +
										    "</a>" +
										"</form>" +
									"</strong>" +
								"</div>" +
								"<div class=\"news-title-top2\">" +
									articles.get(2).getTitle() +
								"</div>" +
								"<div class=\"news-subtitle-top2\">" +
									articles.get(2).getAbstract_() +
									"<br>" + "<br>" +
									"<strong>" +
										"By " +
									"</strong>" +
									"<form class=\"forms\" name=\"author2\"action=\"index.jsp\" method=\"GET\">" +
									    "<a href=\"javascript: submitAuthor(2)\">" +
									        "<input type=\"text\" name=\"author\" style=\"display:none\" value=\'" + articles.get(2).getAuthor() + "\'" + ">" +
									        articles.get(2).getAuthor() +
									    "</a>" +
									"</form>" +
									"<br>" + "<br>" +
									"<span>" +
										"<strong>" +
											"Tags: " +
										"</strong>" );
										if(articles.get(2).getSubjects_description()!=null) {
											for (int i=0;i<articles.get(2).getSubjects_description().size();i++) {
												out.println(
													"<form class=\"forms\" name=\"tagSub2"+i+"\"action=\"index.jsp\" method=\"GET\">" +
													    "<a href=\"javascript: submitTagSub(2"+i+")\">" +
													        "<input type=\"text\" name=\"tagSub\" style=\"display:none\" value=\'" + articles.get(2).getSubjects_description().get(i) + "\'" + ">#" +
													        articles.get(2).getSubjects_description().get(i).replaceAll(" ","") +
													    "</a>" +
													"</form>"
												);
											}
										}
										if(articles.get(2).getOrganizations()!=null) {
											for (int i=0;i<articles.get(2).getOrganizations().size();i++) {
												out.println(
													"<form class=\"forms\" name=\"tagOrg2"+i+"\"action=\"index.jsp\" method=\"GET\">" +
													    "<a href=\"javascript: submitTagOrg(2"+i+")\">" +
													        "<input type=\"text\" name=\"tagOrg\" style=\"display:none\" value=\'" + articles.get(2).getOrganizations().get(i) + "\'" + ">#" +
													        articles.get(2).getOrganizations().get(i).replaceAll(" ","") +
													    "</a>" +
													"</form>"
												);
											}
										}
										if(articles.get(2).getPersons()!=null) {
											for (int i=0;i<articles.get(2).getPersons().size();i++) {
												out.println(
													"<form class=\"forms\" name=\"tagPer2"+i+"\"action=\"index.jsp\" method=\"GET\">" +
													    "<a href=\"javascript: submitTagPer(2"+i+")\">" +
													        "<input type=\"text\" name=\"tagPer2\" style=\"display:none\" value=\'" + articles.get(2).getPersons().get(i) + "\'" + ">#" +
													        articles.get(2).getPersons().get(i).replaceAll(" ","") +
													    "</a>" +
													"</form>"
												);
											}
										}

										if(articles.get(2).getLocations()!=null) {
											for (int i=0;i<articles.get(2).getLocations().size();i++) {
												out.println(
													"<form class=\"forms\" name=\"tagLoc2"+i+"\"action=\"index.jsp\" method=\"GET\">" +
													    "<a href=\"javascript: submitTagLoc(2"+i+")\">" +
													        "<input type=\"text\" name=\"tagLoc\" style=\"display:none\" value=\'" + articles.get(2).getLocations().get(i) + "\'" + ">#" +
													        articles.get(2).getLocations().get(i).replaceAll(" ","") +
													    "</a>" +
													"</form>"
												);
											}
										}
									out.println(
									"</span>" +
									"<br>" +"<br>" +
									"<strong>" +
										"Published Date: " +
									"</strong>" +
										articles.get(2).getPublished_date().substring(0,10) +
									"<br>" + "<br>" +
									"<span>" +
										"<a href=\"" + articles.get(2).getUrl() + "\">Visit Article &#8594;</a>" +
									"</span>" +
								"</div>" +
							"</div>" +
						"</div>" +
					"</div> "
				);
			}
			if (number_articles >= 5) {
				out.println(
					"<div class=\"row\">" +
						"<div class=\"three columns\">" +
							"<div class=\"news-img news-top2\" >" +
								"<img src=\"" + articles.get(3).getImage() + "\">" +
							"</div>" +
						"</div>" +
						"<div class=\"three columns\">" +
							"<div class=\"news-top2\">" +
								"<div class=\"news-section\">" +
									"<strong>" +
										"<form class=\"forms\" name=\"section3\"action=\"index.jsp\" method=\"GET\">" +
				                            "<a href=\"javascript: submitSection(3)\">" +
				                                "<input type=\"text\" name=\"section\" style=\"display:none\" value="+ "\'" + articles.get(3).getSection() + "\'" + ">" +
				                                articles.get(3).getSection() +
				                            "</a>" +
				                        "</form>" +
				                        " &nbsp > &nbsp " +
				                        "<form class=\"forms\" name=\"subsection3\"action=\"index.jsp\" method=\"GET\">" +
				                            "<a href=\"javascript: submitSubsection(3)\">" +
				                                "<input type=\"text\" name=\"subsection\" style=\"display:none\" value="+ "\'" + articles.get(3).getSubsection() + "\'" + ">" +
				                                articles.get(3).getSubsection() +
				                            "</a>" +
				                        "</form>" +
									"</strong>" +
								"</div>" +
								"<div class=\"news-title-top2\">" +
									articles.get(3).getTitle() +
								"</div>" +
								"<div class=\"news-subtitle-top2\">" +
									articles.get(3).getAbstract_() +
									"<br>" + "<br>" +
									"<strong>" +
										"By " +
									"</strong>" +
									"<form class=\"forms\" name=\"author3\"action=\"index.jsp\" method=\"GET\">" +
			                            "<a href=\"javascript: submitAuthor(3)\">" +
			                                "<input type=\"text\" name=\"author\" style=\"display:none\" value=\'" + articles.get(3).getAuthor() + "\'" + ">" +
			                                articles.get(3).getAuthor() +
			                            "</a>" +
			                        "</form>" +
									"<br>" + "<br>" +
									"<span>" +
										"<strong>" +
											"Tags: " +
										"</strong>" );
										if(articles.get(3).getSubjects_description()!=null) {
											for (int i=0;i<articles.get(3).getSubjects_description().size();i++) {
												out.println(
													"<form class=\"forms\" name=\"tagSub3"+i+"\"action=\"index.jsp\" method=\"GET\">" +
							                            "<a href=\"javascript: submitTagSub(3"+i+")\">" +
							                                "<input type=\"text\" name=\"tagSub\" style=\"display:none\" value=\'" + articles.get(3).getSubjects_description().get(i) + "\'" + ">#" +
							                                articles.get(3).getSubjects_description().get(i).replaceAll(" ","") +
							                            "</a>" +
							                        "</form>"
												);
											}
										}
										if(articles.get(3).getOrganizations()!=null) {
											for (int i=0;i<articles.get(3).getOrganizations().size();i++) {
												out.println(
													"<form class=\"forms\" name=\"tagOrg3"+i+"\"action=\"index.jsp\" method=\"GET\">" +
							                            "<a href=\"javascript: submitTagOrg(3"+i+")\">" +
							                                "<input type=\"text\" name=\"tagOrg\" style=\"display:none\" value=\'" + articles.get(3).getOrganizations().get(i) + "\'" + ">#" +
							                                articles.get(3).getOrganizations().get(i).replaceAll(" ","") +
							                            "</a>" +
							                        "</form>"
												);
											}
										}
										if(articles.get(3).getPersons()!=null) {
											for (int i=0;i<articles.get(3).getPersons().size();i++) {
												out.println(
													"<form class=\"forms\" name=\"tagPer3"+i+"\"action=\"index.jsp\" method=\"GET\">" +
							                            "<a href=\"javascript: submitTagPer(3"+i+")\">" +
							                                "<input type=\"text\" name=\"tagPer\" style=\"display:none\" value=\'" + articles.get(3).getPersons().get(i) + "\'" + ">#" +
							                                articles.get(3).getPersons().get(i).replaceAll(" ","") +
							                            "</a>" +
							                        "</form>"
												);
											}
										}
										if(articles.get(3).getLocations()!=null) {
											for (int i=0;i<articles.get(3).getLocations().size();i++) {
												out.println(
													"<form class=\"forms\" name=\"tagLoc3"+i+"\"action=\"index.jsp\" method=\"GET\">" +
							                            "<a href=\"javascript: submitTagLoc(3"+i+")\">" +
							                                "<input type=\"text\" name=\"tagLoc\" style=\"display:none\" value=\'" + articles.get(3).getLocations().get(i) + "\'" + ">#" +
							                                articles.get(3).getLocations().get(i).replaceAll(" ","") +
							                            "</a>" +
							                        "</form>"
												);
											}
										}
									out.println(
									"</span>" +
									"<br>" +"<br>" +
									"<strong>" +
										"Published Date: " +
									"</strong>" +
										articles.get(3).getPublished_date().substring(0,10) +
									"<br>" + "<br>" +
									"<span>" +
									"<a href=\"" + articles.get(3).getUrl() + "\">Visit Article &#8594;</a>" +
									"</span>" +
								"</div>" +
							"</div>" +
						"</div>" +
						"<div class=\"three columns\">" +
							"<div class=\"news-img news-top2\" >" +
								"<img src=\"" + articles.get(4).getImage() + "\">" +
							"</div>" +
						"</div>" +
						"<div class=\"three columns\">" +
							"<div class=\"news-top2\">" +
								"<div class=\"news-section\">" +
									"<strong>" +
										"<form class=\"forms\" name=\"section4\"action=\"index.jsp\" method=\"GET\">" +
				                            "<a href=\"javascript: submitSection(4)\">" +
				                                "<input type=\"text\" name=\"section\" style=\"display:none\" value="+ "\'" + articles.get(4).getSection() + "\'" + ">" +
				                                articles.get(4).getSection() +
				                            "</a>" +
				                        "</form>" +
				                        " &nbsp > &nbsp " +
				                        "<form class=\"forms\" name=\"subsection4\"action=\"index.jsp\" method=\"GET\">" +
				                            "<a href=\"javascript: submitSubsection(4)\">" +
				                                "<input type=\"text\" name=\"subsection\" style=\"display:none\" value="+ "\'" + articles.get(4).getSubsection() + "\'" + ">" +
				                                articles.get(4).getSubsection() +
				                            "</a>" +
				                        "</form>" +
									"</strong>" +
								"</div>" +
								"<div class=\"news-title-top2\">" +
									articles.get(4).getTitle() +
								"</div>" +
								"<div class=\"news-subtitle-top2\">" +
									articles.get(4).getAbstract_() +
									"<br>" + "<br>" +
									"<strong>" +
										"By " +
									"</strong>" +
									"<form class=\"forms\" name=\"author4\"action=\"index.jsp\" method=\"GET\">" +
			                            "<a href=\"javascript: submitAuthor(4)\">" +
			                                "<input type=\"text\" name=\"author\" style=\"display:none\" value=\'" + articles.get(4).getAuthor() + "\'" + ">" +
			                                articles.get(4).getAuthor() +
			                            "</a>" +
			                        "</form>" +
									"<br>" + "<br>" +
									"<span>" +
										"<strong>" +
											"Tags: " +
										"</strong>" );
										if(articles.get(4).getSubjects_description()!=null) {
											for (int i=0;i<articles.get(4).getSubjects_description().size();i++) {
												out.println(
													"<form class=\"forms\" name=\"tagSub4"+i+"\"action=\"index.jsp\" method=\"GET\">" +
							                            "<a href=\"javascript: submitTagSub(4"+i+")\">" +
							                                "<input type=\"text\" name=\"tagSub\" style=\"display:none\" value=\'" + articles.get(4).getSubjects_description().get(i) + "\'" + ">#" +
							                                articles.get(4).getSubjects_description().get(i).replaceAll(" ","") +
							                            "</a>" +
							                        "</form>"
												);
											}
										}
										if(articles.get(4).getOrganizations()!=null) {
											for (int i=0;i<articles.get(4).getOrganizations().size();i++) {
												out.println(
													"<form class=\"forms\" name=\"tagOrg4"+i+"\"action=\"index.jsp\" method=\"GET\">" +
							                            "<a href=\"javascript: submitTagOrg(4"+i+")\">" +
							                                "<input type=\"text\" name=\"tagOrg\" style=\"display:none\" value=\'" + articles.get(4).getOrganizations().get(i) + "\'" + ">#" +
							                                articles.get(4).getOrganizations().get(i).replaceAll(" ","") +
							                            "</a>" +
							                        "</form>"
												);
											}
										}
										if(articles.get(4).getPersons()!=null) {
											for (int i=0;i<articles.get(4).getPersons().size();i++) {
												out.println(
													"<form class=\"forms\" name=\"tagPer4"+i+"\"action=\"index.jsp\" method=\"GET\">" +
							                            "<a href=\"javascript: submitTagPer(4"+i+")\">" +
							                                "<input type=\"text\" name=\"tagPer\" style=\"display:none\" value=\'" + articles.get(4).getPersons().get(i) + "\'" + ">#" +
							                                articles.get(4).getPersons().get(i).replaceAll(" ","") +
							                            "</a>" +
							                        "</form>"
												);
											}
										}
										if(articles.get(4).getLocations()!=null) {
											for (int i=0;i<articles.get(4).getLocations().size();i++) {
												out.println(
													"<form class=\"forms\" name=\"tagLoc4"+i+"\"action=\"index.jsp\" method=\"GET\">" +
							                            "<a href=\"javascript: submitTagLoc(4"+i+")\">" +
							                                "<input type=\"text\" name=\"tagLoc\" style=\"display:none\" value=\'" + articles.get(4).getLocations().get(i) + "\'" + ">#" +
							                                articles.get(4).getLocations().get(i).replaceAll(" ","") +
							                            "</a>" +
							                        "</form>"
												);
											}
										}
									out.println(
									"</span>" +
									"<br>" +"<br>" +
									"<strong>" +
										"Published Date: " +
									"</strong>" +
										articles.get(4).getPublished_date().substring(0,10) +
									"<br>" + "<br>" +
									"<span>" +
									"<a href=\"" + articles.get(4).getUrl() + "\">Visit Article &#8594;</a>" +
									"</span>" +
								"</div>" +
							"</div>" +
						"</div>" +
					"</div> "
				);
			}

			out.println("<br>");

			// Small Articles
			if (number_articles >= 8) {
				out.println(
					"<div class=\"row\" >" +
						"<div class=\"two columns\" onclick=\"toggle1();return false;\">" +
							"<div id=\"news-small\" class=\"news-img news-small closed\" >" +
								"<img src=\"" + articles.get(5).getImage() + "\">" +
							"</div>" +
						"</div>" +
						"<div class=\"two columns\">" +
							"<div id=\"news-small\" class=\"news-small closed\">" +
								"<div class=\"news-section-small\">" +
									"<strong>" +
										"<form class=\"forms\" name=\"section5\"action=\"index.jsp\" method=\"GET\">" +
                                            "<a href=\"javascript: submitSection(5)\">" +
                                                "<input type=\"text\" name=\"section\" style=\"display:none\" value="+ "\'" + articles.get(5).getSection() + "\'" + ">" +
                                                articles.get(5).getSection() +
                                            "</a>" +
                                        "</form>" +
                                        " &nbsp > &nbsp " +
                                        "<form class=\"forms\" name=\"subsection5\"action=\"index.jsp\" method=\"GET\">" +
                                            "<a href=\"javascript: submitSubsection(5)\">" +
                                                "<input type=\"text\" name=\"subsection\" style=\"display:none\" value="+ "\'" + articles.get(5).getSubsection() + "\'" + ">" +
                                                articles.get(5).getSubsection() +
                                            "</a>" +
                                        "</form>" +
									"</strong>" +
								"</div>" +
								"<div class=\"news-title-small\" onclick=\"toggle1();return false;\">" +
									articles.get(5).getTitle() +
								"</div>" +
								"<div class=\"slider closed news-subtitle-small\" id=\"slider1\">" +
									articles.get(5).getAbstract_() +
									"<br>" + "<br>" +
									"<strong>" +
										"By " +
									"</strong>" +
									"<form class=\"forms\" name=\"author5\"action=\"index.jsp\" method=\"GET\">" +
                                        "<a href=\"javascript: submitAuthor(5)\">" +
                                            "<input type=\"text\" name=\"author\" style=\"display:none\" value=\'" + articles.get(5).getAuthor() + "\'" + ">" +
                                            articles.get(5).getAuthor() +
                                        "</a>" +
                                    "</form>" +
									"<br>" + "<br>" +
									"<span>" +
										"<strong>" +
											"Tags: " +
										"</strong>" );
										if(articles.get(5).getSubjects_description()!=null) {
											for (int i=0;i<articles.get(5).getSubjects_description().size();i++) {
												out.println(
													"<form class=\"forms\" name=\"tagSub5"+i+"\"action=\"index.jsp\" method=\"GET\">" +
			                                            "<a href=\"javascript: submitTagSub(5"+i+")\">" +
			                                                "<input type=\"text\" name=\"tagSub\" style=\"display:none\" value=\'" + articles.get(5).getSubjects_description().get(i) + "\'" + ">#" +
			                                                articles.get(5).getSubjects_description().get(i).replaceAll(" ","") +
			                                            "</a>" +
			                                        "</form>"
												);
											}
										}
										if(articles.get(5).getOrganizations()!=null) {
											for (int i=0;i<articles.get(5).getOrganizations().size();i++) {
												out.println(
													"<form class=\"forms\" name=\"tagOrg5"+i+"\"action=\"index.jsp\" method=\"GET\">" +
			                                            "<a href=\"javascript: submitTagOrg(5"+i+")\">" +
			                                                "<input type=\"text\" name=\"tagOrg\" style=\"display:none\" value=\'" + articles.get(5).getOrganizations().get(i) + "\'" + ">#" +
			                                                articles.get(5).getOrganizations().get(i).replaceAll(" ","") +
			                                            "</a>" +
			                                        "</form>"
												);
											}
										}
										if(articles.get(5).getPersons()!=null) {
											for (int i=0;i<articles.get(5).getPersons().size();i++) {
												out.println(
													"<form class=\"forms\" name=\"tagPer5"+i+"\"action=\"index.jsp\" method=\"GET\">" +
			                                            "<a href=\"javascript: submitTagPer(5"+i+")\">" +
			                                                "<input type=\"text\" name=\"tagPer\" style=\"display:none\" value=\'" + articles.get(5).getPersons().get(i) + "\'" + ">#" +
			                                                articles.get(5).getPersons().get(i).replaceAll(" ","") +
			                                            "</a>" +
			                                        "</form>"
												);
											}
										}
										if(articles.get(5).getLocations()!=null) {
											for (int i=0;i<articles.get(5).getLocations().size();i++) {
												out.println(
													"<form class=\"forms\" name=\"tagLoc5"+i+"\"action=\"index.jsp\" method=\"GET\">" +
			                                            "<a href=\"javascript: submitTagLoc(5"+i+")\">" +
			                                                "<input type=\"text\" name=\"tagLoc\" style=\"display:none\" value=\'" + articles.get(5).getLocations().get(i) + "\'" + ">#" +
			                                                articles.get(5).getLocations().get(i).replaceAll(" ","") +
			                                            "</a>" +
			                                        "</form>"
												);
											}
										}
									out.println(
									"</span>" +
									"<br>" +"<br>" +
									"<strong>" +
										"Published Date: " +
									"</strong>" +
										articles.get(5).getPublished_date().substring(0,10) +
									"<br>" + "<br>" +
									"<span>" +
									"<a href=\"" + articles.get(5).getUrl() + "\">Visit Article &#8594;</a>" +
									"</span>" +
									"<br>" + "<br>" +
								"</div>" +
							"</div>" +
						"</div>" +
						"<div class=\"two columns\" onclick=\"toggle1();return false;\">" +
							"<div id=\"news-small\" class=\"news-img news-small closed\" >" +
								"<img src=\"" + articles.get(6).getImage() + "\">" +
							"</div>" +
						"</div>" +
						"<div class=\"two columns\">" +
							"<div id=\"news-small\" class=\"news-small closed\">" +
								"<div class=\"news-section-small\">" +
									"<strong>" +
										"<form class=\"forms\" name=\"section6\"action=\"index.jsp\" method=\"GET\">" +
                                            "<a href=\"javascript: submitSection(6)\">" +
                                                "<input type=\"text\" name=\"section\" style=\"display:none\" value="+ "\'" + articles.get(6).getSection() + "\'" + ">" +
                                                articles.get(6).getSection() +
                                            "</a>" +
                                        "</form>" +
                                        " &nbsp > &nbsp " +
                                        "<form class=\"forms\" name=\"subsection6\"action=\"index.jsp\" method=\"GET\">" +
                                            "<a href=\"javascript: submitSubsection(6)\">" +
                                                "<input type=\"text\" name=\"subsection\" style=\"display:none\" value="+ "\'" + articles.get(6).getSubsection() + "\'" + ">" +
                                                articles.get(6).getSubsection() +
                                            "</a>" +
                                        "</form>" +
									"</strong>" +
								"</div>" +
								"<div class=\"news-title-small\" onclick=\"toggle1();return false;\">" +
									articles.get(6).getTitle() +
								"</div>" +
								"<div class=\"slider closed news-subtitle-small\" id=\"slider2\">" +
									articles.get(6).getAbstract_() +
									"<br>" + "<br>" +
									"<strong>" +
										"By " +
									"</strong>" +
									"<form class=\"forms\" name=\"author6\"action=\"index.jsp\" method=\"GET\">" +
                                        "<a href=\"javascript: submitAuthor(6)\">" +
                                            "<input type=\"text\" name=\"author\" style=\"display:none\" value=\'" + articles.get(6).getAuthor() + "\'" + ">" +
                                            articles.get(6).getAuthor() +
                                        "</a>" +
                                    "</form>" +
									"<br>" + "<br>" +
									"<span>" +
										"<strong>" +
											"Tags: " +
										"</strong>" );
										if(articles.get(6).getSubjects_description()!=null) {
											for (int i=0;i<articles.get(6).getSubjects_description().size();i++) {
												out.println(
													"<form class=\"forms\" name=\"tagSub6"+i+"\"action=\"index.jsp\" method=\"GET\">" +
                                                        "<a href=\"javascript: submitTagSub(6"+i+")\">" +
                                                            "<input type=\"text\" name=\"tagSub\" style=\"display:none\" value=\'" + articles.get(6).getSubjects_description().get(i) + "\'" + ">#" +
                                                            articles.get(6).getSubjects_description().get(i).replaceAll(" ","") +
                                                        "</a>" +
                                                    "</form>"
												);
											}
										}
										if(articles.get(6).getOrganizations()!=null) {
											for (int i=0;i<articles.get(6).getOrganizations().size();i++) {
												out.println(
													"<form class=\"forms\" name=\"tagOrg6"+i+"\"action=\"index.jsp\" method=\"GET\">" +
                                                        "<a href=\"javascript: submitTagOrg(6"+i+")\">" +
                                                            "<input type=\"text\" name=\"tagOrg\" style=\"display:none\" value=\'" + articles.get(6).getOrganizations().get(i) + "\'" + ">#" +
                                                            articles.get(6).getOrganizations().get(i).replaceAll(" ","") +
                                                        "</a>" +
                                                    "</form>"
												);
											}
										}
										if(articles.get(6).getPersons()!=null) {
											for (int i=0;i<articles.get(6).getPersons().size();i++) {
												out.println(
													"<form class=\"forms\" name=\"tagPer6"+i+"\"action=\"index.jsp\" method=\"GET\">" +
                                                        "<a href=\"javascript: submitTagPer(6"+i+")\">" +
                                                            "<input type=\"text\" name=\"tagPer\" style=\"display:none\" value=\'" + articles.get(6).getPersons().get(i) + "\'" + ">#" +
                                                            articles.get(6).getPersons().get(i).replaceAll(" ","") +
                                                        "</a>" +
                                                    "</form>"
												);
											}
										}
										if(articles.get(6).getLocations()!=null) {
											for (int i=0;i<articles.get(6).getLocations().size();i++) {
												out.println(
													"<form class=\"forms\" name=\"tagLoc6"+i+"\"action=\"index.jsp\" method=\"GET\">" +
                                                        "<a href=\"javascript: submitTagLoc(6"+i+")\">" +
                                                            "<input type=\"text\" name=\"tagLoc\" style=\"display:none\" value=\'" + articles.get(6).getLocations().get(i) + "\'" + ">#" +
                                                            articles.get(6).getLocations().get(i).replaceAll(" ","") +
                                                        "</a>" +
                                                    "</form>"
												);
											}
										}
									out.println(
									"</span>" +
									"<br>" +"<br>" +
									"<strong>" +
										"Published Date: " +
									"</strong>" +
										articles.get(6).getPublished_date().substring(0,10) +
									"<br>" + "<br>" +
									"<span>" +
									"<a href=\"" + articles.get(6).getUrl() + "\">Visit Article &#8594;</a>" +
									"</span>" +
									"<br>" + "<br>" +
								"</div>" +
							"</div>" +
						"</div>" +
						"<div class=\"two columns\" onclick=\"toggle1();return false;\">" +
							"<div id=\"news-small\" class=\"news-img news-small closed\" >" +
								"<img src=\"" + articles.get(7).getImage() + "\">" +
							"</div>" +
						"</div>" +
						"<div class=\"two columns\">" +
							"<div id=\"news-small\" class=\"news-small closed\">" +
								"<div class=\"news-section-small\">" +
									"<strong>" +
										"<form class=\"forms\" name=\"section7\"action=\"index.jsp\" method=\"GET\">" +
                                            "<a href=\"javascript: submitSection(7)\">" +
                                                "<input type=\"text\" name=\"section\" style=\"display:none\" value="+ "\'" + articles.get(7).getSection() + "\'" + ">" +
                                                articles.get(7).getSection() +
                                            "</a>" +
                                        "</form>" +
                                        " &nbsp > &nbsp " +
                                        "<form class=\"forms\" name=\"subsection7\"action=\"index.jsp\" method=\"GET\">" +
                                            "<a href=\"javascript: submitSubsection(7)\">" +
                                                "<input type=\"text\" name=\"subsection\" style=\"display:none\" value="+ "\'" + articles.get(7).getSubsection() + "\'" + ">" +
                                                articles.get(7).getSubsection() +
                                            "</a>" +
                                        "</form>" +
									"</strong>" +
								"</div>" +
								"<div class=\"news-title-small\" onclick=\"toggle1();return false;\">" +
									articles.get(7).getTitle() +
								"</div>" +
								"<div class=\"slider closed news-subtitle-small\" id=\"slider3\">" +
									articles.get(7).getAbstract_() +
									"<br>" + "<br>" +
									"<strong>" +
										"By " +
									"</strong>" +
									"<form class=\"forms\" name=\"author7\"action=\"index.jsp\" method=\"GET\">" +
                                        "<a href=\"javascript: submitAuthor(7)\">" +
                                            "<input type=\"text\" name=\"author\" style=\"display:none\" value=\'" + articles.get(7).getAuthor() + "\'" + ">" +
                                            articles.get(7).getAuthor() +
                                        "</a>" +
                                    "</form>" +
									"<br>" + "<br>" +
									"<span>" +
										"<strong>" +
											"Tags: " +
										"</strong>" );
										if(articles.get(7).getSubjects_description()!=null) {
											for (int i=0;i<articles.get(7).getSubjects_description().size();i++) {
												out.println(
													"<form class=\"forms\" name=\"tagSub7"+i+"\"action=\"index.jsp\" method=\"GET\">" +
                                                        "<a href=\"javascript: submitTagSub(7"+i+")\">" +
                                                            "<input type=\"text\" name=\"tagSub\" style=\"display:none\" value=\'" + articles.get(7).getSubjects_description().get(i) + "\'" + ">#" +
                                                            articles.get(7).getSubjects_description().get(i).replaceAll(" ","") +
                                                        "</a>" +
                                                    "</form>"
												);
											}
										}
										if(articles.get(7).getOrganizations()!=null) {
											for (int i=0;i<articles.get(7).getOrganizations().size();i++) {
												out.println(
													"<form class=\"forms\" name=\"tagOrg7"+i+"\"action=\"index.jsp\" method=\"GET\">" +
                                                        "<a href=\"javascript: submitTagOrg(7"+i+")\">" +
                                                            "<input type=\"text\" name=\"tagOrg\" style=\"display:none\" value=\'" + articles.get(7).getOrganizations().get(i) + "\'" + ">#" +
                                                            articles.get(7).getOrganizations().get(i).replaceAll(" ","") +
                                                        "</a>" +
                                                    "</form>"
												);
											}
										}
										if(articles.get(7).getPersons()!=null) {
											for (int i=0;i<articles.get(7).getPersons().size();i++) {
												out.println(
													"<form class=\"forms\" name=\"tagPer7"+i+"\"action=\"index.jsp\" method=\"GET\">" +
                                                        "<a href=\"javascript: submitTagPer(7"+i+")\">" +
                                                            "<input type=\"text\" name=\"tagPer\" style=\"display:none\" value=\'" + articles.get(7).getPersons().get(i) + "\'" + ">#" +
                                                            articles.get(7).getPersons().get(i).replaceAll(" ","") +
                                                        "</a>" +
                                                    "</form>"
												);
											}
										}
										if(articles.get(7).getLocations()!=null) {
											for (int i=0;i<articles.get(7).getLocations().size();i++) {
												out.println(
													"<form class=\"forms\" name=\"tagLoc7"+i+"\"action=\"index.jsp\" method=\"GET\">" +
                                                        "<a href=\"javascript: submitTagLoc(7"+i+")\">" +
                                                            "<input type=\"text\" name=\"tagLoc\" style=\"display:none\" value=\'" + articles.get(7).getLocations().get(i) + "\'" + ">#" +
                                                            articles.get(7).getLocations().get(i).replaceAll(" ","") +
                                                        "</a>" +
                                                    "</form>"
												);
											}
										}
									out.println(
									"</span>" +
									"<br>" +"<br>" +
									"<strong>" +
										"Published Date: " +
									"</strong>" +
										articles.get(7).getPublished_date().substring(0,10) +
									"<br>" + "<br>" +
									"<span>" +
									"<a href=\"" + articles.get(7).getUrl() + "\">Visit Article &#8594;</a>" +
									"</span>" +
									"<br>" + "<br>" +
								"</div>" +
							"</div>" +
						"</div>" +
					"</div> "
				);
			}
			if (number_articles >= 11) {
				out.println(
					"<div class=\"row\">" +
						"<div class=\"two columns\" onclick=\"toggle2();return false;\">" +
							"<div id=\"news-small2\" class=\"news-img news-small closed\" >" +
								"<img src=\"" + articles.get(8).getImage() + "\">" +
							"</div>" +
						"</div>" +
						"<div class=\"two columns\">" +
							"<div id=\"news-small2\" class=\"news-small closed\">" +
								"<div class=\"news-section-small\">" +
									"<strong>" +
										"<form class=\"forms\" name=\"section8\"action=\"index.jsp\" method=\"GET\">" +
                                            "<a href=\"javascript: submitSection(8)\">" +
                                                "<input type=\"text\" name=\"section\" style=\"display:none\" value="+ "\'" + articles.get(8).getSection() + "\'" + ">" +
                                                articles.get(8).getSection() +
                                            "</a>" +
                                        "</form>" +
                                        " &nbsp > &nbsp " +
                                        "<form class=\"forms\" name=\"subsection8\"action=\"index.jsp\" method=\"GET\">" +
                                            "<a href=\"javascript: submitSubsection(8)\">" +
                                                "<input type=\"text\" name=\"subsection\" style=\"display:none\" value="+ "\'" + articles.get(8).getSubsection() + "\'" + ">" +
                                                articles.get(8).getSubsection() +
                                            "</a>" +
                                        "</form>" +
									"</strong>" +
								"</div>" +
								"<div class=\"news-title-small\" onclick=\"toggle2();return false;\">" +
									articles.get(8).getTitle() +
								"</div>" +
								"<div class=\"slider closed news-subtitle-small\" id=\"slider4\">" +
									articles.get(8).getAbstract_() +
									"<br>" + "<br>" +
									"<strong>" +
										"By " +
									"</strong>" +
									"<form class=\"forms\" name=\"author8\"action=\"index.jsp\" method=\"GET\">" +
                                        "<a href=\"javascript: submitAuthor(8)\">" +
                                            "<input type=\"text\" name=\"author\" style=\"display:none\" value=\'" + articles.get(8).getAuthor() + "\'" + ">" +
                                            articles.get(8).getAuthor() +
                                        "</a>" +
                                    "</form>" +
									"<br>" + "<br>" +
									"<span>" +
										"<strong>" +
											"Tags: " +
										"</strong>" );
										if(articles.get(8).getSubjects_description()!=null) {
											for (int i=0;i<articles.get(8).getSubjects_description().size();i++) {
												out.println(
													"<form class=\"forms\" name=\"tagSub8"+i+"\"action=\"index.jsp\" method=\"GET\">" +
                                                        "<a href=\"javascript: submitTagSub(8"+i+")\">" +
                                                            "<input type=\"text\" name=\"tagSub\" style=\"display:none\" value=\'" + articles.get(8).getSubjects_description().get(i) + "\'" + ">#" +
                                                            articles.get(8).getSubjects_description().get(i).replaceAll(" ","") +
                                                        "</a>" +
                                                    "</form>"
												);
											}
										}
										if(articles.get(8).getOrganizations()!=null) {
											for (int i=0;i<articles.get(8).getOrganizations().size();i++) {
												out.println(
													"<form class=\"forms\" name=\"tagOrg8"+i+"\"action=\"index.jsp\" method=\"GET\">" +
                                                        "<a href=\"javascript: submitTagOrg(8"+i+")\">" +
                                                            "<input type=\"text\" name=\"tagOrg\" style=\"display:none\" value=\'" + articles.get(8).getOrganizations().get(i) + "\'" + ">#" +
                                                            articles.get(8).getOrganizations().get(i).replaceAll(" ","") +
                                                        "</a>" +
                                                    "</form>"
												);
											}
										}
										if(articles.get(8).getPersons()!=null) {
											for (int i=0;i<articles.get(8).getPersons().size();i++) {
												out.println(
													"<form class=\"forms\" name=\"tagPer8"+i+"\"action=\"index.jsp\" method=\"GET\">" +
                                                        "<a href=\"javascript: submitTagPer(8"+i+")\">" +
                                                            "<input type=\"text\" name=\"tagPer\" style=\"display:none\" value=\'" + articles.get(8).getPersons().get(i) + "\'" + ">#" +
                                                            articles.get(8).getPersons().get(i).replaceAll(" ","") +
                                                        "</a>" +
                                                    "</form>"
												);
											}
										}
										if(articles.get(8).getLocations()!=null) {
											for (int i=0;i<articles.get(8).getLocations().size();i++) {
												out.println(
													"<form class=\"forms\" name=\"tagLoc8"+i+"\"action=\"index.jsp\" method=\"GET\">" +
                                                        "<a href=\"javascript: submitTagLoc(8"+i+")\">" +
                                                            "<input type=\"text\" name=\"tagLoc\" style=\"display:none\" value=\'" + articles.get(8).getLocations().get(i) + "\'" + ">#" +
                                                            articles.get(8).getLocations().get(i).replaceAll(" ","") +
                                                        "</a>" +
                                                    "</form>"
												);
											}
										}
									out.println(
									"</span>" +
									"<br>" +"<br>" +
									"<strong>" +
										"Published Date: " +
									"</strong>" +
										articles.get(8).getPublished_date().substring(0,10) +
									"<br>" + "<br>" +
									"<span>" +
									"<a href=\"" + articles.get(8).getUrl() + "\">Visit Article &#8594;</a>" +
									"</span>" +
									"<br>" + "<br>" +
								"</div>" +
							"</div>" +
						"</div>" +
						"<div class=\"two columns\" onclick=\"toggle2();return false;\">" +
							"<div id=\"news-small2\" class=\"news-img news-small closed\" >" +
								"<img src=\"" + articles.get(9).getImage() + "\">" +
							"</div>" +
						"</div>" +
						"<div class=\"two columns\">" +
							"<div id=\"news-small2\" class=\"news-small closed\">" +
								"<div class=\"news-section-small\">" +
									"<strong>" +
										"<form class=\"forms\" name=\"section9\"action=\"index.jsp\" method=\"GET\">" +
                                            "<a href=\"javascript: submitSection(9)\">" +
                                                "<input type=\"text\" name=\"section\" style=\"display:none\" value="+ "\'" + articles.get(9).getSection() + "\'" + ">" +
                                                articles.get(9).getSection() +
                                            "</a>" +
                                        "</form>" +
                                        " &nbsp > &nbsp " +
                                        "<form class=\"forms\" name=\"subsection9\"action=\"index.jsp\" method=\"GET\">" +
                                            "<a href=\"javascript: submitSubsection(9)\">" +
                                                "<input type=\"text\" name=\"subsection\" style=\"display:none\" value="+ "\'" + articles.get(9).getSubsection() + "\'" + ">" +
                                                articles.get(9).getSubsection() +
                                            "</a>" +
                                        "</form>" +
									"</strong>" +
								"</div>" +
								"<div class=\"news-title-small\" onclick=\"toggle2();return false;\">" +
									articles.get(9).getTitle() +
								"</div>" +
								"<div class=\"slider closed news-subtitle-small\" id=\"slider5\">" +
									articles.get(9).getAbstract_() +
									"<br>" + "<br>" +
									"<strong>" +
										"By " +
									"</strong>" +
									"<form class=\"forms\" name=\"author9\"action=\"index.jsp\" method=\"GET\">" +
                                        "<a href=\"javascript: submitAuthor(9)\">" +
                                            "<input type=\"text\" name=\"author\" style=\"display:none\" value=\'" + articles.get(9).getAuthor() + "\'" + ">" +
                                            articles.get(9).getAuthor() +
                                        "</a>" +
                                    "</form>" +
									"<br>" + "<br>" +
									"<span>" +
										"<strong>" +
											"Tags: " +
										"</strong>" );
										if(articles.get(9).getSubjects_description()!=null) {
											for (int i=0;i<articles.get(9).getSubjects_description().size();i++) {
												out.println(
													"<form class=\"forms\" name=\"tagSub9"+i+"\"action=\"index.jsp\" method=\"GET\">" +
                                                        "<a href=\"javascript: submitTagSub(9"+i+")\">" +
                                                            "<input type=\"text\" name=\"tagSub\" style=\"display:none\" value=\'" + articles.get(9).getSubjects_description().get(i) + "\'" + ">#" +
                                                            articles.get(9).getSubjects_description().get(i).replaceAll(" ","") +
                                                        "</a>" +
                                                    "</form>"
												);
											}
										}
										if(articles.get(9).getOrganizations()!=null) {
											for (int i=0;i<articles.get(9).getOrganizations().size();i++) {
												out.println(
													"<form class=\"forms\" name=\"tagOrg9"+i+"\"action=\"index.jsp\" method=\"GET\">" +
                                                        "<a href=\"javascript: submitTagOrg(9"+i+")\">" +
                                                            "<input type=\"text\" name=\"tagOrg\" style=\"display:none\" value=\'" + articles.get(9).getOrganizations().get(i) + "\'" + ">#" +
                                                            articles.get(9).getOrganizations().get(i).replaceAll(" ","") +
                                                        "</a>" +
                                                    "</form>"
												);
											}
										}
										if(articles.get(9).getPersons()!=null) {
											for (int i=0;i<articles.get(9).getPersons().size();i++) {
												out.println(
													"<form class=\"forms\" name=\"tagPer9"+i+"\"action=\"index.jsp\" method=\"GET\">" +
                                                        "<a href=\"javascript: submitTagPer(9"+i+")\">" +
                                                            "<input type=\"text\" name=\"tagPer\" style=\"display:none\" value=\'" + articles.get(9).getPersons().get(i) + "\'" + ">#" +
                                                            articles.get(9).getPersons().get(i).replaceAll(" ","") +
                                                        "</a>" +
                                                    "</form>"
												);
											}
										}
										if(articles.get(9).getLocations()!=null) {
											for (int i=0;i<articles.get(9).getLocations().size();i++) {
												out.println(
													"<form class=\"forms\" name=\"tagLoc9"+i+"\"action=\"index.jsp\" method=\"GET\">" +
                                                        "<a href=\"javascript: submitTagLoc(9"+i+")\">" +
                                                            "<input type=\"text\" name=\"tagLoc\" style=\"display:none\" value=\'" + articles.get(9).getLocations().get(i) + "\'" + ">#" +
                                                            articles.get(9).getLocations().get(i).replaceAll(" ","") +
                                                        "</a>" +
                                                    "</form>"
												);
											}
										}
									out.println(
									"</span>" +
									"<br>" +"<br>" +
									"<strong>" +
										"Published Date: " +
									"</strong>" +
										articles.get(9).getPublished_date().substring(0,10) +
									"<br>" + "<br>" +
									"<span>" +
									"<a href=\"" + articles.get(9).getUrl() + "\">Visit Article &#8594;</a>" +
									"</span>" +
									"<br>" + "<br>" +
								"</div>" +
							"</div>" +
						"</div>" +
						"<div class=\"two columns\" onclick=\"toggle2();return false;\">" +
							"<div id=\"news-small2\" class=\"news-img news-small closed\" >" +
								"<img src=\"" + articles.get(10).getImage() + "\">" +
							"</div>" +
						"</div>" +
						"<div class=\"two columns\">" +
							"<div id=\"news-small2\" class=\"news-small closed\">" +
								"<div class=\"news-section-small\">" +
									"<strong>" +
										"<form class=\"forms\" name=\"section10\"action=\"index.jsp\" method=\"GET\">" +
                                            "<a href=\"javascript: submitSection(10)\">" +
                                                "<input type=\"text\" name=\"section\" style=\"display:none\" value="+ "\'" + articles.get(10).getSection() + "\'" + ">" +
                                                articles.get(10).getSection() +
                                            "</a>" +
                                        "</form>" +
                                        " &nbsp > &nbsp " +
                                        "<form class=\"forms\" name=\"subsection10\"action=\"index.jsp\" method=\"GET\">" +
                                            "<a href=\"javascript: submitSubsection(10)\">" +
                                                "<input type=\"text\" name=\"subsection\" style=\"display:none\" value="+ "\'" + articles.get(10).getSubsection() + "\'" + ">" +
                                                articles.get(10).getSubsection() +
                                            "</a>" +
                                        "</form>" +
									"</strong>" +
								"</div>" +
								"<div class=\"news-title-small\" onclick=\"toggle2();return false;\">" +
									articles.get(10).getTitle() +
								"</div>" +
								"<div class=\"slider closed news-subtitle-small\" id=\"slider6\">" +
									articles.get(10).getAbstract_() +
									"<br>" + "<br>" +
									"<strong>" +
										"By " +
									"</strong>" +
									"<form class=\"forms\" name=\"author10\"action=\"index.jsp\" method=\"GET\">" +
                                        "<a href=\"javascript: submitAuthor(10)\">" +
                                            "<input type=\"text\" name=\"author\" style=\"display:none\" value=\'" + articles.get(10).getAuthor() + "\'" + ">" +
                                            articles.get(10).getAuthor() +
                                        "</a>" +
                                    "</form>" +
									"<br>" + "<br>" +
									"<span>" +
										"<strong>" +
											"Tags: " +
										"</strong>" );
										if(articles.get(10).getSubjects_description()!=null) {
											for (int i=0;i<articles.get(10).getSubjects_description().size();i++) {
												out.println(
													"<form class=\"forms\" name=\"tagSub10"+i+"\"action=\"index.jsp\" method=\"GET\">" +
                                                        "<a href=\"javascript: submitTagSub(10"+i+")\">" +
                                                            "<input type=\"text\" name=\"tagSub\" style=\"display:none\" value=\'" + articles.get(10).getSubjects_description().get(i) + "\'" + ">#" +
                                                            articles.get(10).getSubjects_description().get(i).replaceAll(" ","") +
                                                        "</a>" +
                                                    "</form>"
												);
											}
										}
										if(articles.get(10).getOrganizations()!=null) {
											for (int i=0;i<articles.get(10).getOrganizations().size();i++) {
												out.println(
													"<form class=\"forms\" name=\"tagOrg10"+i+"\"action=\"index.jsp\" method=\"GET\">" +
                                                        "<a href=\"javascript: submitTagOrg(10"+i+")\">" +
                                                            "<input type=\"text\" name=\"tagOrg\" style=\"display:none\" value=\'" + articles.get(10).getOrganizations().get(i) + "\'" + ">#" +
                                                            articles.get(10).getOrganizations().get(i).replaceAll(" ","") +
                                                        "</a>" +
                                                    "</form>"
												);
											}
										}
										if(articles.get(10).getPersons()!=null) {
											for (int i=0;i<articles.get(10).getPersons().size();i++) {
												out.println(
													"<form class=\"forms\" name=\"tagPer10"+i+"\"action=\"index.jsp\" method=\"GET\">" +
                                                        "<a href=\"javascript: submitTagPer(10"+i+")\">" +
                                                            "<input type=\"text\" name=\"tagPer\" style=\"display:none\" value=\'" + articles.get(10).getPersons().get(i) + "\'" + ">#" +
                                                            articles.get(10).getPersons().get(i).replaceAll(" ","") +
                                                        "</a>" +
                                                    "</form>"
												);
											}
										}
										if(articles.get(10).getLocations()!=null) {
											for (int i=0;i<articles.get(10).getLocations().size();i++) {
												out.println(
													"<form class=\"forms\" name=\"tagLoc10"+i+"\"action=\"index.jsp\" method=\"GET\">" +
                                                        "<a href=\"javascript: submitTagLoc(10"+i+")\">" +
                                                            "<input type=\"text\" name=\"tagLoc\" style=\"display:none\" value=\'" + articles.get(10).getLocations().get(i) + "\'" + ">#" +
                                                            articles.get(10).getLocations().get(i).replaceAll(" ","") +
                                                        "</a>" +
                                                    "</form>"
												);
											}
										}
									out.println(
									"</span>" +
									"<br>" +"<br>" +
									"<strong>" +
										"Published Date: " +
									"</strong>" +
										articles.get(10).getPublished_date().substring(0,10) +
									"<br>" + "<br>" +
									"<span>" +
									"<a href=\"" + articles.get(10).getUrl() + "\">Visit Article &#8594;</a>" +
									"</span>" +
									"<br>" + "<br>" +
								"</div>" +
							"</div>" +
						"</div>" +
					"</div> "
				);
			}
			if (number_articles >= 14) {
				out.println(
					"<div class=\"row\">" +
						"<div class=\"two columns\" onclick=\"toggle3();return false;\">" +
							"<div id=\"news-small3\" class=\"news-img news-small closed\" >" +
								"<img src=\"" + articles.get(11).getImage() + "\">" +
							"</div>" +
						"</div>" +
						"<div class=\"two columns\">" +
							"<div id=\"news-small3\" class=\"news-small closed\">" +
								"<div class=\"news-section-small\">" +
									"<strong>" +
										"<form class=\"forms\" name=\"section11\"action=\"index.jsp\" method=\"GET\">" +
                                            "<a href=\"javascript: submitSection(11)\">" +
                                                "<input type=\"text\" name=\"section\" style=\"display:none\" value="+ "\'" + articles.get(11).getSection() + "\'" + ">" +
                                                articles.get(11).getSection() +
                                            "</a>" +
                                        "</form>" +
                                        " &nbsp > &nbsp " +
                                        "<form class=\"forms\" name=\"subsection11\"action=\"index.jsp\" method=\"GET\">" +
                                            "<a href=\"javascript: submitSubsection(11)\">" +
                                                "<input type=\"text\" name=\"subsection\" style=\"display:none\" value="+ "\'" + articles.get(11).getSubsection() + "\'" + ">" +
                                                articles.get(11).getSubsection() +
                                            "</a>" +
                                        "</form>" +
									"</strong>" +
								"</div>" +
								"<div class=\"news-title-small\" onclick=\"toggle3();return false;\">" +
									articles.get(11).getTitle() +
								"</div>" +
								"<div class=\"slider closed news-subtitle-small\" id=\"slider7\">" +
									articles.get(11).getAbstract_() +
									"<br>" + "<br>" +
									"<strong>" +
										"By " +
									"</strong>" +
									"<form class=\"forms\" name=\"author11\"action=\"index.jsp\" method=\"GET\">" +
                                        "<a href=\"javascript: submitAuthor(11)\">" +
                                            "<input type=\"text\" name=\"author\" style=\"display:none\" value=\'" + articles.get(11).getAuthor() + "\'" + ">" +
                                            articles.get(11).getAuthor() +
                                        "</a>" +
                                    "</form>" +
									"<br>" + "<br>" +
									"<span>" +
										"<strong>" +
											"Tags: " +
										"</strong>" );
										if(articles.get(11).getSubjects_description()!=null) {
											for (int i=0;i<articles.get(11).getSubjects_description().size();i++) {
												out.println(
													"<form class=\"forms\" name=\"tagSub11"+i+"\"action=\"index.jsp\" method=\"GET\">" +
                                                        "<a href=\"javascript: submitTagSub(11"+i+")\">" +
                                                            "<input type=\"text\" name=\"tagSub\" style=\"display:none\" value=\'" + articles.get(11).getSubjects_description().get(i) + "\'" + ">#" +
                                                            articles.get(11).getSubjects_description().get(i).replaceAll(" ","") +
                                                        "</a>" +
                                                    "</form>"
												);
											}
										}
										if(articles.get(11).getOrganizations()!=null) {
											for (int i=0;i<articles.get(11).getOrganizations().size();i++) {
												out.println(
													"<form class=\"forms\" name=\"tagOrg11"+i+"\"action=\"index.jsp\" method=\"GET\">" +
                                                        "<a href=\"javascript: submitTagOrg(11"+i+")\">" +
                                                            "<input type=\"text\" name=\"tagOrg\" style=\"display:none\" value=\'" + articles.get(11).getOrganizations().get(i) + "\'" + ">#" +
                                                            articles.get(11).getOrganizations().get(i).replaceAll(" ","") +
                                                        "</a>" +
                                                    "</form>"
												);
											}
										}
										if(articles.get(11).getPersons()!=null) {
											for (int i=0;i<articles.get(11).getPersons().size();i++) {
												out.println(
													"<form class=\"forms\" name=\"tagPer11"+i+"\"action=\"index.jsp\" method=\"GET\">" +
                                                        "<a href=\"javascript: submitTagPer(11"+i+")\">" +
                                                            "<input type=\"text\" name=\"tagPer\" style=\"display:none\" value=\'" + articles.get(11).getPersons().get(i) + "\'" + ">#" +
                                                            articles.get(11).getPersons().get(i).replaceAll(" ","") +
                                                        "</a>" +
                                                    "</form>"
												);
											}
										}
										if(articles.get(11).getLocations()!=null) {
											for (int i=0;i<articles.get(11).getLocations().size();i++) {
												out.println(
													"<form class=\"forms\" name=\"tagLoc11"+i+"\"action=\"index.jsp\" method=\"GET\">" +
                                                        "<a href=\"javascript: submitTagLoc(11"+i+")\">" +
                                                            "<input type=\"text\" name=\"tagLoc\" style=\"display:none\" value=\'" + articles.get(11).getLocations().get(i) + "\'" + ">#" +
                                                            articles.get(11).getLocations().get(i).replaceAll(" ","") +
                                                        "</a>" +
                                                    "</form>"
												);
											}
										}
									out.println(
									"</span>" +
									"<br>" +"<br>" +
									"<strong>" +
										"Published Date: " +
									"</strong>" +
										articles.get(11).getPublished_date().substring(0,10) +
									"<br>" + "<br>" +
									"<span>" +
									"<a href=\"" + articles.get(11).getUrl() + "\">Visit Article &#8594;</a>" +
									"</span>" +
									"<br>" + "<br>" +
								"</div>" +
							"</div>" +
						"</div>" +
						"<div class=\"two columns\" onclick=\"toggle3();return false;\">" +
							"<div id=\"news-small3\" class=\"news-img news-small closed\" >" +
								"<img src=\"" + articles.get(12).getImage() + "\">" +
							"</div>" +
						"</div>" +
						"<div class=\"two columns\">" +
							"<div id=\"news-small3\" class=\"news-small closed\">" +
								"<div class=\"news-section-small\">" +
									"<strong>" +
										"<form class=\"forms\" name=\"section12\"action=\"index.jsp\" method=\"GET\">" +
                                            "<a href=\"javascript: submitSection(12)\">" +
                                                "<input type=\"text\" name=\"section\" style=\"display:none\" value="+ "\'" + articles.get(12).getSection() + "\'" + ">" +
                                                articles.get(12).getSection() +
                                            "</a>" +
                                        "</form>" +
                                        " &nbsp > &nbsp " +
                                        "<form class=\"forms\" name=\"subsection12\"action=\"index.jsp\" method=\"GET\">" +
                                            "<a href=\"javascript: submitSubsection(12)\">" +
                                                "<input type=\"text\" name=\"subsection\" style=\"display:none\" value="+ "\'" + articles.get(12).getSubsection() + "\'" + ">" +
                                                articles.get(12).getSubsection() +
                                            "</a>" +
                                        "</form>" +
									"</strong>" +
								"</div>" +
								"<div class=\"news-title-small\" onclick=\"toggle3();return false;\">" +
									articles.get(12).getTitle() +
								"</div>" +
								"<div class=\"slider closed news-subtitle-small\" id=\"slider8\">" +
									articles.get(12).getAbstract_() +
									"<br>" + "<br>" +
									"<strong>" +
										"By " +
									"</strong>" +
									"<form class=\"forms\" name=\"author12\"action=\"index.jsp\" method=\"GET\">" +
                                        "<a href=\"javascript: submitAuthor(12)\">" +
                                            "<input type=\"text\" name=\"author\" style=\"display:none\" value=\'" + articles.get(12).getAuthor() + "\'" + ">" +
                                            articles.get(12).getAuthor() +
                                        "</a>" +
                                    "</form>" +
									"<br>" + "<br>" +
									"<span>" +
										"<strong>" +
											"Tags: " +
										"</strong>" );
										if(articles.get(12).getSubjects_description()!=null) {
											for (int i=0;i<articles.get(12).getSubjects_description().size();i++) {
												out.println(
													"<form class=\"forms\" name=\"tagSub12"+i+"\"action=\"index.jsp\" method=\"GET\">" +
                                                        "<a href=\"javascript: submitTagSub(12"+i+")\">" +
                                                            "<input type=\"text\" name=\"tagSub\" style=\"display:none\" value=\'" + articles.get(12).getSubjects_description().get(i) + "\'" + ">#" +
                                                            articles.get(12).getSubjects_description().get(i).replaceAll(" ","") +
                                                        "</a>" +
                                                    "</form>"
												);
											}
										}
										if(articles.get(12).getOrganizations()!=null) {
											for (int i=0;i<articles.get(12).getOrganizations().size();i++) {
												out.println(
													"<form class=\"forms\" name=\"tagOrg12"+i+"\"action=\"index.jsp\" method=\"GET\">" +
                                                        "<a href=\"javascript: submitTagOrg(12"+i+")\">" +
                                                            "<input type=\"text\" name=\"tagOrg\" style=\"display:none\" value=\'" + articles.get(12).getOrganizations().get(i) + "\'" + ">#" +
                                                            articles.get(12).getOrganizations().get(i).replaceAll(" ","") +
                                                        "</a>" +
                                                    "</form>"
												);
											}
										}
										if(articles.get(12).getPersons()!=null) {
											for (int i=0;i<articles.get(12).getPersons().size();i++) {
												out.println(
													"<form class=\"forms\" name=\"tagPer12"+i+"\"action=\"index.jsp\" method=\"GET\">" +
                                                        "<a href=\"javascript: submitTagPer(12"+i+")\">" +
                                                            "<input type=\"text\" name=\"tagPer\" style=\"display:none\" value=\'" + articles.get(12).getPersons().get(i) + "\'" + ">#" +
                                                            articles.get(12).getPersons().get(i).replaceAll(" ","") +
                                                        "</a>" +
                                                    "</form>"
												);
											}
										}
										if(articles.get(12).getLocations()!=null) {
											for (int i=0;i<articles.get(12).getLocations().size();i++) {
												out.println(
													"<form class=\"forms\" name=\"tagLoc12"+i+"\"action=\"index.jsp\" method=\"GET\">" +
                                                        "<a href=\"javascript: submitTagLoc(12"+i+")\">" +
                                                            "<input type=\"text\" name=\"tagLoc\" style=\"display:none\" value=\'" + articles.get(12).getLocations().get(i) + "\'" + ">#" +
                                                            articles.get(12).getLocations().get(i).replaceAll(" ","") +
                                                        "</a>" +
                                                    "</form>"
												);
											}
										}
									out.println(
									"</span>" +
									"<br>" +"<br>" +
									"<strong>" +
										"Published Date: " +
									"</strong>" +
										articles.get(12).getPublished_date().substring(0,10) +
									"<br>" + "<br>" +
									"<span>" +
									"<a href=\"" + articles.get(12).getUrl() + "\">Visit Article &#8594;</a>" +
									"</span>" +
									"<br>" + "<br>" +
								"</div>" +
							"</div>" +
						"</div>" +
						"<div class=\"two columns\" onclick=\"toggle3();return false;\">" +
							"<div id=\"news-small3\" class=\"news-img news-small closed\" >" +
								"<img src=\"" + articles.get(13).getImage() + "\">" +
							"</div>" +
						"</div>" +
						"<div class=\"two columns\">" +
							"<div id=\"news-small3\" class=\"news-small closed\">" +
								"<div class=\"news-section-small\">" +
									"<strong>" +
										"<form class=\"forms\" name=\"section13\"action=\"index.jsp\" method=\"GET\">" +
                                            "<a href=\"javascript: submitSection(13)\">" +
                                                "<input type=\"text\" name=\"section\" style=\"display:none\" value="+ "\'" + articles.get(13).getSection() + "\'" + ">" +
                                                articles.get(13).getSection() +
                                            "</a>" +
                                        "</form>" +
                                        " &nbsp > &nbsp " +
                                        "<form class=\"forms\" name=\"subsection13\"action=\"index.jsp\" method=\"GET\">" +
                                            "<a href=\"javascript: submitSubsection(13)\">" +
                                                "<input type=\"text\" name=\"subsection\" style=\"display:none\" value="+ "\'" + articles.get(13).getSubsection() + "\'" + ">" +
                                                articles.get(13).getSubsection() +
                                            "</a>" +
                                        "</form>" +
									"</strong>" +
								"</div>" +
								"<div class=\"news-title-small\" onclick=\"toggle3();return false;\">" +
									articles.get(13).getTitle() +
								"</div>" +
								"<div class=\"slider closed news-subtitle-small\" id=\"slider9\">" +
									articles.get(13).getAbstract_() +
									"<br>" + "<br>" +
									"<strong>" +
										"By " +
									"</strong>" +
									"<form class=\"forms\" name=\"author13\"action=\"index.jsp\" method=\"GET\">" +
                                        "<a href=\"javascript: submitAuthor(13)\">" +
                                            "<input type=\"text\" name=\"author\" style=\"display:none\" value=\'" + articles.get(13).getAuthor() + "\'" + ">" +
                                            articles.get(13).getAuthor() +
                                        "</a>" +
                                    "</form>" +
									"<br>" + "<br>" +
									"<span>" +
										"<strong>" +
											"Tags: " +
										"</strong>" );
										if(articles.get(13).getSubjects_description()!=null) {
											for (int i=0;i<articles.get(13).getSubjects_description().size();i++) {
												out.println(
													"<form class=\"forms\" name=\"tagSub13"+i+"\"action=\"index.jsp\" method=\"GET\">" +
                                                        "<a href=\"javascript: submitTagSub(13"+i+")\">" +
                                                            "<input type=\"text\" name=\"tagSub\" style=\"display:none\" value=\'" + articles.get(13).getSubjects_description().get(i) + "\'" + ">#" +
                                                            articles.get(13).getSubjects_description().get(i).replaceAll(" ","") +
                                                        "</a>" +
                                                    "</form>"
												);
											}
										}
										if(articles.get(13).getOrganizations()!=null) {
											for (int i=0;i<articles.get(13).getOrganizations().size();i++) {
												out.println(
													"<form class=\"forms\" name=\"tagOrg13"+i+"\"action=\"index.jsp\" method=\"GET\">" +
                                                        "<a href=\"javascript: submitTagOrg(13"+i+")\">" +
                                                            "<input type=\"text\" name=\"tagOrg\" style=\"display:none\" value=\'" + articles.get(13).getOrganizations().get(i) + "\'" + ">#" +
                                                            articles.get(13).getOrganizations().get(i).replaceAll(" ","") +
                                                        "</a>" +
                                                    "</form>"
												);
											}
										}
										if(articles.get(13).getPersons()!=null) {
											for (int i=0;i<articles.get(13).getPersons().size();i++) {
												out.println(
													"<form class=\"forms\" name=\"tagPer13"+i+"\"action=\"index.jsp\" method=\"GET\">" +
                                                        "<a href=\"javascript: submitTagPer(13"+i+")\">" +
                                                            "<input type=\"text\" name=\"tagPer\" style=\"display:none\" value=\'" + articles.get(13).getPersons().get(i) + "\'" + ">#" +
                                                            articles.get(13).getPersons().get(i).replaceAll(" ","") +
                                                        "</a>" +
                                                    "</form>"
												);
											}
										}
										if(articles.get(13).getLocations()!=null) {
											for (int i=0;i<articles.get(13).getLocations().size();i++) {
												out.println(
													"<form class=\"forms\" name=\"tagLoc13"+i+"\"action=\"index.jsp\" method=\"GET\">" +
                                                        "<a href=\"javascript: submitTagLoc(13"+i+")\">" +
                                                            "<input type=\"text\" name=\"tagLoc\" style=\"display:none\" value=\'" + articles.get(13).getLocations().get(i) + "\'" + ">#" +
                                                            articles.get(13).getLocations().get(i).replaceAll(" ","") +
                                                        "</a>" +
                                                    "</form>"
												);
											}
										}
									out.println(
									"</span>" +
									"<br>" +"<br>" +
									"<strong>" +
										"Published Date: " +
									"</strong>" +
										articles.get(13).getPublished_date().substring(0,10) +
									"<br>" + "<br>" +
									"<span>" +
									"<a href=\"" + articles.get(13).getUrl() + "\">Visit Article &#8594;</a>" +
									"</span>" +
									"<br>" + "<br>" +
								"</div>" +
							"</div>" +
						"</div>" +
					"</div> "
				);
			}
			if (number_articles >= 17) {
				out.println(
					"<div class=\"row\">" +
						"<div class=\"two columns\" onclick=\"toggle4();return false;\">" +
							"<div id=\"news-small4\" class=\"news-img news-small closed\" >" +
								"<img src=\"" + articles.get(14).getImage() + "\">" +
							"</div>" +
						"</div>" +
						"<div class=\"two columns\">" +
							"<div id=\"news-small4\" class=\"news-small closed\">" +
								"<div class=\"news-section-small\">" +
									"<strong>" +
										"<form class=\"forms\" name=\"section14\"action=\"index.jsp\" method=\"GET\">" +
                                            "<a href=\"javascript: submitSection(14)\">" +
                                                "<input type=\"text\" name=\"section\" style=\"display:none\" value="+ "\'" + articles.get(14).getSection() + "\'" + ">" +
                                                articles.get(14).getSection() +
                                            "</a>" +
                                        "</form>" +
                                        " &nbsp > &nbsp " +
                                        "<form class=\"forms\" name=\"subsection14\"action=\"index.jsp\" method=\"GET\">" +
                                            "<a href=\"javascript: submitSubsection(14)\">" +
                                                "<input type=\"text\" name=\"subsection\" style=\"display:none\" value="+ "\'" + articles.get(14).getSubsection() + "\'" + ">" +
                                                articles.get(14).getSubsection() +
                                            "</a>" +
                                        "</form>" +
									"</strong>" +
								"</div>" +
								"<div class=\"news-title-small\" onclick=\"toggle4();return false;\">" +
									articles.get(14).getTitle() +
								"</div>" +
								"<div class=\"slider closed news-subtitle-small\" id=\"slider10\">" +
									articles.get(14).getAbstract_() +
									"<br>" + "<br>" +
									"<strong>" +
										"By " +
									"</strong>" +
									"<form class=\"forms\" name=\"author14\"action=\"index.jsp\" method=\"GET\">" +
                                        "<a href=\"javascript: submitAuthor(14)\">" +
                                            "<input type=\"text\" name=\"author\" style=\"display:none\" value=\'" + articles.get(14).getAuthor() + "\'" + ">" +
                                            articles.get(14).getAuthor() +
                                        "</a>" +
                                    "</form>" +
									"<br>" + "<br>" +
									"<span>" +
										"<strong>" +
											"Tags: " +
										"</strong>" );
										if(articles.get(14).getSubjects_description()!=null) {
											for (int i=0;i<articles.get(14).getSubjects_description().size();i++) {
												out.println(
													"<form class=\"forms\" name=\"tagSub14"+i+"\"action=\"index.jsp\" method=\"GET\">" +
                                                        "<a href=\"javascript: submitTagSub(14"+i+")\">" +
                                                            "<input type=\"text\" name=\"tagSub\" style=\"display:none\" value=\'" + articles.get(14).getSubjects_description().get(i) + "\'" + ">#" +
                                                            articles.get(14).getSubjects_description().get(i).replaceAll(" ","") +
                                                        "</a>" +
                                                    "</form>"
												);
											}
										}
										if(articles.get(14).getOrganizations()!=null) {
											for (int i=0;i<articles.get(14).getOrganizations().size();i++) {
												out.println(
													"<form class=\"forms\" name=\"tagOrg14"+i+"\"action=\"index.jsp\" method=\"GET\">" +
                                                        "<a href=\"javascript: submitTagOrg(14"+i+")\">" +
                                                            "<input type=\"text\" name=\"tagOrg\" style=\"display:none\" value=\'" + articles.get(14).getOrganizations().get(i) + "\'" + ">#" +
                                                            articles.get(14).getOrganizations().get(i).replaceAll(" ","") +
                                                        "</a>" +
                                                    "</form>"
												);
											}
										}
										if(articles.get(14).getPersons()!=null) {
											for (int i=0;i<articles.get(14).getPersons().size();i++) {
												out.println(
													"<form class=\"forms\" name=\"tagPer14"+i+"\"action=\"index.jsp\" method=\"GET\">" +
                                                        "<a href=\"javascript: submitTagPer(14"+i+")\">" +
                                                            "<input type=\"text\" name=\"tagPer\" style=\"display:none\" value=\'" + articles.get(14).getPersons().get(i) + "\'" + ">#" +
                                                            articles.get(14).getPersons().get(i).replaceAll(" ","") +
                                                        "</a>" +
                                                    "</form>"
												);
											}
										}
										if(articles.get(14).getLocations()!=null) {
											for (int i=0;i<articles.get(14).getLocations().size();i++) {
												out.println(
													"<form class=\"forms\" name=\"tagLoc14"+i+"\"action=\"index.jsp\" method=\"GET\">" +
                                                        "<a href=\"javascript: submitTagLoc(14"+i+")\">" +
                                                            "<input type=\"text\" name=\"tagLoc\" style=\"display:none\" value=\'" + articles.get(14).getLocations().get(i) + "\'" + ">#" +
                                                            articles.get(14).getLocations().get(i).replaceAll(" ","") +
                                                        "</a>" +
                                                    "</form>"
												);
											}
										}
									out.println(
									"</span>" +
									"<br>" +"<br>" +
									"<strong>" +
										"Published Date: " +
									"</strong>" +
										articles.get(14).getPublished_date().substring(0,10) +
									"<br>" + "<br>" +
									"<span>" +
									"<a href=\"" + articles.get(14).getUrl() + "\">Visit Article &#8594;</a>" +
									"</span>" +
									"<br>" + "<br>" +
								"</div>" +
							"</div>" +
						"</div>" +
						"<div class=\"two columns\" onclick=\"toggle4();return false;\">" +
							"<div id=\"news-small4\" class=\"news-img news-small closed\" >" +
								"<img src=\"" + articles.get(15).getImage() + "\">" +
							"</div>" +
						"</div>" +
						"<div class=\"two columns\">" +
							"<div id=\"news-small4\" class=\"news-small closed\">" +
								"<div class=\"news-section-small\">" +
									"<strong>" +
										"<form class=\"forms\" name=\"section15\"action=\"index.jsp\" method=\"GET\">" +
                                            "<a href=\"javascript: submitSection(15)\">" +
                                                "<input type=\"text\" name=\"section\" style=\"display:none\" value="+ "\'" + articles.get(15).getSection() + "\'" + ">" +
                                                articles.get(15).getSection() +
                                            "</a>" +
                                        "</form>" +
                                        " &nbsp > &nbsp " +
                                        "<form class=\"forms\" name=\"subsection15\"action=\"index.jsp\" method=\"GET\">" +
                                            "<a href=\"javascript: submitSubsection(15)\">" +
                                                "<input type=\"text\" name=\"subsection\" style=\"display:none\" value="+ "\'" + articles.get(15).getSubsection() + "\'" + ">" +
                                                articles.get(15).getSubsection() +
                                            "</a>" +
                                        "</form>" +
									"</strong>" +
								"</div>" +
								"<div class=\"news-title-small\" onclick=\"toggle4();return false;\">" +
									articles.get(15).getTitle() +
								"</div>" +
								"<div class=\"slider closed news-subtitle-small\" id=\"slider11\">" +
									articles.get(15).getAbstract_() +
									"<br>" + "<br>" +
									"<strong>" +
										"By " +
									"</strong>" +
									"<form class=\"forms\" name=\"author15\"action=\"index.jsp\" method=\"GET\">" +
                                        "<a href=\"javascript: submitAuthor(15)\">" +
                                            "<input type=\"text\" name=\"author\" style=\"display:none\" value=\'" + articles.get(15).getAuthor() + "\'" + ">" +
                                            articles.get(15).getAuthor() +
                                        "</a>" +
                                    "</form>" +
									"<br>" + "<br>" +
									"<span>" +
										"<strong>" +
											"Tags: " +
										"</strong>" );
										if(articles.get(15).getSubjects_description()!=null) {
											for (int i=0;i<articles.get(15).getSubjects_description().size();i++) {
												out.println(
													"<form class=\"forms\" name=\"tagSub15"+i+"\"action=\"index.jsp\" method=\"GET\">" +
                                                        "<a href=\"javascript: submitTagSub(15"+i+")\">" +
                                                            "<input type=\"text\" name=\"tagSub\" style=\"display:none\" value=\'" + articles.get(15).getSubjects_description().get(i) + "\'" + ">#" +
                                                            articles.get(15).getSubjects_description().get(i).replaceAll(" ","") +
                                                        "</a>" +
                                                    "</form>"
												);
											}
										}
										if(articles.get(15).getOrganizations()!=null) {
											for (int i=0;i<articles.get(15).getOrganizations().size();i++) {
												out.println(
													"<form class=\"forms\" name=\"tagOrg15"+i+"\"action=\"index.jsp\" method=\"GET\">" +
                                                        "<a href=\"javascript: submitTagOrg(15"+i+")\">" +
                                                            "<input type=\"text\" name=\"tagOrg\" style=\"display:none\" value=\'" + articles.get(15).getOrganizations().get(i) + "\'" + ">#" +
                                                            articles.get(15).getOrganizations().get(i).replaceAll(" ","") +
                                                        "</a>" +
                                                    "</form>"
												);
											}
										}
										if(articles.get(15).getPersons()!=null) {
											for (int i=0;i<articles.get(15).getPersons().size();i++) {
												out.println(
													"<form class=\"forms\" name=\"tagPer15"+i+"\"action=\"index.jsp\" method=\"GET\">" +
                                                        "<a href=\"javascript: submitTagPer(15"+i+")\">" +
                                                            "<input type=\"text\" name=\"tagPer\" style=\"display:none\" value=\'" + articles.get(15).getPersons().get(i) + "\'" + ">#" +
                                                            articles.get(15).getPersons().get(i).replaceAll(" ","") +
                                                        "</a>" +
                                                    "</form>"
												);
											}
										}
										if(articles.get(15).getLocations()!=null) {
											for (int i=0;i<articles.get(15).getLocations().size();i++) {
												out.println(
													"<form class=\"forms\" name=\"tagLoc15"+i+"\"action=\"index.jsp\" method=\"GET\">" +
                                                        "<a href=\"javascript: submitTagLoc(15"+i+")\">" +
                                                            "<input type=\"text\" name=\"tagLoc\" style=\"display:none\" value=\'" + articles.get(15).getLocations().get(i) + "\'" + ">#" +
                                                            articles.get(15).getLocations().get(i).replaceAll(" ","") +
                                                        "</a>" +
                                                    "</form>"
												);
											}
										}
									out.println(
									"</span>" +
									"<br>" +"<br>" +
									"<strong>" +
										"Published Date: " +
									"</strong>" +
										articles.get(15).getPublished_date().substring(0,10) +
									"<br>" + "<br>" +
									"<span>" +
									"<a href=\"" + articles.get(15).getUrl() + "\">Visit Article &#8594;</a>" +
									"</span>" +
									"<br>" + "<br>" +
								"</div>" +
							"</div>" +
						"</div>" +
						"<div class=\"two columns\" onclick=\"toggle4();return false;\">" +
							"<div id=\"news-small4\" class=\"news-img news-small closed\" >" +
								"<img src=\"" + articles.get(16).getImage() + "\">" +
							"</div>" +
						"</div>" +
						"<div class=\"two columns\">" +
							"<div id=\"news-small4\" class=\"news-small closed\">" +
								"<div class=\"news-section-small\">" +
									"<strong>" +
										"<form class=\"forms\" name=\"section16\"action=\"index.jsp\" method=\"GET\">" +
                                            "<a href=\"javascript: submitSection(16)\">" +
                                                "<input type=\"text\" name=\"section\" style=\"display:none\" value="+ "\'" + articles.get(16).getSection() + "\'" + ">" +
                                                articles.get(16).getSection() +
                                            "</a>" +
                                        "</form>" +
                                        " &nbsp > &nbsp " +
                                        "<form class=\"forms\" name=\"subsection16\"action=\"index.jsp\" method=\"GET\">" +
                                            "<a href=\"javascript: submitSubsection(16)\">" +
                                                "<input type=\"text\" name=\"subsection\" style=\"display:none\" value="+ "\'" + articles.get(16).getSubsection() + "\'" + ">" +
                                                articles.get(16).getSubsection() +
                                            "</a>" +
                                        "</form>" +
									"</strong>" +
								"</div>" +
								"<div class=\"news-title-small\" onclick=\"toggle4();return false;\">" +
									articles.get(16).getTitle() +
								"</div>" +
								"<div class=\"slider closed news-subtitle-small\" id=\"slider12\">" +
									articles.get(16).getAbstract_() +
									"<br>" + "<br>" +
									"<strong>" +
										"By " +
									"</strong>" +
									"<form class=\"forms\" name=\"author16\"action=\"index.jsp\" method=\"GET\">" +
                                        "<a href=\"javascript: submitAuthor(16)\">" +
                                            "<input type=\"text\" name=\"author\" style=\"display:none\" value=\'" + articles.get(16).getAuthor() + "\'" + ">" +
                                            articles.get(16).getAuthor() +
                                        "</a>" +
                                    "</form>" +
									"<br>" + "<br>" +
									"<span>" +
										"<strong>" +
											"Tags: " +
										"</strong>" );
										if(articles.get(16).getSubjects_description()!=null) {
											for (int i=0;i<articles.get(16).getSubjects_description().size();i++) {
												out.println(
													"<form class=\"forms\" name=\"tagSub16"+i+"\"action=\"index.jsp\" method=\"GET\">" +
                                                        "<a href=\"javascript: submitTagSub(16"+i+")\">" +
                                                            "<input type=\"text\" name=\"tagSub\" style=\"display:none\" value=\'" + articles.get(16).getSubjects_description().get(i) + "\'" + ">#" +
                                                            articles.get(16).getSubjects_description().get(i).replaceAll(" ","") +
                                                        "</a>" +
                                                    "</form>"
												);
											}
										}
										if(articles.get(16).getOrganizations()!=null) {
											for (int i=0;i<articles.get(16).getOrganizations().size();i++) {
												out.println(
													"<form class=\"forms\" name=\"tagOrg16"+i+"\"action=\"index.jsp\" method=\"GET\">" +
                                                        "<a href=\"javascript: submitTagOrg(16"+i+")\">" +
                                                            "<input type=\"text\" name=\"tagOrg\" style=\"display:none\" value=\'" + articles.get(16).getOrganizations().get(i) + "\'" + ">#" +
                                                            articles.get(16).getOrganizations().get(i).replaceAll(" ","") +
                                                        "</a>" +
                                                    "</form>"
												);
											}
										}
										if(articles.get(16).getPersons()!=null) {
											for (int i=0;i<articles.get(16).getPersons().size();i++) {
												out.println(
													"<form class=\"forms\" name=\"tagPer16"+i+"\"action=\"index.jsp\" method=\"GET\">" +
                                                        "<a href=\"javascript: submitTagPer(16"+i+")\">" +
                                                            "<input type=\"text\" name=\"tagPer\" style=\"display:none\" value=\'" + articles.get(16).getPersons().get(i) + "\'" + ">#" +
                                                            articles.get(16).getPersons().get(i).replaceAll(" ","") +
                                                        "</a>" +
                                                    "</form>"
												);
											}
										}
										if(articles.get(16).getLocations()!=null) {
											for (int i=0;i<articles.get(16).getLocations().size();i++) {
												out.println(
													"<form class=\"forms\" name=\"tagLoc16"+i+"\"action=\"index.jsp\" method=\"GET\">" +
                                                        "<a href=\"javascript: submitTagLoc(16"+i+")\">" +
                                                            "<input type=\"text\" name=\"tagLoc\" style=\"display:none\" value=\'" + articles.get(16).getLocations().get(i) + "\'" + ">#" +
                                                            articles.get(16).getLocations().get(i).replaceAll(" ","") +
                                                        "</a>" +
                                                    "</form>"
												);
											}
										}
									out.println(
									"</span>" +
									"<br>" +"<br>" +
									"<strong>" +
										"Published Date: " +
									"</strong>" +
										articles.get(16).getPublished_date().substring(0,10) +
									"<br>" + "<br>" +
									"<span>" +
									"<a href=\"" + articles.get(16).getUrl() + "\">Visit Article &#8594;</a>" +
									"</span>" +
									"<br>" + "<br>" +
								"</div>" +
							"</div>" +
						"</div>" +
					"</div> "
				);
			}
		%>
		<script type="text/javascript" src="js/style.js"></script>
	</body>
</html>
