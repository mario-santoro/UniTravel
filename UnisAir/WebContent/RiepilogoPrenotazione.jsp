<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="model.Utente"%>
<%@page import="model.Prenotazione"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>UnisAir</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<link rel="icon" href="img/ms-icon-310x310.png" />
<link href="https://fonts.googleapis.com/css?family=Roboto+Condensed"
	rel="stylesheet">

<script src="js/jquery.js"></script>


<script src="js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Raleway"
	rel="stylesheet">

<link rel="stylesheet" href="css/template.css" type="text/css">
<link rel="stylesheet" href="css/Riepilogo.css" type="text/css">


</head>
<body>

	<%Utente u=(Utente)session.getAttribute("userBean");%>
	<%Prenotazione pA=(Prenotazione)session.getAttribute("prenotazioneA");%>
	<%Prenotazione pR=(Prenotazione)session.getAttribute("prenotazioneR");%>
<%String tipoP=(String)session.getAttribute("tipoP"); %>
	<!-- NAVBAR -->
	<nav>
		<a href="index.jsp"> <img src="img/logo.png" width="200"
			height="100" alt="">
		</a> <a> <span class="l"><span class="glyphicon glyphicon-user"></span>
				<%=u.getNome() %></span>
		</a>
		<div id="menu">
			<div id="contenutimenu">
				<a href="Storico" class="link">Storico</a> <br> <a
					href="ModificaUtente.jsp" class="link">Modifica dati</a> <br>

				<a href="Logout" class="link">Logout</a>
			</div>
		</div>



	</nav>

	<div class="spazio"></div>

	<h2>Riepilogo</h2>
	<br>

	<div id="modificadati">

		<form method="post" action="SalvaPrenotazione">

			<div class="dati">
				<%if(pR==null){ %>
				Volo num: <span id="numVolo" class="special"><%=pA.getVolo().getCodVolo() %></span>
				<%}else{ %>
				Volo andata num: <span id="numVolo" class="special"><%=pA.getVolo().getCodVolo() %></span>
				Volo ritorno num: <span id="numVolo" class="special"><%=pR.getVolo().getCodVolo() %></span>
				<%} %>
			</div>

			<br>


			<%for(int i=0; i<pA.getPasseggeri().size();i++){ %>
			<div id="RiepilogoUtente">
				Nome: <span id="nome" class="special"> <%=pA.getPasseggeri().get(i).getNome()%></span>
				Cognome: <span id="cognome" class="special"> <%=pA.getPasseggeri().get(i).getCognome()%></span>
				<br> Bagaglio/i: <span id="bagaglio" class="special"> <%=pA.getPasseggeri().get(i).getNumBagaglio()%></span>
				<%if(pR==null){ %>
				<br> Posto: <span id="posto" class="special"> <%=pA.getPasseggeri().get(i).getPosto()%></span>
				<%}else{ %>
				<br> Posto andata: <span id="posto" class="special"> <%=pA.getPasseggeri().get(i).getPosto()%></span>
				<br> Posto ritorno: <span id="posto" class="special"> <%=pR.getPasseggeri().get(i).getPosto()%></span>
				<%} %>
			
				
				<br>
			</div>

			<br> <br>

			<%} %>

			<div class="dati">

				Tipo carta: <span id="carta" class="special"><%=tipoP %></span> <br>
				Numero carta: <span id="NumCarta" class="special"><%=u.getNumCartaCredito() %>
				</span> <br> 
				Prezzo totale: <span id="numVolo" class="special">
					<%if(pR==null){ %>
				<%=pA.getPrezzoTotale() %>
				<%}else{ %>
				<%=pA.getPrezzoTotale()+pR.getPrezzoTotale() %>
				<%} %>
				 </span> <br> <br> <input
					id="IndietroRiepilogo" class="btnR" type="button" onClick="annulla()" value="Annulla" />
				<input id="ConfermaOrdine" class="btnR" type="submit"
					value="Conferma" />
			</div>


		</form>
	</div>

	<footer>
		<div id="imgContent">
			<img src="img/logoBianco.png" width="200" height="100" alt="">
			<div id="socialBar">
				<span id="labelSocial">Seguici su:</span> <span><a href="#"
					class="linkFooter"><img src="img/facebook.svg" width="32"
						height="32"></a></span> <span><a href="#" class="linkFooter"><img
						src="img/instagram.svg" width="32" height="32"></a></span> <span><a
					href="#" class="linkFooter"><img src="img/twitter.svg"
						width="32" height="32"></a></span> <span><a href="#"
					class="linkFooter"><img src="img/linkedin.svg" width="32"
						height="32"></a></span>
			</div>
		</div>
		<div id="contentWrapper">
			<div id="assistenza" class="footerComponent">
				<h5 class="text-uppercase">ASSISTENZA</h5>
				<a href="assistenza.jsp" class="linkFooter"><p>Domande
						frequenti</p></a> <a href="assistenza.jsp" class="linkFooter"><p>Check-in
						online</p></a> <a href="assistenza.jsp" class="linkFooter"><p>Metodi
						di pagamento</p></a> <a href="assistenza.jsp" class="linkFooter"><p>Bagagli</p></a>
				<a href="assistenza.jsp" class="linkFooter"><p>Ritardi e
						cancellazione</p></a>
			</div>
			<div id="contatti" class="footerComponent">
				<h5 class="text-uppercase">CONTATTI</h5>
				<a href="#" class="linkFooter"><p>Tel: 555-00000</p></a> <a href="#"
					class="linkFooter"><p>e-mail:info@unisair.com</p></a>

			</div>
			<div id="Partner" class="footerComponent">
				<h5 class="text-uppercase">BUSINESS PARTNERS</h5>
				<a href="#" class="linkFooter"><p>Affiliate marketing</p></a> <a
					href="#" class="linkFooter"><p>e-Procurement</p></a>

			</div>
		</div>
		<div id="infoFooter">
			<span class="titleInfo">UnisAir</span> <span class="info"><a
				href="#">Utilizzo dei cookie</a></span> <span class="info"><a
				href="#">Infotmazioni legali</a></span> <span class="info"><a
				href="#">Informativa sulla privacy</a></span>
		</div>

	</footer>


	<script type="text/JavaScript" src="js/jsTemplate.js"></script>
<script type="text/javascript">
function annulla() {
	  alert("tornando indietro la ricerca verr� annullata");
	window.location = "http://localhost:8080/UnisAir/index.jsp";
	}

</script>
</body>
</html>