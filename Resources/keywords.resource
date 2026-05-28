*** Settings ***
Library     SeleniumLibrary
Resource    variables.resource
Resource    pages/login_page.resource
Resource    pages/products_page.resource
Resource    pages/cart_page.resource
Resource    pages/checkout_page.resource


*** Keywords ***

Open Browser To Login Page
    [Documentation]    Opens browser and goes to login page.
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    ${LOC_USERNAME}    ${WAIT}

Close Test Browser
    [Documentation]    Closes the browser after each test.
    Close All Browsers
