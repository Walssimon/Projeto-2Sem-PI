<%@page import="java.util.ArrayList"%>
<%@page import="model.GeneroFilme"%>
<%@page import="model.Filme"%>
<%@page import="model.Ator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    // Recebendo parâmetros
    String nome = request.getParameter("nome");
    String sinopse = request.getParameter("sinopse");
    String duracao = request.getParameter("duracao");
    String data = request.getParameter("data");
    String oper = request.getParameter("oper");  // Recebendo operação
    String classificacaoStr = request.getParameter("classificacao");
    int classificacao = 0;
    String avaliacaoStr = request.getParameter("avaliacao");
    double avaliacao = 0.0;
    String genreoStr = request.getParameter("categoria");
    int categoria;

    // Inicializando o objeto filme
    Filme film = new Filme();

    // Verificando se a operação é '1' (Adicionar filme)
    if ("1".equals(oper) && nome != null) {
        // Atribuindo valores ao objeto Filme
        film.nome = nome;
        film.sinopse = sinopse;
        film.duracao = duracao;
        film.dataLancamento = data;

        // Validando e atribuindo a avaliação
        if (avaliacaoStr != null && !avaliacaoStr.trim().isEmpty()) {
            try {
                avaliacao = Double.parseDouble(avaliacaoStr);
                film.avaliacao = avaliacao;
            } catch (NumberFormatException e) {
                // Tratar erro de conversão de número
                e.printStackTrace();  // Log de erro ou definir valor padrão
                film.avaliacao = 0.0;
            }
        }
        // Processando a classificação
        if (classificacaoStr != null && !classificacaoStr.trim().isEmpty()) {
            // Verificando a classificação para converter em um número
            if (classificacaoStr.equals("12") || classificacaoStr.equals("+12")) {
                classificacao = 12;
            }
            if (classificacaoStr.equals("10") || classificacaoStr.equals("+10")) {
                classificacao = 10;
            } else if (classificacaoStr.equals("14") || classificacaoStr.equals("+14")) {
                classificacao = 14;
            } else if (classificacaoStr.equals("16") || classificacaoStr.equals("+16")) {
                classificacao = 16;
            } else if (classificacaoStr.equals("18") || classificacaoStr.equals("+18")) {
                classificacao = 18;
            } else if (classificacaoStr.equalsIgnoreCase("Livre")) {
                classificacao = 0; // Valor para classificação "Livre"
            } else {
                classificacao = 0; // V
                //valor padrão, caso o valor não corresponda
            }
            film.classificacao = classificacao;
        }
        film.incluirFilme();

        GeneroFilme genf = new GeneroFilme();

        if (genreoStr != null && !genreoStr.trim().isEmpty()) {
            if (genreoStr.equals("Ação")) {
                genf.idGenero = 1;
            } else if (genreoStr.equals("Comédia")) {
                genf.idGenero = 2;
            } else if (genreoStr.equals("Românce")) {
                genf.idGenero = 3;
            } else if (genreoStr.equals("Aventura")) {
                genf.idGenero = 4;
            } else if (genreoStr.equals("Ficção")) {
                genf.idGenero = 5;
            } else if (genreoStr.equals("Desenho")) {
                genf.idGenero = 6;
            }
            genf.idFilme = genf.buscarUltimoFilme();
            genf.incluir();

        }
        genf.idGenero = 0;
        String sHtml = " " + film.nome + film.sinopse + genf.idFilme + genf.idGenero;
    }

    Ator atr = new Ator();
    ArrayList<Ator> atores = atr.listarAtores();
    
 

            // Mensagem de confirmação
%>


