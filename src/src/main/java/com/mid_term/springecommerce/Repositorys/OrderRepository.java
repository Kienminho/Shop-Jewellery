package com.mid_term.springecommerce.Repositorys;

import com.mid_term.springecommerce.Models.Order;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderRepository extends JpaRepository<Order, Long> {
}
