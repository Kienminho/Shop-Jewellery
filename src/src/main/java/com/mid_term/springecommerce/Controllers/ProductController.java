package com.mid_term.springecommerce.Controllers;

import com.mid_term.springecommerce.Models.Product;
import com.mid_term.springecommerce.Repositorys.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Optional;

@Controller
@RequestMapping("/product")
public class ProductController {
    @Autowired
    private ProductRepository productRepository;
    @GetMapping("/{id}")
    public String detailProduct(@PathVariable Long id, Model model) {
        Product p = productRepository.getDetailProduct(id);

        model.addAttribute("product", p);
        return "detail";
    }
}
