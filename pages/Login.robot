*** Settings ***
Library    SeleniumLibrary
Library    ../libraries/chrome_options.py
Resource    ../resources/data.robot

*** Variables ***
${BASE_URL}=    https://www.saucedemo.com
${TITLE}=    Swag Labs

*** Keywords ***
Open Browser and Navigate To Page
    ${options}    Get Chrome Options
    Open Browser    browser=chrome    options=${options}
    Go to    ${BASE_URL}
    
Fill the Login Form
     Input Text    id:user-name   ${username}
     Input Password    id:password    ${password}
     Click Button    login-button
     Location Should Be    ${BASE_URL}/inventory.html
     Title Should Be     ${TITLE}