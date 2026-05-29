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
    ${options}=    Evaluate    selenium.webdriver.ChromeOptions()    modules=selenium.webdriver
    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Call Method    ${options}    add_argument    --window-size=1920,1080
    Open Browser    ${BASE_URL}    Chrome    options=${options}
    Wait Until Element Is Visible    ${LOC_USERNAME}    ${WAIT}

Close Test Browser
    [Documentation]    Closes the browser after each test.
    Close All Browsers
