package com.ecommerce.service;

import com.ecommerce.domain.CarrinhoCompras;
import com.ecommerce.domain.Vinho;
import com.ecommerce.repository.CarrinhoComprasRepository;
import com.ecommerce.repository.VinhoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;

@Service
public class CarrinhoComprarService {

    @Autowired
    private CarrinhoComprasRepository carrinhoComprasRepository;
    @Autowired
    private VinhoRepository vinhoRepository;

    public CarrinhoCompras addProdutoCarrinho(Long id) {

         CarrinhoCompras c = carrinhoComprasRepository.findCarrinhoComprasByCodProd(id);
//        CarrinhoCompras c = carrinhoComprasRepository.findById(id).isPresent() ? carrinhoComprasRepository.findById(id).get(): null;

        if (c != null) {
            c.setQuantidade(c.getQuantidade().add(BigDecimal.ONE));
            return carrinhoComprasRepository.save(c);
        } else {
            CarrinhoCompras cc = new CarrinhoCompras();
            Vinho v = vinhoRepository.findById(id).get();
            cc.setCodProd(v.getId());
            cc.setNome(v.getNome());
            cc.setTipo(v.getTipo());
            cc.setPreco(v.getPreco());
            cc.setQuantidade(BigDecimal.ONE);
            return carrinhoComprasRepository.save(cc);
        }

    }

    public List<CarrinhoCompras> buscaTodos() {
        return carrinhoComprasRepository.findAll(Sort.by(Sort.Direction.ASC, "id"));
    }

    public void deletarProduto(Long id) {
        carrinhoComprasRepository.deleteById(id);
    }



}
