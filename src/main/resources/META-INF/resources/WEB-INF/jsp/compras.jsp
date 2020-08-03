<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <h2 class="h1-stilizado">Carrinho de Compras</h2>
    <table id="table-carrinho" class="table table-striped table-bordered table-hover table-sm">
        <thead>
            <tr>
                <th>Codigo</th>
                <th>Produto</th>
                <th>Tipo</th>
                <th>Preço R$</th>
            </tr>
            </thead>
            <tbody>
                <c:forEach items="${carrinho}" var="var">
                    <tr>
                        <th >${var.id}</th>
                        <td class="td-nome-venda">${var.nome}</td>
                        <td class="td-tipo">${var.tipo}</td>
                        <td class="td-preco">${var.preco}</td>
                        <td><button type="button" data-atributte-id="${var.id}" class="btn-enviar-carrinho">Remover do Carrinho</button></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <button type="submit" class="btn btn-primary btn-finalizar-venda">Finalizar Compra</button>

        <label>Valor da Compra R$</label>
            <input type="text" id="valor-total" readonly="readonly">


    <br>
    <h4 class="h4-stilizado">Catálogo</h4>

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
                    <th>${var.id}</th>
                    <td class="td-nome-venda">${var.nome}</td>
                    <td class="td-tipo">${var.tipo}</td>
                    <td class="td-preco">${var.preco}</td>
                    <td><button type="button" data-atributte-id="${var.id}" class="fa fa fa-shopping-cart fa-2x btn-enviar-carrinho"></button></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<script src="js.js"></script>
</body>
</html>

<div id="modal-compra-concluida" class="modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <input type="hidden" class="input-hidden" name="id">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Venda Concluida</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form:form action="atualizar" method="post">
                <div class="modal-body">
                    <h2>Compra Realizada com Sucesso!</h2>
                    <label>Valor Total R$:</label>
                    <input type="text" class="valor-final" readonly="readonly">
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary btn-atualizar-modal">OK</button>
                </div>
            </form:form>
        </div>
    </div>
</div>