<%@page contentType="text/html; charset=ISO-8859-1" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>

<html>
<head>
    <title>Escriba Cafe</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="stylesheet" type="text/css" href="content/css/WebProject.css">
    <link rel="shortcut icon" href="content/imagem/logo.ico">
    <script src="content/javascript/nprogress.js"></script>
    <link rel="stylesheet" href="content/css/nprogress.css"/>
    <link rel="stylesheet" href="content/css/jquery-ui.css"/>
    <script src="content/javascript/jquery-3.1.1.js"></script>
    <script src="content/javascript/jquery-ui.js"></script>

    <script>
        function updatePosts(){
            $.getJSON({
                type: "GET",
                url: "/ProjectTwo_war_exploded/atualiza",
                dataType: "json",
                data: {search: $("#buscaPost").val()},
                timeout: 2000,

                success: function (data) {
                    var resultado = '';
                    $.each(data, function (i, item) {
                        resultado += '<li class="post-li"> ' +
                                '<div class="post">' +
                                '<div class="post-img" style="background-image:url(content/imagem/'+item.img_path+')">' +
                                '</div>' +
                                '<div class="post-text">' +
                                '<form class="post-content" action="<%=request.getContextPath()%>/depost" method="post">' +
                                '<input type="hidden"   name="ident" value='+ item.Id +'>' +
                                '<button type="submit" class="post-title">'+item.Title+'</button>' +
                                '</form>' +
                                '<h4>' + item.Description + ' </h4>' +
                                '</div>' +
                                '</div>' +
                                '</li>';
                    });
                    $('.posts ul').html("");
                    $('.posts ul').append(resultado);
                },
            });
        };

        $(function(){
            var postArray = [];

            $.getJSON({
               type: "GET",
                url: "/ProjectTwo_war_exploded/atualiza",
                dataType: "json",

                success: function(data){
                   $.each(data, function(i, item){
                       postArray.push(item.Title);
                   });
                }
            });

            $("#buscaPost").autocomplete({
               source: postArray
            });
        });

        setInterval(function(){
            updatePosts();
        }, 3000);

        window.onload = function(e) {
            NProgress.start();
            setTimeout(function() { NProgress.done(); $('.fade').removeClass('out'); }, 1000);
        };

        $(document).ready(function(){
            updatePosts();
        });
    </script>


</head>
    <body>
    <header class="page-header">
        <span class="nprogress-logo fade out"></span>
    </header>

    <navbar class="navbar">
        <div class="brand">
            <img class="navbar-brand-img left" src="content/imagem/logo.ico"/>
            <a class="navbar-brand-text left" href="#">Escriba Cafe</a>
        </div>
        <c:if test="${sessionScope.logged != true}">
        <div class="entrance right">
            <div class="entrance-login">
                <form class="entrance-login-register right" method="post" action="<%=request.getContextPath()%>/view/register.jsp">
                    <input class="entrance-img right" type="image" src="content/imagem/porta.png">
                </form>
                <form class="entrance-login-enter right" method="post" action="<%=request.getContextPath()%>/login">
                    <p class="login-enter-text">E-mail:</p>
                    <input class="login-enter-input <c:if test="${sessionScope.logged == false}"> login-enter-input-false</c:if>" type="text" name="email" placeholder="example@email.com">
                    <p class="login-enter-text">Senha:</p>
                    <input class="login-enter-input <c:if test="${sessionScope.logged == false}"> login-enter-input-false</c:if>" type="password" name="pass" placeholder="*******">
                    <input class="entrance-img right " type="image" src="content/imagem/cadeado.png">
                </form>
            </div>
        </div>
        </c:if>
        <c:if test="${sessionScope.logged == true}">
             <div class="right" style="display: inline-block">
                 <div class="brand">
                     <img class="navbar-brand-img right" src="content/imagem/${sessionScope.user.imgPath}"/>
                     <a class="navbar-brand-text right" href="view/userpanel.jsp">${sessionScope.user.name}</a>
                 </div>
                 <div class="exit-login" style="display: inline">
                     <form class="entrance-login-register right" method="post" action="<%=request.getContextPath()%>/logout">
                         <input class="exit-img right" type="image" src="content/imagem/exit.png">
                     </form>
                 </div>
             </div>
        </c:if>
    </navbar>
    <header class="header">
        <img class="header-img" src="content/imagem/Header.png"/>
    </header>
    <div class="sub-navbar">
        <div class="sub-navbar-links">
            <c:if test="${sessionScope.logged == true}">
                <c:if test="${sessionScope.user.idRole == 2}">
                    <a class="sub-navbar-link left podcast" href="view/newpost.jsp">POSTAR</a>
                </c:if>
            </c:if>
            <a class="sub-navbar-link left videos">VIDEOS</a>
            <a class="sub-navbar-link left artigos">ARTIGOS</a>

            <a class="sub-navbar-follow right">Follow</a>
            <img class="sub-navbar-img right facebook" src="content/imagem/facebook.png"/>
            <img class="sub-navbar-img right twitter" src="content/imagem/twitter.png"/>

            <span class="right">
                <form style="display: inline-block">
                    <div class="ui-widget">
                        <input id="buscaPost" type="text" class="right login-enter-input" placeholder="Busca" style="width: 210px; margin-right: 50px" name="search" value="">
                    </div>
                        <img class="entrance-img right" style="display: inline; margin-top: -21px" type="image" src="<%=request.getContextPath()%>/content/imagem/busca.png">
                </form>
            </span>
        </div>
    </div>
    <hr id="sub-navbar-hr">
    <br>
    <div class="sub-navbar">
        <div class="sub-navbar-links">
            <a class="sub-navbar-link left podcast">Postagens</a>
        </div>
    </div>
    <hr id="sub-sub-navbar-hr">
    <div class="posts">
        <ul>
        </ul>
    </div>

    <script>
        $(document).ready(function(){
            $("#buscaPost").keypress(function(e){
                if(e.which == 13) {
                    e.preventDefault();

                    $('.post-li').remove();
                    $('.post').remove();
                    $('.post-img').remove();
                    $('.post-text').remove();
                    $('.post-content').remove();
                    $('#busc').remove();
                    $('.post-title').remove();
                    $('#descPost').remove();


                    $.getJSON({
                        type: "GET",
                        url: "/ProjectTwo_war_exploded/atualiza",
                        dataType: "json",
                        data: {search: $("#buscaPost").val()},

                        beforeSend: function(){
                            NProgress.start();
                        },

                        success: function (data) {
                            var resultado = '';
                            $.each(data, function (i, item) {
                                resultado += '<li class="post-li"> ' +
                                        '<div class="post">' +
                                        '<div class="post-img" style="background-image:url(content/imagem/'+item.img_path+')">' +
                                        '</div>' +
                                        '<div class="post-text">' +
                                        '<form class="post-content" action="<%=request.getContextPath()%>/depost" method="post">' +
                                        '<input type="hidden"   name="ident" value='+ item.Id +'>' +
                                        '<button type="submit" class="post-title">'+item.Title+'</button>' +
                                        '</form>' +
                                        '<h4>' + item.Description + ' </h4>' +
                                        '</div>' +
                                        '</div>' +
                                        '</li>';
                            });
                            $('.posts ul').html(resultado);
                        },

                        complete: function(){
                            NProgress.done();
                        }

                    });
                }
            });
        });
    </script>
</body>
</html>