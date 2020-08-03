package com.ecommerce.controller;



import com.ecommerce.domain.Vinho;
import com.ecommerce.service.VinhoService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


import org.springframework.stereotype.Controller;

import org.springframework.web.servlet.ModelAndView;

import java.util.List;



@Controller
public class VinhoController {

    @Autowired
    private VinhoService vinhoService;

    @GetMapping({"/"})
    public String index() {
        return "index";
    }

    @GetMapping({"/compras"})
    public ModelAndView compra() {
        String view = "compras";
        return vinhoService.createModeAndView(view);
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public ModelAndView salvarProduto(@ModelAttribute("vinho") Vinho vinho) {
        vinhoService.addProduto(vinho);
        String view = "index";
        return vinhoService.createModeAndView(view);
    }

    @RequestMapping("/delete")
    public ModelAndView deletarProduto(@RequestParam long id) {
        vinhoService.deletarProduto(id);
        String view = "index";
        return vinhoService.createModeAndView(view);

    }

    @RequestMapping(value = "/atualizar", method = RequestMethod.POST)
    public ModelAndView atualizarProduto(@ModelAttribute("vinho") Vinho vinho) {
        vinhoService.addProduto(vinho);
        String view = "index";
        return vinhoService.createModeAndView(view);
    }


}
