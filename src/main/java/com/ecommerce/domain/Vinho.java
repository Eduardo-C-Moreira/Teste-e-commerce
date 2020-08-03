
package com.ecommerce.domain;

import java.io.Serializable;
import java.math.BigDecimal;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.springframework.validation.annotation.Validated;

@Validated

@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@Getter
@Setter
@Entity
@Table(name = "vinho")
public class Vinho implements Serializable {

    private static final long serialVersionUID = 6235798961366545815L;

    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id;

    @NotBlank(message = "Digite o nome do Produto")
    @Size(max = 25)
    private String nome;

    @NotBlank(message = "Digite o Tipo do Produto")
    @Size(max = 20)
    private String tipo;

    @NotBlank(message = "Digite o Preço do Produto")
    private BigDecimal preco;




}