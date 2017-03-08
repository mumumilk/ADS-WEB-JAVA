<%@ page contentType="text/html;charset=ISO-8859-1" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>


<html>
<head>
    <head>
        <title>Nova Postagem</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/content/css/newpost.css">
        <link rel="shortcut icon" href="<%=request.getContextPath()%>/content/imagem/logo.ico"
        <script src="../content/javascript/jquery-3.1.1.js"></script>
        <script src="../content/javascript/nprogress.js"></script>
        <link rel="stylesheet" href="../content/css/nprogress.css"/>
        <script>
            window.onload = function(e) {
                NProgress.start();
                setTimeout(function() { NProgress.done(); $('.fade').removeClass('out'); }, 10);
            };
        </script>
    </head>
</head>
<body>

<div class="navbar">
    <img class="navbar-img" src="<%=request.getContextPath()%>/content/imagem/logo.ico"/>
    <a class="navbar-name" href="<%=request.getContextPath()%>/index">Escriba Cafe</a>

    <c:if test="${sessionScope.logged == true}">
        <span class="sp-session">
            <div class="div-session">
            <form  class="form-session" method="post" action="<%=request.getContextPath()%>/logout">
                    <input  class="img-session" type="image"  src="../content/imagem/exit.png">
            </form>
            </div>
            <img class="navbar-img" style="float:right;" src="<%=request.getContextPath()%>/content/imagem/${sessionScope.user.imgPath}"/>
            <a class="navbar-name" style="float:right;" href="<%=request.getContextPath()%>/index">${sessionScope.user.name}</a>
        </span>
    </c:if>
</div>

<table class="table-cores iv">
    <tbody>
    <tr>
        <td class="mun"></td>
        <td class="pla"></td>
        <td class="arr"></td>
        <td class="ate"></td>
        <td class="com"></td>
        <td class="pes"></td>
        <td class="sau"></td>
        <td class="edu"></td>
        <td class="lei"></td>
    </tr>
    </tbody>
</table>


<div class="register-form">
    <div class="register-tip">
        <p class="register-name">Nova postagem</p>
    </div>

    <form method="post" class="register-form-form" enctype="multipart/form-data" action="<%=request.getContextPath()%>/postar">
        <br>
        <br>
        <a class="register-a">Título do post:</a>
        <input class="register-input" type="text" name="title" maxlength="35" required/>

        <br>
        <br>
        <a class="register-a">Descrição do post:</a>
        <textarea class="register-input-textarea" style="" type="text" name="description" maxlength="500" required/></textarea>
        <br>
        <br>
        <br>
        <br>
        <br>
        <a class="register-a">Imagem:</a>
        <input class="register-input" type="file" name="file" required/>

        <br>
        <br>
        <input class="btn-submit" type="submit" />
        <br>
        <br>
    </form>
</div>

</body>
</html>
