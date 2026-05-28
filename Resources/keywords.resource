*** Settings ***
Library     SeleniumLibrary
Resource    variables.resource


*** Keywords ***

# ── Browser ───────────────────────────────────────────────────────────────────

Open Browser To Login Page
    [Documentation]    Opens browser and goes to login page.
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    ${LOC_USERNAME}    ${WAIT}

Close Test Browser
    [Documentation]    Closes the browser after each test.
    Close All Browsers


# ── Login ─────────────────────────────────────────────────────────────────────

Login With
    [Documentation]    Logs in with the given username and password.
    [Arguments]         ${username}    ${password}
    Input Text          ${LOC_USERNAME}    ${username}
    Input Password      ${LOC_PASSWORD}    ${password}
    Click Button        ${LOC_LOGIN_BTN}

Verify Products Page Is Shown
    [Documentation]    Checks that login succeeded and products page loaded.
    Wait Until Element Is Visible    ${LOC_PRODUCTS_TITLE}    ${WAIT}
    Element Text Should Be           ${LOC_PRODUCTS_TITLE}    Products

Verify Error Message Is Shown
    [Documentation]    Checks that a login error message appeared.
    Wait Until Element Is Visible    ${LOC_ERROR_MSG}    ${WAIT}
    Element Should Be Visible        ${LOC_ERROR_MSG}


# ── Products ──────────────────────────────────────────────────────────────────

Sort Products By
    [Documentation]    Selects a sort option from the dropdown.
    [Arguments]         ${option}
    Wait Until Element Is Visible    ${LOC_SORT_DROPDOWN}    ${WAIT}
    Select From List By Value        ${LOC_SORT_DROPDOWN}    ${option}

Get First Product Name
    [Documentation]    Returns the name of the first product shown.
    Wait Until Element Is Visible    ${LOC_FIRST_PRODUCT}    ${WAIT}
    ${name}=    Get Text             ${LOC_FIRST_PRODUCT}
    RETURN    ${name}


# ── Cart ──────────────────────────────────────────────────────────────────────

Add Backpack To Cart
    [Documentation]    Adds backpack and waits for state to update.
    Wait Until Page Contains Element    id:add-to-cart-sauce-labs-backpack    ${WAIT}
    Click Element                       id:add-to-cart-sauce-labs-backpack
    Wait Until Element Is Visible       id:remove-sauce-labs-backpack         ${WAIT}

Add Bike Light To Cart
    [Documentation]    Adds bike light and waits for state to update.
    Wait Until Page Contains Element    ${LOC_ADD_BIKE_LIGHT}     ${WAIT}
    Click Element                       ${LOC_ADD_BIKE_LIGHT}
    Wait Until Page Contains Element    id:remove-sauce-labs-bike-light    ${WAIT}

Remove Backpack From Cart
    [Documentation]    Removes backpack from cart page (more reliable than products page).
    Go To                               ${BASE_URL}/cart.html
    Wait Until Page Contains Element    css:[data-test="remove-sauce-labs-backpack"]    ${WAIT}
    Click Element                       css:[data-test="remove-sauce-labs-backpack"]
    Sleep                               1s

Go To Cart
    [Documentation]    Navigates directly to cart page.
    Go To    ${BASE_URL}/cart.html
    Wait Until Element Is Visible    ${LOC_CHECKOUT_BTN}    ${WAIT}

Verify Cart Badge Count Is
    [Documentation]    Checks cart badge count using DOM presence not visibility.
    [Arguments]         ${expected_count}
    Wait Until Page Contains Element    ${LOC_CART_BADGE}    ${WAIT}
    Element Text Should Be              ${LOC_CART_BADGE}    ${expected_count}

Verify Cart Has Items
    [Documentation]    Checks that at least one item is in the cart page.
    Page Should Contain Element    ${LOC_CART_ITEM}


# ── Checkout ──────────────────────────────────────────────────────────────────

Complete Checkout
    [Documentation]    Fills checkout form and finishes order.
    [Arguments]         ${first}    ${last}    ${postal}
    Click Element       ${LOC_CHECKOUT_BTN}
    Sleep               2s
    Wait Until Element Is Visible    ${LOC_FIRST_NAME}    ${WAIT}
    Input Text          ${LOC_FIRST_NAME}     ${first}
    Input Text          ${LOC_LAST_NAME}      ${last}
    Input Text          ${LOC_POSTAL_CODE}    ${postal}
    Click Element       ${LOC_CONTINUE_BTN}
    Wait Until Element Is Visible    ${LOC_FINISH_BTN}    ${WAIT}
    Click Element       ${LOC_FINISH_BTN}

Verify Order Is Complete
    [Documentation]    Checks the order confirmation message.
    Wait Until Element Is Visible    ${LOC_COMPLETE_HEADER}    ${WAIT}
    Element Text Should Be           ${LOC_COMPLETE_HEADER}    Thank you for your order!
