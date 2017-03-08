<%@ page contentType="text/html;charset=ISO-8859-1" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Painel do Usuário</title>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/content/css/userpanel.css">
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/content/imagem/logo.ico">
    <link rel="stylesheet" href="../content/css/nprogress.css">
    <script src="../content/javascript/nprogress.js"></script>
    <script src="../content/javascript/jquery-3.1.1.js"></script>
    <script src="../content/javascript/Util.js"></script>

    <script>

    </script>
</head>
<body>
<div class="navbar">
    <img class="navbar-img" src="<%=request.getContextPath()%>/content/imagem/logo.ico"/>
    <a class="navbar-name" href="<%=request.getContextPath()%>/index">Escriba Cafe</a>
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

<div class="userpanel-form">
    <div class="userpanel-tip">
        <p class="userpanel-name">Painel de Usuário</p>
    </div>

    <div class="userpanel-body">
        <div class="userpanel-left">
            <img class="user-img" src="../content/imagem/${sessionScope.user.imgPath}"/>
        </div>
        <div class="userpanel-center">
            <p class="desc">Seus dados cadastrados:</p>
            <p>Nome: ${sessionScope.user.name}</p>
            <p>E-mail: ${sessionScope.user.email}</p>
            <br>
            <a href="alteruser.jsp">Alterar dados</a>
            <%--<button type="submit" class="addButtons" onclick="addButtons()">Alterar dados</button>--%>
            <div id="hiddenButtons">

            </div>
        </div>
    </div>
</div>
<script>
    window.onload = function(e) {
        NProgress.start();
        setTimeout(function() { NProgress.done(); $('.fade').removeClass('out'); }, 10);
    };
</script>
</body>
</html>
