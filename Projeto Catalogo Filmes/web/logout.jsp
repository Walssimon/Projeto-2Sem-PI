<%
    session.removeAttribute("usuarioLogado");
    response.sendRedirect("login.html"); // Redireciona para a p�gina de login ap�s logout
%>
