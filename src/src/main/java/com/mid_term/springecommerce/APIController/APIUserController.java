package com.mid_term.springecommerce.APIController;

import com.mid_term.springecommerce.DTO.UserRegistrationRequest;
import com.mid_term.springecommerce.Models.Cart;
import com.mid_term.springecommerce.Models.Role;
import com.mid_term.springecommerce.Models.User;
import com.mid_term.springecommerce.Repositorys.CartRepository;
import com.mid_term.springecommerce.Repositorys.RoleRepository;
import com.mid_term.springecommerce.Repositorys.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/users/")
public class APIUserController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private CartRepository carRepository;

    @PostMapping("register")
    public Object handleRegister(@RequestBody UserRegistrationRequest req) {
        System.out.println(req.getPassword() + req.getUsername());
        User userExist  = userRepository.getUserByName(req.getUsername());
        if(userExist == null) {
            String encodedPassword = passwordEncoder.encode(req.getPassword());
            Role role =  roleRepository.getRoleById(2L);
            User user = new User(req.getUsername(), encodedPassword,role);
            userRepository.save(user);
            Cart cart = new Cart();
            cart.setUser(user);
            carRepository.save(cart);

            return Response.createSuccessResponseModel(0, true);
        }
        return Response.createSuccessResponseModel(0, false);
    }
}