<!DOCTYPE html>
<html lang="pt-br">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cadastrar Filme - SenacBuster</title>
        <link rel="stylesheet" href="../global.css">
        <link rel="stylesheet" href="styles/menu.css">
        <link rel="stylesheet" href="styles/formsNewFilm.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100,200,300,400,500,600,700,800,900;1,100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">
    </head>

    <body class="body">
        <nav class="container-menu">
            <div class="buttonsAreaView">
                <div class="buttonView active"><button style="cursor: pointer;" onclick="window.location.href = 'cadNewFilme.jsp'"><i class="fa-solid fa-circle-plus"  ></i></button><p>Adicionar Filme</p></div>
                <div class="buttonView"><button style="cursor: pointer;" onclick="window.location.href = 'addActorPage.jsp'"><i class="fa-solid fa-user-plus" ></i></button><p>Adicionar Ator</p></div>
                <div class="buttonView"><button style="cursor: pointer;" onclick="window.location.href = '../logout.jsp'"><i class="fa-solid fa-right-from-bracket" ></i></button><p>Logout</p></div>            
            </div>
        </nav>
        <main class="container">
            <div class="cockpit_filmes_form">
                <div class="cockpit_item_adm ">
                    <button class="btn_return" style="cursor: pointer;"  onclick="window.location.href = 'HomeAdmin.jsp'"><a><i class="fa-solid fa-arrow-left"></i></a></button>
                    <h1>Capas & Banners</h1>
                </div>
            </div>
            <form class="div_security_area" method="post" action="../CadFilme" name="formFilm" enctype="multipart/form-data" onsubmit="formreg.oper.value = '1'">
                <input type="hidden" name="oper" value="0">

                <div class="inputs_area ">
                    <div class="input_div">
                        <label>Capa principal</label>
                        <label class="input_capas">
                            <img src="" alt="Clique para selecionar uma imagem" id="imagePreview" class="img_preview">
                            <!-- Campo de input de arquivo escondido -->
                            <input type="file" class="principal" id="file-input"  accept="image/*" onchange="handleFileChange(event, 'imagePreview')" name="arquivoCapa">
                        </label>
                        <!-- <label class="input_capas"> <input type="file" accept="image/*" class="principal"></label> -->
                    </div>
                    <div class="input_div">
                        <label>Banner principal</label>
                        <label class="input_capas">
                            <img src="" alt="Clique para selecionar uma imagem" id="imagePreview2" class="img_preview">
                            <!-- Campo de input de arquivo escondido -->
                            <input type="file" class="banners" id="file-input"  accept="image/*" onchange="handleFileChange(event, 'imagePreview2')" name="arquivoBanner">
                        </label>

                    </div>
                </div>
                <div class="inputs_area linear ">
                    <h1> Informações</h1>
                    <div class="div_list_inputs">
                        <div class="input_div_grid">
                            <label>Nome</label>
                            <label class="input_capas"> <input type="text" class="principal" name="nome" required></label>
                        </div>
                        <div class="input_div_grid">
                            <label>Categoria</label>
                            <label class="input_capas"> 
                                <!--<input list="cate" id="cat" class="principal"  onclick="inputClearorNot(event)" autocomplete="off" name="categoria">
                                <datalist id="cate">
                                    <option value="Ação">Ação</option>
                                    <option value="Aventura">Aventura</option>
                                    <option value="Comédia">Comédia</option>
                                    <option value="Drama">Drama</option>
                                    <option value="Terror">Terror</option>
                                    <option value="Ficção">Ficção</option>
                                    <option value="Romance">Romance</option>
                                    <option value="Fantasia">Fantasia</option>
                                    <option value="Suspense">Suspense</option>
                                    <option value="Mistério">Mistério</option>
                                    <option value="Animação">Animação</option>
                                    <option value="Documentário">Documentário</option>
                                    <option value="Musical">Musical</option>
                                    <option value="Histórico">Histórico</option>
                                    <option value="Família">Família</option>
                                </datalist></label>-->
                                <select id="cate" name="categoria" class="principal">
                                    <option value="Ação">Ação</option>
                                    <option value="Aventura">Aventura</option>
                                    <option value="Comédia">Comédia</option>
                                    <option value="Drama">Drama</option>
                                    <option value="Terror">Terror</option>
                                    <option value="Ficção">Ficção Científica</option>
                                    <option value="Românce">Romance</option>
                                    <option value="Fantasia">Fantasia</option>
                                    <option value="Suspense">Suspense</option>
                                    <option value="Mistério">Mistério</option>
                                    <option value="Animação">Animação</option>
                                    <option value="Documentário">Documentário</option>
                                    <option value="Musical">Musical</option>
                                    <option value="Histórico">Histórico</option>
                                    <option value="Família">Família</option>
                                </select>  
                            </label>
                        </div>
                        <div class="input_div_grid">
                            <label>Ano de Lançamento</label>
                            <label class="input_capas"> <input type="date" class="principal" name="data"></label>
                        </div>
                        <div class="input_div_grid">
                            <label>Avaliações</label>
                            <label class="input_capas"> <input type="text" class="principal" name="avaliacao"></label>
                        </div>
                        <div class="input_div_grid">
                            <label>Tempo de duração <span style="font-size: 0.7rem;color: #cccccc65;">(exemplo: 120
                                    min)</span></label>
                            <label class="input_capas"> <input type="text" class="principal" name="duracao"></label>
                        </div>
                        <div class="input_div_grid">
                            <label>Restrição de idade</label>
                            <label class="input_capas"> 
                                 <input list="restri" id="rest" class="principal" onclick="inputClearorNot(event)" name="classificacao" autocomplete="off">
                                 <datalist id="restri">
                                     <option value="+10" name="5">
                                     <option value="+12" name="1">
                                     <option value="+14" name="2">
                                     <option value="+16" name="3">
                                     <option value="+18" name="4">
                                     <option value="Livre"name="0">
                                 </datalist>
                               <!-- <select id="rest" name="classificacao" class="principal">
                                    <option name="0" value="livre">Livre</option>
                                    <option name="5" value="10">+10</option>
                                    <option name="1" value="12">+12</option>
                                    <option name="2" value="14">+14</option>
                                    <option name="3" value="16">+16</option>
                                    <option name="4" value="18">+18</option>
                                </select>-->
                            </label>
                        </div>

                        <div class="input_div_grid desc_area">
                            <label>Descrição</label>
                            <label class="input_capas"> <textarea class="descr_input" name="sinopse"></textarea></label>
                        </div>
                    </div>
                </div>
                <!-- atores -->
                
                <div class="footer" >

                    <div class="footer_container_area ">
                        <button class="cancel_btn" type="reset">
                            Cancelar
                        </button>

                        <button  class="add_btn">
                            <i class="fa-solid fa-plus"></i>
                            Adicionar
                        </button>
                    </div>


                </div>
                </div>
            </form>

        </div>


    </main>




    <!-- ABRIR MODAL PARA SELECIONAR ATORES 
 <div class="add_atores">
     <label>Atores Principais</label>
     <button type="button" onclick="openCloseModal('.modal_add_ator')">Adicionar Ator</button>
 </div>

    <!-- LISTAGEM DE ATORES 
    <div class="container_actores_list">
        <div class="actors_div_film">
            <img src="./../../../5teste.jpg" alt="Foto do ator">
            <div class="content">
                <p class="title_persona_name location">Nome do Personagem</p>
                <p class="title_actor_name location">Nome do Ator</p>
            </div>
        </div>                                                                              
    </div>
