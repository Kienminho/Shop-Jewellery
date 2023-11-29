package com.mid_term.springecommerce.Repositorys;

import com.mid_term.springecommerce.Models.Product;
import com.mid_term.springecommerce.Models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface UserRepository extends JpaRepository<User, Long> {

    @Query("SELECT u FROM User u WHERE u.username = :name")
    User getUserByName(@Param("name") String name);
}
