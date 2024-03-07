*** Settings ***
Documentation     A test suite to test the functionality of e-commerce web app
Resource    ../pages/Login.robot
Resource    ../pages/Products.robot
Resource    ../pages/Carts.robot
Resource    ../pages/CheckoutYourInfo.robot
Resource    ../pages/CheckoutOverview.robot
Library     SeleniumLibrary
Test Setup    Run Keywords
...    Open Browser and Navigate To Page
...    Fill the Login Form
Test Teardown     Close All Browsers
*** Test Cases ***
Scenario1: Carts Checkout page validation
    Add product to carts
    Verify product on carts page
    User navigates to checkout page
    Fill the user details
    Verify product on checkout overview page

Scenario2: Verify Add and remove products
    Add and remove all the products to cart
    Verify no products on carts page

Scenario3: Verify Product Sorting/Filtering
    Filter the products in alphabetically
    verify products sorted alphabetically

Scenario4: Verify Product Sorting/Filtering
    Filter the products in reverse alphabetically
    verify products sorted reverse alphabetically

    