</div>
        
            
<div class="footer">
    <div class="footer_container_area">
        <button class="cancel_btn" type="reset">
            Cancelar
        </button>

        <button class="add_btn" type="submit">
            <i class="fa-solid fa-plus"></i>
            Adicionar
        </button>
    </div>                
</div>
</form>    

</main>

<div class="modal modal_add_ator hidden">
<div class="modal_header">
<p>Adicionar ator</p>
<button class="close" data-modal-close>X</button>
</div>
<div class="modal_content">
<form>
    <label class="nome_ficticio_label">
        <span>Nome fictício</span>
        <input type="text" class="input_style" id="nome_ficticio" name="nome_ficticio" placeholder="Nome do personagem">
    </label>
    <div class="search">
        <div class="action">
            <input type="text" class="input_style" placeholder="Filtrar por nome">
        </div>
    </div>
    <div class="container_actores_list"> -->
<div class="modal modal_add_ator hidden">
            <div class="modal_header">
                <p>Adicionar ator</p>
                <button class="close" data-modal-close>X</button>
            </div>
            <div class="modal_content">
                <form  method="post">
                    <label class="nome_ficticio_label">
                        <span>Nome fictício</span>
                          <input type="text" class="input_style" id="nome_ficticio" name="nome_ficticio" placeholder="Nome do personagem">
                    </label>
                    <div class="search">
                        <div class="action">
                            <input type="text" class="input_style" placeholder="Filtrar por nome">
                        </div>
                    </div>
                    <div class="container_actores_list">
                    <!-- Listagem dos atores -->
                    <% for (Ator listaatores : atores) {%>
                    <div class="actors_div_film">
                        <!-- Radio Button -->
                        <input type="radio" 
                               id="ator_<%= listaatores.getId()%>" 
                               name="selected_actor" 
                               value="<%= listaatores.getId()%>" 
                               required>

                        <!-- Label para o Radio Button -->
                        <label class="label_input_radio" name="<%= listaatores.getId()%>"  for="ator_<%= listaatores.getId()%>">
                            <!-- Imagem do ator -->
                            <img src="data:image/png;base64,<%= listaatores.capaimagemBase64 != null ? listaatores.capaimagemBase64 : ""%>" 
                                 alt="<%= listaatores.getNomeAtor()%>">

                            <!-- Nome do ator -->
                            <div class="content">
                                <p class="title_actor_name location"><%= listaatores.getNomeAtor()%></p>
                            </div>
                        </label>
                    </div>
                    <% }%>  
                </div>

                <div class="submit">
                    <button class="add_btn" onclick=""  style="cursor: pointer;" type="submit">
                        <i class="fa-solid fa-plus" aria-hidden="true"></i>
                        Adicionar
                    </button>
                </div>
            </form>
        </div>
    </div>


    <div id="modal_blur" class="hidden">
    </div>


    <!-- fim do modal -->
    <script src="./../scriptGlobal.js"></script>
    <script src="https://kit.fontawesome.com/3d5034d18d.js" crossorigin="anonymous"></script>

</body>

</html>

