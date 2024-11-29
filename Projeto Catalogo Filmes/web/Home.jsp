
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Usuario"%>
<%@page import="model.Filme"%>
<%@page import="java.util.ArrayList"%>

<% 

Usuario userLogado = (Usuario) session.getAttribute("usuarioLogado");

Filme filmeT = new Filme();
int idFilme = 0;

ArrayList<Filme> lista = filmeT.listarFilmes();   

ArrayList<Filme> listaSlider = filmeT.buscaFilmes_Destaques(); 
 
String genero = request.getParameter("categoria");
String query = request.getParameter("query");

if(query != null && !query.trim().isEmpty()){
    filmeT.setNome(query);
    lista = filmeT.listarFilmes_PorNome();
}

if(genero != null && !genero.trim().isEmpty()){
    if (genero.equalsIgnoreCase("Todos")) {
        response.sendRedirect("Home.jsp");
    } else if (genero.equalsIgnoreCase("Romance")) {
        filmeT.setGenero(genero);
        lista = filmeT.listarFilmes_PorGenero();
    } else if (genero.equalsIgnoreCase("Acao")) {
        filmeT.setGenero(genero);
        lista = filmeT.listarFilmes_PorGenero();
    } else if (genero.equalsIgnoreCase("Aventura")) {
        filmeT.setGenero(genero);
        lista = filmeT.listarFilmes_PorGenero();
    } else if (genero.equalsIgnoreCase("Comedia")) {
        filmeT.setGenero(genero);
        lista = filmeT.listarFilmes_PorGenero();
    } else if (genero.equalsIgnoreCase("Desenho")) {
        filmeT.setGenero(genero);
        lista = filmeT.listarFilmes_PorGenero();
    } else if (genero.equalsIgnoreCase("Ficcao")) {
        filmeT.setGenero(genero);
        lista = filmeT.listarFilmes_PorGenero();
    } else if (genero.equalsIgnoreCase("Animacao")) {
        filmeT.setGenero(genero);
        lista = filmeT.listarFilmes_PorGenero();
    } else if (genero.equalsIgnoreCase("Documentario")) {
        filmeT.setGenero(genero);
        lista = filmeT.listarFilmes_PorGenero();
    } else if (genero.equalsIgnoreCase("Fantasia")) {
        filmeT.setGenero(genero);
        lista = filmeT.listarFilmes_PorGenero();
    } else if (genero.equalsIgnoreCase("Terror")) {
        filmeT.setGenero(genero);
        lista = filmeT.listarFilmes_PorGenero();
    } else if (genero.equalsIgnoreCase("Suspense")) {
        filmeT.setGenero(genero);
        lista = filmeT.listarFilmes_PorGenero();
    } else if (genero.equalsIgnoreCase("Musical")) {
        filmeT.setGenero(genero);
        lista = filmeT.listarFilmes_PorGenero();
    } else if (genero.equalsIgnoreCase("Familia")) {
        filmeT.setGenero(genero);
        lista = filmeT.listarFilmes_PorGenero();
    } else if (genero.equalsIgnoreCase("Misterio")) {
        filmeT.setGenero(genero);
        lista = filmeT.listarFilmes_PorGenero();
    } else if (genero.equalsIgnoreCase("Historico")) {
        filmeT.setGenero(genero);
        lista = filmeT.listarFilmes_PorGenero();
    }

 }
   
%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Feedback Cinema - Cliente</title>
    <link rel="stylesheet" href="global.css">
    <link rel="stylesheet" href="home.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100,200,300,400,500,600,700,800,900;1,100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">
