*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${add-to-cart-backpack}    id:add-to-cart-sauce-labs-backpack
${first-product-price}    .inventory_item_price
${shopping-cart}    shopping_cart_container
${products}    //button[contains(@id,'add-to-cart')]
${remove-product}    //button[contains(@id,'remove')]
${cart-items}     //div[@class ='inventory_item_price']
${active-option}     //span[@class='active_option']

${za-first-element}    //div[@class='inventory_list']/div[1]/div[2]/div/a/div
${za-second-element}    //div[@class='inventory_list']/div[2]/div[2]/div/a/div
${za-third-element}    //div[@class='inventory_list']/div[3]/div[2]/div/a/div
${za-forth-element}    //div[@class='inventory_list']/div[4]/div[2]/div/a/div
${za-fifth-element}    //div[@class='inventory_list']/div[5]/div[2]/div/a/div
${za-sixth-element}    //div[@class='inventory_list']/div[6]/div[2]/div/a/div


*** Keywords ***
Add product to carts
    Click Element    ${add-to-cart-backpack}
    Element Should Be Visible    ${shopping-cart}
    Click Element    ${shopping-cart}

Add and remove all the products to cart
    @{products}=    Get WebElements   //button[contains(@id,'add-to-cart')]
    FOR    ${product}     IN    @{products}
        Click Element     ${product}
    END
     @{remove-products}=    Get WebElements   //button[contains(@id,'remove')]
    FOR    ${remove-product}     IN    @{remove-products}
        Click Element     ${remove-product}
    END
    Wait Until Element Is Visible    ${shopping-cart}
    Click Element    ${shopping-cart}

Filter the products in reverse alphabetically
    Select From List By Value     //select[@class='product_sort_container']    za

Filter the products in alphabetically
    Select From List By Value     //select[@class='product_sort_container']    az


verify products sorted alphabetically
    ${expectedProductTexts}    Create List    Test.allTheThings() T-Shirt (Red)    Sauce Labs Onesie    Sauce Labs Fleece Jacket    Sauce Labs Bolt T-Shirt    Sauce Labs Bike Light    Sauce Labs Backpack
    ${webElements}=    Get WebElements     //div[@class='inventory_item']
    FOR    ${index}    IN RANGE    0    5
        ${expectedProductTexts}=    Get Text         ${webElements}[${index}]
        Should Contain    ${expectedProductTexts}     ${expectedProductTexts}[${index}]
    END

verify products sorted reverse alphabetically
    ${expectedProductTexts}    Create List    Sauce Labs Backpack    Sauce Labs Bike Light    Sauce Labs Bolt T-Shirt    Sauce Labs Fleece Jacket    Sauce Labs Onesie    Test.allTheThings() T-Shirt (Red)
    ${webElements}=    Get WebElements     //div[@class='inventory_item']
    FOR    ${index}    IN RANGE    0    5
        ${expectedProductTexts}=    Get Text         ${webElements}[${index}]
        Should Contain    ${expectedProductTexts}     ${expectedProductTexts}[${index}]
    END


   