*** Settings ***
Library    SeleniumLibrary
Library    ../libraries/chrome_options.py

*** Variables ***
${BASE_URL}=    https://www.saucedemo.com
${TITLE}=    Swag Labs

*** Keywords ***
Open Browser and Navigate To Page
#    ${options}    Get Chrome Options
    Open Browser    browser=chrome    options=${options}
    Go to    ${BASE_URL}

Input Username
    [Arguments]    ${username}
    Input Text    id:user-name   ${username}

Input Password
    [Arguments]    ${password}
    Input Text    id:password    ${password}

Submit Credentials
    Click Button    login-button

Welcome Page Should Be Open
    Location Should Be    ${BASE_URL}/inventory.html
    Title Should Be     ${TITLE}