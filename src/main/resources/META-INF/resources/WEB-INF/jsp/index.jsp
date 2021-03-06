<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
    Document   : cadastro
    Created on : 01/08/2020, 13:52:07
    Author     : eduardo.moreira
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <link href="main.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Cadastro</title>
</head>
<body>
<div class="container">
    <h2 class="h1-stilizado">Cadastro de Vinhos</h2>
    <form:form action="save" method="post">
        <div class="row">
            <div class="col label-float">
                <input type="text" name="nome" placeholder=" " required="" spellcheck="false" data-ms-editor="true">
                <label>Nome Produto</label>
            </div>

            <div class="col order-1  label-float">
                <input type="text" name="tipo" placeholder=" " required="" spellcheck="false" data-ms-editor="true">
                <label>Tipo</label>
            </div>

            <div class="col order-12 label-float">
                <input type="number" name="preco" placeholder=" " required="">
                <label>Preço R$</label>
            </div>
        </div>
        <br>
        <div>
            <button type="submit" class="btn btn-primary">Salvar Produto</button>
        </div>
    </form:form>
    <br/>

    <div>
        <button type="button" class="btn btn-primary btn-red-tela-comprar">Tela de Compras</button></td>
    </div>

    <br>

    <table class="table table-striped table-bordered table-hover table-sm">
    <thead>
    <tr>
        <th>Codigo</th>
        <th>Produto</th>
        <th>Tipo</th>
        <th>Preço R$</th>
        <th></th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${vinhos}" var="var">
        <tr>
            <th >${var.id}</th>
            <td class="td-nome">${var.nome}</td>
            <td class="td-tipo">${var.tipo}</td>
            <td class="td-preco"><fmt:formatNumber type="number" value="${var.preco}" pattern="####-##"/> ${var.preco}</td>
            <td><a href="/delete?id=${var.id}"><i class="fa fa-trash fa-2x" aria-hidden="true" data-toggle="tooltip" title="Deletar"></i></a>
                <button type="button" data-atributte-id="${var.id}" data-atributte-nome="${var.nome}" data-atributte-tipo="${var.tipo}" data-atributte-preco="${var.preco}" class="fa fa-refresh fa-2x btn-atualizar"></button></td>

        </tr>
    </c:forEach>
    </tbody>
</table>
</div>

<script src="js.js"></script>
</body>
</html>


<div id="modal-edit" class="modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <input type="hidden" class="input-hidden" name="id">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Atualizar Produto</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form:form action="atualizar" method="post">
                <div class="modal-body">
                    <div class="col label-float">
                        <input type="text" class="input-hidden" name="id" placeholder=" " readonly spellcheck="false" data-ms-editor="true">
                        <label>codigo Produto</label>
                    </div>
                    <div class="col label-float">
                        <input type="text" id="input-nome-modal" name="nome" placeholder=" " required="" spellcheck="false" data-ms-editor="true">
                        <label>Nome Produto</label>
                    </div>
                    <div class="col order-1  label-float">
                        <input type="text" id="input-tipo-modal" name="tipo" placeholder=" " required="" spellcheck="false" data-ms-editor="true">
                        <label>Tipo</label>
                    </div>
                    <div class="col order-12 label-float">
                        <input type="number" id="input-preco-modal" name="preco" placeholder=" " required="">
                        <label>Preço R$</label>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary btn-atualizar-modal">Atualizar</button>
                </div>
            </form:form>
        </div>
    </div>
</div>


