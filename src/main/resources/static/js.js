
$(document.this).ready(function () {
    $('.btn-atualizar').on("click", function(){
        $('#modal-edit').modal();

        $('.input-hidden').val($(this).attr('data-atributte-id'));
        $('#input-nome-modal').val($(this).attr('data-atributte-nome'));
        $('#input-tipo-modal').val($(this).attr('data-atributte-tipo'));
        $('#input-preco-modal').val($(this).attr('data-atributte-preco'));
    });

    $(function () {
        $('[data-toggle="tooltip"]').tooltip();
    });

    $('.btn-red-tela-comprar').on("click", function(){
        var novaURL = "http://localhost:8090/compras";
        $(window.document.location).attr('href',novaURL);
    });


    $('#valor-total').change("click", function(){
        debugger;
        var valorTotal = $('#valor-total').val();
        if (valorTotal === undefined || valorTotal === "" || valorTotal === null) {
            $('.btn-finalizar-venda').attr("disabled", true);
        } else {
            $('.btn-finalizar-venda').attr("disabled", true);
        }
    });

    $('.btn-finalizar-venda').on("click", function(e){
        var valorTotal = $('#valor-total').val();

        if (valorTotal === undefined || valorTotal === "" || valorTotal === null) {
            e.preventDefault();
            return;
        }

        $('#modal-compra-concluida').modal();
        $('.valor-final').val(valorTotal);
    });


    $('.btn-enviar-carrinho').on("click", function(e){

        var id = $(this).attr('data-atributte-id');

        $.ajax({
            url: "http://localhost:8090/saveCarrinho?id="+id+"",
            type: 'POST',
            data:{},
            beforeSend: function(data) {
            },
            complete: function() {
            },
            success: function(data) {
                debugger;
                var txt = "";
                txt += "<tr><td>"+data.id+"</td><td>"+data.nome+"</td><td>"+data.tipo+"</td><td>"+data.preco.toFixed(2).toString().replace(".", ",")+"</td></tr>";
                if(txt !== ""){
                    $("#table-carrinho").append(txt);
                    $("#valor-total").val(data.valorTotal.toFixed(2).toString().replace(".", ","));
                }
            },
            error: function() {

            }
        });

    });
});
