<%
    session.removeAttribute("usuarioLogado");
    response.sendRedirect("login.html"); // Redireciona para a página de login após logout
%>
