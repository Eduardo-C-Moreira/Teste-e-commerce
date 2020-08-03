package com.ecommerce.repository;

import com.ecommerce.domain.CarrinhoCompras;
import com.ecommerce.domain.Vinho;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CarrinhoComprasRepository extends JpaRepository<CarrinhoCompras, Long> {

    CarrinhoCompras findCarrinhoComprasByCodProd(Long id);

}
