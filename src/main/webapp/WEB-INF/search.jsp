<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="fr">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>PariSup' !</title>

<!-- Bootstrap Core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Theme CSS -->
<link href="css/freelancer.min.css" rel="stylesheet">
<link href="css/freelancer.css" rel="stylesheet">
<link href="css/search.css" rel="stylesheet">


<!-- Custom Fonts -->
<link href="vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css">

<link href="css/login-navbar.css" rel="stylesheet">
</head>

<body id="page-top" class="index">

	<div id="navbar"></div>
	<div class="row">

		<section class="content">
			<div class="col-md-8 col-md-offset-2">
				<div class="panel panel-default">
					<div class="panel-body">

						<div class="pull-right">
							<div class="row">
								<div id="custom-search-input">
									<div class="input-group col-md-12">
										<form action="${pageContext.request.contextPath}/search"
											method="get">
											<input type="text" name="recherche"
												class="search-query form-control" placeholder="Search" /> <span
												class="input-group-btn"> <input type="submit"
												name="button_search" value="search"
												class="btn btn-danger btn-filter" data-target="cancelado" />
											</span>
										</form>
									</div>
								</div>
							</div>
						</div>

						<div class="container">
							<div class="btn-group">
								<form id="search_form" action="search" method="get">
									<p>Trier par :</p>
									<input type="submit" name="filter" value="alpha"
										class="btn btn-success btn-filter" data-target="pagado" /> <input
										type="submit" name="filter" value="note"
										class="btn btn-danger btn-filter" data-target="cancelado" />
									<p>Type d'établissement :</p>
									<input type="submit" name="filter" value="ecoles"
										class="btn btn-success btn-filter" data-target="pagado" /> <input
										type="submit" name="filter" value="instituts"
										class="btn btn-danger btn-filter" data-target="cancelado" />
									<input type="submit" name="filter" value="ufr"
										class="btn btn-success btn-filter" data-target="pagado" /> <input
										type="submit" name="filter" value="autre"
										class="btn btn-danger btn-filter" data-target="cancelado" />
								</form>
							</div>
						</div>

						<div class="table-container">
							<table class="table table-filter">
								<tbody>
									<c:forEach var="school" items="${schoolList}">
										<tr data-status="pagado">
											<td><a href="javascript:;" class="star"> <i
													class="glyphicon glyphicon-star"></i>
											</a></td>
											<td>
												<div class="media">
													<h4 class="title">
														<a id="show_school" href="search?uai=${school.code_uai}">${school.nom}</a>
													</h4>
													<p class="summary">${school.commune}</p>
													<p class="summary">${school.type_d_etablissement}</p>
													<p class="summary">${school.universite}</p>
												</div>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>

						<%--For displaying Previous link except for the 1st page --%>
						<form action="${pageContext.request.contextPath}/search"
							method="get">
							<c:if test="${currentPage != 1}">
								<td><a href="search?page=${currentPage - 1}">Previous</a></td>
							</c:if>
						</form>

						<%--For displaying Page numbers. 
	The when condition does not display a link for the current page--%>
						<div class="table-container">
							<table class="table table-filter">
								<tbody>
									<tr>
										<c:forEach begin="1" end="${noOfPages}" var="i">
											<c:choose>
												<c:when test="${currentPage eq i}">
													<td>${i}</td>
												</c:when>
												<c:otherwise>
													<form action="${pageContext.request.contextPath}/search"
														method="get">
														<input type="submit" name="page" value="${i}" />
														<%-- <a href="search?page=${i}">${i}</a> --%>
													</form>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</tr>
								</tbody>
							</table>
						</div>

						<%--For displaying Next link --%>
						<form action="${pageContext.request.contextPath}/search"
							method="get">
							<c:if test="${currentPage lt noOfPages}">
								<input type="submit" name="page" value="${currentPage + 1}" />

								<%--<td><a href="search?page=${currentPage + 1}">Next</a></td>--%>
							</c:if>
						</form>
					</div>
				</div>
			</div>
		</section>

	</div>

	<div id="footer"></div>

	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="vendor/popper/popper.min.js"></script>
	<script src="vendor/js/js.cookie.js"></script>
	<script src="js/showNavbar.js"></script>
	<script src="js/showFooter.js"></script>
</body>

</html>