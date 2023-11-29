package com.mid_term.springecommerce.Controllers;

import com.mid_term.springecommerce.Models.Cart;
import com.mid_term.springecommerce.Models.User;
import com.mid_term.springecommerce.Repositorys.CartRepository;
import com.mid_term.springecommerce.Repositorys.UserRepository;
import com.mid_term.springecommerce.Utils.Utils;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.rmi.server.UID;
import java.util.Collection;

@Controller
@RequestMapping("/auth/")
public class AuthController {

    @Autowired
    private HttpServletRequest req;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private CartRepository carRepository;

    @GetMapping("login")
    public String renderLogin() {
        return "login";
    }

    @GetMapping("register")
    public String renderRegister() {
        return "register";
    }

    @GetMapping("/authorization")
    public String handleAuthorization(Authentication authentication) {
        String name = authentication.getName();

        Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();

        if (authorities.stream().anyMatch(authority -> authority.getAuthority().equals("ROLE_ADMIN"))) {
            // Chuyển hướng đến trang quản trị cho vai trò ADMIN
            return "redirect:/admin";
        } else {

            Utils.userLogin = userRepository.getUserByName(name);;

            // get cart
            Utils.cart = carRepository.getCartByUser(Utils.userLogin);
            if(Utils.cart == null)
                Utils.totalProductInCart = 0;
            else
                Utils.totalProductInCart = Utils.cart.getTotalItems();
            // Chuyển hướng đến trang chủ cho vai trò USER hoặc các vai trò khác
            return "redirect:/home";
        }
    }

}
