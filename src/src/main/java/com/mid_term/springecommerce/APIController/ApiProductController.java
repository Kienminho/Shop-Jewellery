package com.mid_term.springecommerce.APIController;

import com.mid_term.springecommerce.DTO.ProductDTO;
import com.mid_term.springecommerce.DTO.ProductRequest;
import com.mid_term.springecommerce.Models.*;
import com.mid_term.springecommerce.Repositorys.*;
import com.mid_term.springecommerce.Utils.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;


@RestController
@RequestMapping("/api/products/")
public class ApiProductController {

    @Value("${spring.servlet.multipart.location}")
    private String uploadPath;

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private CategoryRepository categoryRepository;

    @Autowired
    private CartRepository cartRepository;

    @Autowired
    private CartItemRepository cartItemRepository;

    @Autowired
    private OrderRepository orderRepository;

    @GetMapping("get-all-products")
    public Object getAllProducts() {
        List<Product> products = productRepository.findAll();

        return Response.createSuccessResponseModel(products.size(), products);
    }

    //san pham theo category
    @GetMapping("get-products-by-category")
    public Object getProductsByCategory(@RequestParam String category, @RequestParam(defaultValue = "1") int pageIndex) {
        int pageSize = 12;
        System.out.println(category);
        Category c = categoryRepository.findByName(category);
        List<Product> products = productRepository.getProductsByCategory(c);

        int from = 0;
        if(pageIndex !=1) from = (pageIndex - 1) * pageSize;

        List<Product> result = products.stream().skip(from).limit(pageSize)
                .toList();

        return Response.createSuccessResponseModel(products.size(), result);
    }

    @GetMapping("get-total-product-in-cart")
    public Object getTotalProductInCart() {
        Cart cart = cartRepository.getCartByUser(Utils.userLogin);
        if(cart == null) return Response.createErrorResponseModel("Vui lòng đăng nhập!", 0);
        return Response.createSuccessResponseModel(0, cart.getTotalItems());
    }

    //add products to cart
    @PostMapping("add-product-to-cart")
    public Object addProductToCart(@RequestBody Map<String, String> req) {
        if(Utils.userLogin == null) return Response.createErrorResponseModel("Đăng nhập để thêm sản phẩm vào giỏ hàng.",false);
        Long id = Long.parseLong(req.get("productId"));
        Product p = productRepository.getDetailProduct(id);
        CartItem item = cartItemRepository.getCartItem(p, Utils.cart);
        if(item == null) {
            cartItemRepository.save(new CartItem(1, p.getSalePrice(), p.getSalePrice(), Utils.cart, p));
        }
        else {
            int quantity = item.getQuantity() +1;
            int price = item.getTotalPrice() + p.getSalePrice();
            cartItemRepository.updateCartItem(p, quantity, price, Utils.cart);
        }
        Utils.totalProductInCart +=1;
        int totalQuantity = updateCart();

        return Response.createSuccessResponseModel(0,totalQuantity);
    }

    @GetMapping("cart")
    public Object getCartOfUser() {
        List<CartItem> cart = cartItemRepository.getAll(Utils.cart);
        return Response.createSuccessResponseModel(cart.size(),cart);
    }

    @PostMapping("delete-product-in-cart")
    public Object deleteProductInCart(@RequestBody Map<String, String> req) {
        Long id = Long.parseLong(req.get("id"));
        Product p = productRepository.getDetailProduct(id);
        cartItemRepository.deleteCartItemByProduct(p);
        int totalQuantity = updateCart();

        return Response.createSuccessResponseModel(0, totalQuantity);
    }

    @PostMapping("change-quantity-in-cart")
    public Object changeQuantityInCart(@RequestBody Map<String, String> req) {
        Long idProduct = Long.parseLong(req.get("idProduct"));
        Product p = productRepository.getDetailProduct(idProduct);
        int quantity = Integer.parseInt(req.get("quantity"));
        int totalPrice = Integer.parseInt(req.get("totalPrice"));
        //update cart item
        cartItemRepository.updateCartItem(p, quantity, totalPrice, Utils.cart);
        // new quantity of cart item
        int totalQuantity = updateCart();
        return Response.createSuccessResponseModel(0, totalQuantity);
    }

