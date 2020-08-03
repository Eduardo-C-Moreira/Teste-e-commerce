package com.ecommerce.controller;

import com.ecommerce.domain.CarrinhoCompras;
import com.ecommerce.service.CarrinhoComprarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import java.math.BigDecimal;
import java.util.List;


@Controller
public class CarrinhoComprasController {

    @Autowired
    private CarrinhoComprarService carrinhoComprarService;

    @RequestMapping(value = "/saveCarrinho", method = RequestMethod.POST )
    public ResponseEntity<CarrinhoCompras> saveProdutoCarrinho(@RequestParam long id) {
        CarrinhoCompras carrinhoCompras = carrinhoComprarService.addProdutoCarrinho(id);
        List<CarrinhoCompras> listcarrinhoCompras = carrinhoComprarService.buscaTodos();
        BigDecimal somaTotal = BigDecimal.ZERO;
        for (CarrinhoCompras c : listcarrinhoCompras) {
            somaTotal = somaTotal.add(c.getPreco().multiply(c.getQuantidade()));
        }
        carrinhoCompras.setValorTotal(somaTotal);

        return new ResponseEntity<CarrinhoCompras>(carrinhoCompras, HttpStatus.OK);
    }

}