</head>
<body>
    <!-- Carrossel -->
    <header class="big_container flex-center" id="Destaques">
      <div class="container">
        <a href="userPage.jsp" class="avatar_image flex-center">
                <%
                    if (userLogado == null) {
                        response.sendRedirect("login.jsp"); // Substitua "login.jsp" pela página de destino
                    }
                %>

            <img src="data:image/png;base64,<%if(userLogado.imagemBase64 != null)out.print(userLogado.imagemBase64);%>" alt="<%out.print(userLogado.email);%>">
        </a>
        <div class="container_carrossel">
          <div class="carousel">
            <img src="./imgs/destaque_foto.png" alt="Foto destaque" />
            <%for(Filme filme:listaSlider) {%>
                 <img src="data:image/png;base64,<%if(filme.capaimagemBase64 != null)out.print(filme.capaimagemBase64);%>" alt=""></img>
            <%}%>
          </div>
        </div>
      </div>
    </header>
    <main class="big_container flex-center">
        <div class="container">

            <!-- MENU DE FILTROS DO FILME -->
            <div class="cockpit_filmes flex">
                <div class="cockpit_item flex-center">
                    <form id="searchForm"  method="GET">
                        <input type="text"  id="searchInput" name="query"  placeholder="Pesquisar" class="input_style">
                    </form>
                    <a href="favorite.jsp" class="input_style">
                        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="22" viewBox="0 0 18 22" fill="none">
                            <path d="M17 21L9 15.4444L1 21V3.22222C1 2.63285 1.24082 2.06762 1.66947 1.65087C2.09812 1.23413 2.67951 1 3.28571 1H14.7143C15.3205 1 15.9019 1.23413 16.3305 1.65087C16.7592 2.06762 17 2.63285 17 3.22222V21Z" stroke="#665E66" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                        </svg>
                    </a>
                </div>
                <form method="GET" action="" id="filterForm">
                     <ul class="cockpit_item flex-center">
                         <li><span>Filtro de Categoria:</span></li>
                         <li>
                             <select name="categoria" class="input_style filters_button" id="categoria" autocomplete="off" onchange="document.getElementById('filterForm').submit();">
                                <option value="Todos" <%= genero != null && genero.equalsIgnoreCase("Todos") ? "selected" : "" %>>Todos</option>
                                <option value="Romance" <%= genero != null && genero.equalsIgnoreCase("Romance") ? "selected" : "" %>>Romance</option>
                                <option value="Acao" <%= genero != null && genero.equalsIgnoreCase("Acao") ? "selected" : "" %>>Ação</option>
                                <option value="Aventura" <%= genero != null && genero.equalsIgnoreCase("Aventura") ? "selected" : "" %>>Aventura</option>
                                <option value="Comedia" <%= genero != null && genero.equalsIgnoreCase("Comedia") ? "selected" : "" %>>Comédia</option>
                                <option value="Desenho" <%= genero != null && genero.equalsIgnoreCase("Desenho") ? "selected" : "" %>>Desenho</option>
                                <option value="Ficcao" <%= genero != null && genero.equalsIgnoreCase("Ficcao") ? "selected" : "" %>>Ficção</option>
                                <option value="Animacao" <%= genero != null && genero.equalsIgnoreCase("Animacao") ? "selected" : "" %>>Animação</option>
                                <option value="Documentario" <%= genero != null && genero.equalsIgnoreCase("Documentario") ? "selected" : "" %>>Documentário</option>
                                <option value="Fantasia" <%= genero != null && genero.equalsIgnoreCase("Fantasia") ? "selected" : "" %>>Fantasia</option>
                                <option value="Terror" <%= genero != null && genero.equalsIgnoreCase("Terror") ? "selected" : "" %>>Terror</option>
                                <option value="Suspense" <%= genero != null && genero.equalsIgnoreCase("Suspense") ? "selected" : "" %>>Suspense</option>
                                <option value="Musical" <%= genero != null && genero.equalsIgnoreCase("Musical") ? "selected" : "" %>>Musical</option>
                                <option value="Familia" <%= genero != null && genero.equalsIgnoreCase("Familia") ? "selected" : "" %>>Família</option>
                                <option value="Misterio" <%= genero != null && genero.equalsIgnoreCase("Misterio") ? "selected" : "" %>>Mistério</option>
                                <option value="Historico" <%= genero != null && genero.equalsIgnoreCase("Historico") ? "selected" : "" %>>Histórico</option>
                             </select>
                         </li>
                     </ul>
                </form>
            </div>
            <section id="filmes_container">
                <% for(Filme filme:lista){%>
                    <div class="filme_content flex-center">
                       <img src="data:image/png;base64,<%if(filme.capaimagemBase64 != null)out.print(filme.capaimagemBase64);%>" alt="<%out.print(filme.getNome());%>"  onclick="window.location.href='Details.jsp?valor=<%=filme.getId() %>'; return false;"></img>
                    </div>
                <%}%>
                </div>
            </section>

        </div>
    </main>
     
    <script>
        document.getElementById('searchInput').addEventListener('keypress', function (event) {
            if (event.key === 'Enter') {
                event.preventDefault(); // Impede o comportamento padrão do Enter
                document.getElementById('searchForm').submit(); // Submete o formulário
            }
        });
    </script>
    <script src="scriptGlobal.js"></script>
    <script src="carrossel.js"></script>
</body>
</html>