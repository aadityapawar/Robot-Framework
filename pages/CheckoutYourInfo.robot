*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/data.robot


*** Variables ***
${firstName}    id:first-name
${lastName}    id:last-name
${postCode}    id:postal-code
${continue}    id:continue
${checkout}    checkout


*** Keywords ***
User navigates to checkout page
    Location Should Be    ${BASE_URL}/checkout-step-one.html

Fill the user details
    Input Text    ${firstName}    firstName
    Input Text    ${lastName}     lastName
    Input Text    ${postCode}        3000
    Click Element    ${continue}