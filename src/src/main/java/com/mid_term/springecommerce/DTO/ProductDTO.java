package com.mid_term.springecommerce.DTO;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.mid_term.springecommerce.Models.Category;
import lombok.*;

@Data
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor

public class ProductDTO {

    private String name;
    private String category;
    private String description;
    private int price;

}
