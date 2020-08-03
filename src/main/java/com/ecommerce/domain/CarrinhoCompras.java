package com.ecommerce.domain;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.springframework.lang.Nullable;
import org.springframework.validation.annotation.Validated;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.math.BigDecimal;

@Validated

@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@Getter
@Setter
@Entity
@Table(name = "carrinho")
public class CarrinhoCompras implements Serializable {

    private static final long serialVersionUID = 6235798961366545815L;

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private Long id;

    private Long codProd;

    private String nome;

    private String tipo;

    private BigDecimal preco;

    private BigDecimal quantidade;

    @Transient
    private BigDecimal valorTotal;

}
