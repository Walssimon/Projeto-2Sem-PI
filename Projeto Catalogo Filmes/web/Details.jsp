
<%@page import="model.Usuario"%>
<%@page import="model.Filme"%>
<%@page import="model.GeneroFilme"%>
<%@page import="model.Comentario"%>
<%@page import="model.Favorito"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("UTF-8");
  
  //Buscar Filme infos ----------------------------------------------------------------------------------------
  
  Filme film = new Filme();
  String idzinho = request.getParameter("valor");
  int id =  Integer.parseInt(idzinho);
  Filme FilmeBuscado = film.getFilmeById(id);
  
  String LancamentoBruto = FilmeBuscado.getDataLancamento();
  String Lancamento = LancamentoBruto.substring(0, 4);
  
  GeneroFilme generoObj = new GeneroFilme();
  String nmGenero = generoObj.buscarGeneroPorId_Filme(id);
  
  nmGenero =  nmGenero.substring(0, 1).toUpperCase() + nmGenero.substring(1).toLowerCase();
  
  //Manipulando coments ----------------------------------------------------------------------------------------
  
  String comentInput = request.getParameter("comentario");
  
  Usuario userLogado = (Usuario) session.getAttribute("usuarioLogado"); 

  Comentario coment = new Comentario();

  coment.setIdFilme(id);
  
  coment.setIdUser(userLogado.getPkuser());
  
  if(comentInput != null && !comentInput.trim().isEmpty()){
    coment.setComentario(comentInput);
    coment.IncluirComentario();
  }
    
  ArrayList<Comentario> listaComent = coment.listarComentarios();
  
  //Manipulando favoritos ----------------------------------------------------------------------------------------
  
  String favInput = request.getParameter("Favoritar");
  
  Favorito fav = new Favorito(id, userLogado.getPkuser());
  
  boolean isFav = false;
  
  isFav = fav.getFavorito();
  
  if(favInput != null && !favInput.trim().isEmpty()){
    
    if(isFav != false){
        fav.deletar();
        isFav = false;
    } else {
        fav.IncluirFavorito();
        isFav = true;
    }
  

  } 
    
%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%=FilmeBuscado.getNome()%> - Feedback Cinema</title>
     <link rel="stylesheet" href="./global.css">
    <link rel="stylesheet" href="./details.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100,200,300,400,500,600,700,800,900;1,100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">
</head>
<body>
    <div class="big_container flex-center" id="banner_details" style="background-image: url('data:image/png;base64,<% if (FilmeBuscado.bannerimagemBase64 != null) out.print(FilmeBuscado.bannerimagemBase64); %>');">
        <div class="gradient"></div>
        <div class="container">
            <div class="content">
                <a onclick="window.location.href='./Home.jsp'" class="voltar_btn input_style flex-center">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path d="M9.4 233.4c-12.5 12.5-12.5 32.8 0 45.3l160 160c12.5 12.5 32.8 12.5 45.3 0s12.5-32.8 0-45.3L109.2 288 416 288c17.7 0 32-14.3 32-32s-14.3-32-32-32l-306.7 0L214.6 118.6c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0l-160 160z"/></svg>
                </a>
                <h1><%= FilmeBuscado.getNome() %> </h1>
                <div class="info_details flex">
                    <span><%= nmGenero %></span>
                    <span class="stars-details"><i class="fa-solid fa-star"></i><%= FilmeBuscado.getAvaliacao()%></span>
                    <span><%= Lancamento%></span>
                    <span><div class="censure-details"><%= FilmeBuscado.getClassificacao() == 0 ? "livre" : FilmeBuscado.getClassificacao()%></div></span>
                    <%
                        int totalMinutes = Integer.parseInt(FilmeBuscado.getDuracao());
                        String duracaoFormatada;

                        if (totalMinutes < 60) {
                            duracaoFormatada = totalMinutes + "min";
                        } else {
                            int hours = totalMinutes / 60;
                            int remainingMinutes = totalMinutes % 60;

                            if (remainingMinutes == 0) {
                                duracaoFormatada = hours + "H";
                            } else {
                                duracaoFormatada = hours + "H" + remainingMinutes;
                            }
                        }
                    %>
                    <span><%= duracaoFormatada %></span>
                </div>
                <p><%= FilmeBuscado.getSinopse() %> </p>
                <div class="buttons_container flex">
                    <form method="POST">
                        <input type="hidden" name="Favoritar" value="true">
                       <button class="favoritar input_style" type="submit">
                            <i class="<%= isFav ? "fa-solid fa-bookmark" : "fa-regular fa-bookmark" %>"></i>Favoritar
                        </button>
                    </form>
                    <a href="#comentar_no_filme" class="comentar input_style">Comentar</a>
                </div>
            </div>
        </div>
    </div>
                 
    <main class="big_container flex-center">
        <div class="container ">
            <section id="movie_comments" class="flex">
                <div class="comentarios">
                    <h1>Comentários</h1>
                    <div class="comentarios_container">
                        <%for(Comentario comentario:listaComent){%>
                        <div class="comentario flex">
                            <h3><%= comentario.getNomeUser() %></h3>
                            <p><%= comentario.getComentario() %></p>
                            <span><%= comentario.getDataComentario() %></span>
                        </div>
                        <%}%>
                    </div>
                </div>
                <div class="form_comentarios" id="comentar_no_filme">
                    <form method="POST" class="flex">
                        <textarea class="input_style textarea_comment" name="comentario" placeholder="Digite seu comentário"></textarea>
                        <div class="flex-between w-full">
                            <input class="input_style" type="submit">
                        </div>
                    </form>
                </div>
            </section>
            
        </div>
    </main>
</body>