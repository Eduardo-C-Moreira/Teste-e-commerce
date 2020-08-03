package com.ecommerce.service;


import com.ecommerce.domain.Vinho;
import com.ecommerce.repository.VinhoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.constraints.Null;
import java.util.List;

@Service
public class VinhoService {

    @Autowired
    private VinhoRepository vinhoRepository;

    public Vinho addProduto(Vinho vinho) {
        if (vinho.getId() != null) {
            Vinho v = vinhoRepository.findById(vinho.getId()).get();
            v.setNome(vinho.getNome());
            v.setTipo(vinho.getTipo());
            v.setPreco(vinho.getPreco());
        }
        return vinhoRepository.save(vinho);
    }

    public List<Vinho> buscaTodos() {
        return vinhoRepository.findAll(Sort.by(Sort.Direction.ASC, "id"));
    }

    public void deletarProduto(Long id) {
        vinhoRepository.deleteById(id);
    }

    public Vinho buscaPeloId(Long id) {
        return vinhoRepository.findById(id).get();
    }

    public ModelAndView createModeAndView(String view) {
        List<Vinho> vinhos = this.buscaTodos();
        ModelAndView mav = new ModelAndView(view);
        mav.addObject("vinhos", vinhos);
        return mav;
    }
}
