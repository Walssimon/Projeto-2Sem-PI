<%@page import="model.Filme"%>
<%
    Filme filme = new Filme();
   String idzinho = request.getParameter("valor");
    int idzao = Integer.valueOf(idzinho);
    filme.deletar(idzao);
%>
<html>
    <head>
        <title>title</title>
    </head>
    <body>
        <h1><%=filme.statusSQL%></h1>
    </body>
</html>

 <script>
        // Redireciona para uma nova aba após 2 segundos
        setTimeout(function() {
           window.location.replace('HomeAdmin.jsp');
        }); // Tempo em milissegundos (2 segundos)
    </script>