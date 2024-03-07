*** Settings ***

Library    SeleniumLibrary
Resource    ../resources/data.robot
*** Variables ***
${first-product-text}    //div[@class = 'inventory_item_name']
${cart-products}    //div[@class ='cart_item']
${checkout}    checkout





*** Keywords ***
Verify product on carts page
    Element Should Be Visible    ${first-product-text}
    Element Text Should Be    ${first-product-text}    Sauce Labs Backpack
    Element Should Be Visible    ${checkout}
    Click Element    ${checkout}

Verify no products on carts page
    Location Should Be    ${BASE_URL}/cart.html
    Element Should Not Be Visible    ${first-product-text}