    @PostMapping("checkout-order")
    public Object checkoutOrder(@RequestBody Map<String, String> req) {
        try {
            int totalPrice = Integer.parseInt(req.get("totalPrice"));
            String name  = req.get("name");
            String address = req.get("address");
            String phone = req.get("phone");
            String email = req.get("email");
            String city = req.get("city");

            Order o = new Order(totalPrice, LocalDateTime.now(), name, address, phone, email, city);
            orderRepository.save(o);
            cartItemRepository.deleteCartItemByCart(Utils.cart);
            cartRepository.updateStatusCart(Utils.cart.getId());

            return Response.createSuccessResponseModel(0, true);
        }
        catch (Exception e) {
            return Response.createErrorResponseModel("Deletion failed.", false);
        }

    }

    @GetMapping("searchs")
    public Object getSearch(@RequestParam String keyword, @RequestParam(defaultValue = "1") int pageIndex) {
        int pageSize = 12;
        List<Product> products = productRepository.searchProducts(keyword);
        int from = 0;
        if(pageIndex !=1) from = (pageIndex - 1) * pageSize;

        List<Product> result = products.stream().skip(from).limit(pageSize)
                .toList();
        return Response.createSuccessResponseModel(products.size(), result);
    }

    private int updateCart() {
        Map<String, Long> totals = cartItemRepository.calculateTotalQuantityAndPrice(Utils.cart);
        int totalQuantity = Math.toIntExact(totals.get("totalQuantity"));
        int totalPrice = Math.toIntExact(totals.get("totalPrice"));

        //update info of cart
        cartRepository.updateCart(Utils.cart.getId(), totalPrice, totalQuantity);
        return totalQuantity;
    }

    // ----------------------------------------------------------------
    @PostMapping("add-product")
    public Object addProduct(@ModelAttribute ProductDTO p,
                             @RequestParam("product-image") MultipartFile image) {
        System.out.println(p.getPrice());
        if (!image.isEmpty()) {
            String imageName = UUID.randomUUID() + ".jpg";
            String imagePath = uploadPath+ imageName;
            File f = new File(uploadPath);
            if(!f.exists()) {
                f.mkdir();
            }

            try {
                // Save image to the specified path
                Files.copy(image.getInputStream(), Paths.get(imagePath));
                //Files.write(Paths.get(uploadPath, imageName), image.getBytes());
                Category c = categoryRepository.getReferenceById(Long.parseLong(p.getCategory()));
                Product newProduct = new Product(p.getName(), p.getPrice(),c, p.getDescription());
                // Set the image path as the product's urlImage
                newProduct.setImageUrl("/images/"+imageName);

                // Save product to the database
                productRepository.save(newProduct);

                return Response.createSuccessResponseModel(0, true);
            } catch (IOException e) {
                e.printStackTrace(); // Handle the exception appropriately
                return Response.createErrorResponseModel("Error saving image", false);
            }
        } else {
            // Handle the case when no image is provided
            return Response.createErrorResponseModel("Image is required", false);
        }
    }

    @PostMapping("update-product")
    public  Object updateProduct(@RequestBody ProductRequest req) {
        try {
            String name = req.getName();
            Long id = Long.parseLong(req.getId());
            int price = Integer.parseInt(req.getPrice());
            String description = req.getDescription();

            //update product
            productRepository.updateProduct(id, name, price, description);
            return Response.createSuccessResponseModel(0, true);
        }
        catch (Exception e) {
            return Response.createErrorResponseModel(e.getMessage(), true);
        }

    }

    @DeleteMapping(value = "delete-product", consumes = {MediaType.APPLICATION_FORM_URLENCODED_VALUE})
    public Object deleteProduct(@RequestParam Long id) {
        /*Long idProduct = Long.parseLong(req.get("idProduct"));*/
        productRepository.deleteProduct(id);
        return Response.createSuccessResponseModel(0, true);
    }

}
