const tbody = $(".tbody");
const CartSubtotalPrice = $('.cart-subtotal-price');
const OrderTotalPrice = $('.order-total-price');
let total =0;
let name = $('#name');
let address = $('#address');
let city = $('#city');
let email = $('#email');
let phone = $('#phone');
fetch("/api/products/cart")
    .then(res => res.json())
    .then(res => {
        displayCheckout(res.data);
    })
    .catch(err => console.log(err))

function handleOrder() {
    if(validateForm()) {
        const infoOrder = {
            totalPrice: total,
            name: name.val(),
            address: address.val(),
            phone: phone.val(),
            email: email.val(),
            city: city.val(),
        }

        fetch("/api/products/checkout-order", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(infoOrder)
        })
            .then(res => res.json())
            .then(res => {
                if(res.statusCode === 200) {
                    alert("Đặt hàng thành công, cảm ơn bạn đã mua sắm tại cửa hàng của chúng tôi.");
                    window.location.href = "/home";
                    document.documentElement.style.setProperty('--cart-count', "'0'");
                }
            })
            .catch(err => console.log(err))
    }
}

function validateForm() {
    if (!name.val() || !address.val() || !city.val() || !email.val() || !phone.val()) {
        alert('Vui lòng kiểm tra lại thông tin đặt hàng.');
        return false;
    }

    return true;
}

function displayCheckout(arr) {

    arr.map(i => {
        total += i.totalPrice;
        let html = `<tr class="cart_item">
                                    <td class="product-name">
                                        ${i.product.name} <strong class="product-quantity"> x ${i.quantity}</strong>
                                    </td>
                                    <td class="product-total">
                                        <span class="amount">${i.totalPrice.toLocaleString('vi-VN') + " đ"}</span>
                                    </td>
                                </tr>`
        tbody.append(html);
    })
    CartSubtotalPrice.text(total.toLocaleString('vi-VN') + " đ");
    OrderTotalPrice.text(total.toLocaleString('vi-VN') + " đ");
}