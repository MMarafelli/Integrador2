<%-- 
    Document   : dashboard
    Created on : 01/11/2017, 21:27:58
    Author     : Gabriel Silva
--%>

<%@page import="model.Aluno"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String nome = (String) request.getSession().getAttribute("nome");

    if (nome == null) {
        request.getSession().setAttribute("nome", null);
        response.sendRedirect("index.jsp");
    } else {
        String[] nomeSplitado = nome.split(" ");
        if (nomeSplitado.length > 2) {
            nome = nomeSplitado[0] + " " + nomeSplitado[1];
        }
    }
%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>IFCommunity | Dashboard</title>
        <!-- Import Materialize CSS -->
        <link type="text/css" rel="stylesheet" href="css/materialize.min.css" media="screen,projection" />
        <!-- Import Material Icons -->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!-- Import Style CSS -->
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <!-- Import Codemirror -->
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta name="robots" content="noindex, nofollow">
        <meta name="googlebot" content="noindex, nofollow">
        <link rel="stylesheet" type="text/css" href="css/result-light.css">
        <style type="text/css"></style>
        <link rel="stylesheet" href="css/codemirror.css">

    </head>

    <body id="body-principal">

        <div class="content-header valign-wrapper">
            <h1 class="section-title">IF<span class="section-title-dois">community</span></h1>
        </div>
        <span id="id-usuario">${id}</span>
        <nav class="nav-side menu">
            <a href="#" class="nav-toggle"></a>
            <header class="avatar">
                <div class="container">
                </div>
                <h2><%out.print(nome);%></h2>
                <form name="form-login" class="" action="Deslogar" method="GET">
                    <input type="submit" name="botao-deslogar" id="btn-deslogar" value="Logout">
                </form>
            </header>
            <ul class="para-scroll">
                <li tabindex="0" class="icon-users"><span id="perfil">Perfil</span></li>
                <li tabindex="0" class="icon-materias"><span id="minhas-materias">Minhas matérias</span>
                </li>
                <div class="minhas-materias-adicionadas">
                    <ul class="lista-materias"></ul>
                </div>
                <li tabindex="0" class="icon-dashboard"><span id="adicionar-materias">Adicionar matérias</span></li>
                <li tabindex="0" class="icon-settings"><span id="config">Configurações</span></li>
            </ul>
        </nav>

        <main class="site-content">
            <section class="postagens perfil section-aparece">
                <div class="sc-edprofile">
                    <h1>Perfil</h1>
                    <div class="row">
                        <form class="col s12">
                            <div class="row">
                                <div class="input-field col s6">
                                    <i class="material-icons prefix">account_circle</i>
                                    <input id="icon_prefix" type="text" class="validate">
                                    <label for="icon_prefix">Primeiro nome</label>
                                </div>
                                <div class="input-field col s6">
                                    <i class="material-icons prefix">account_circle</i>
                                    <input id="icon_prefix" type="text" class="validate">
                                    <label for="icon_prefix">Sobrenome</label>
                                </div>
                                <div class="input-field col s6">
                                    <i class="material-icons prefix">Telefone</i>
                                    <input id="icon_telephone" type="tel" class="validate">
                                    <label for="icon_telephone">Celular</label>
                                </div>
                                <div class="input-field col s6">
                                    <i class="material-icons prefix">mail</i>
                                    <input id="email" type="email" class="validate">
                                    <label for="email">Email</label>
                                </div>
                                <div class="input-field col s6">
                                    <i class="material-icons prefix">face</i>
                                    <select>
                                        <option value="" disabled selected>Selecione</option>
                                        <option value="1">1° Período</option>
                                        <option value="2">2° Período</option>
                                        <option value="3">3° Período</option>
                                        <option value="4">4° Período</option>
                                        <option value="5">5° Período</option>
                                    </select>
                                    <label>Período</label>
                                </div>
                                <div class="input-field col s6">
                                    <i class="material-icons prefix">school</i>
                                    <input id="icon_prefix" type="text" class="validate">
                                    <label for="icon_prefix">Matrícula</label>
                                </div>
                            </div>
                        </form>
                    </div>
            </section>

            <section class="postagens minhas-materias">
                <%
                    int contPostagens = 2;
                    for (int i = 1; i <= contPostagens; i++) {
                        out.print("<div class='content-topic container z-depth-2'>");
                        out.print("<row>");
                        out.print("<div class='col s6' id='titulo-postagem" + i + "'>Titulo postagem</div>");
                        out.print("<p id='autor" + i + "'>Autor da postagem</p>");

                        out.print("<form name='form-like-btn" + i + "' class='col s3' id='form-like" + i + "' action='Like' method='POST'>");
                        out.print("<input type='submit' class='right-align' value='Like' id='btn-like" + i + "'></input>");
                        out.print("</form>");

                        out.print("<form name='form-deslike-btn" + i + "' class='col s3' id='form-deslike" + i + "' action='Deslike' method='POST'>");
                        out.print("<input type='submit' class='right-align' value='Deslike' id='btn-deslike" + i + "'></input>");
                        out.print("</form>");
                        out.print("</row>");

                        out.print("<hr>");
                        out.print("<row>");
                        out.print("<p id='postagem" + i + "'>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum</p>");
                        out.print("<p id='data-postagem' class='right-align'>Hora postagem</p>");
                        out.print("</row>");
                        out.print("</div>");
                    }
                %>

                <!-- bar para o modal e modal logo abaixo !-->    

                <div class="menu-mensagens">
                    <div class="fixed-action-btn vertical">
                        <a class="btn-floating btn-large indigo darken-3">
                            <i class="large material-icons">code</i>
                        </a>
                        <ul>
                            <li ><a href="#modal1" id="modal-de-escrever-codigo" class="btn-floating green lighten-2 waves-effect waves-light btn modal-trigger tooltipped" data-position="left" data-delay="50" data-tooltip="Adicionar código"><i class="material-icons">add</i></a></li>
                            <li><a class="btn-floating grey tooltipped" data-position="left" data-delay="50" data-tooltip="Buscar"><i class="material-icons">search</i></a></li>
                        </ul>
                    </div>
                </div>

                <div id="modal1" class="modal modal-fixed-footer">
                    <div class="modal-head">
                        <h4>Modal Header</h4>
                        <p>A bunch of text</p>
                    </div>
                    <div class="modal-content">

                    </div>
                    <div class="modal-footer">
                        <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat ">Agree</a>
                    </div>
                </div>
            </section>
        </main>




        <!-- Import jQuery -->
        <script src="js/jquery-3.2.1.min.js"></script>
        <!-- Import Materialize JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
        <script type="text/javascript" src="js/materialize.min.js"></script>
        <!-- Import jQuery Mask JS -->
        <script src="js/jquery.mask.min.js"></script>
        <!-- Import Dashboard JS -->
        <script src="js/dashboard.js"></script>
        <!-- Import Codemirror JS -->      
        <script src="http://codemirror.net/lib/codemirror.js"></script>
        <script src="http://codemirror.net/addon/edit/matchbrackets.js"></script>
        <script src="http://codemirror.net/mode/javascript/javascript.js"></script>
        <script type="text/javascript" src="js/dummy.js"></script>

    </body>

</html>
