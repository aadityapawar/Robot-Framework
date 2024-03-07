*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${first-product-carts}     //div[@class = 'inventory_item_name']



*** Keywords ***
Verify product on checkout overview page
    Element Text Should Be    ${first-product-carts}    Sauce Labs Backpack