*** Settings ***
Resource        ../Resources/keywords.resource
Test Setup      Open Browser To Login Page
Test Teardown   Close Test Browser

*** Test Cases ***
Add One Item To Cart
    [Documentation]    Add backpack — cart must have 1 item.
    [Tags]    cart    positive
    Login With                          ${VALID_USER}    ${PASSWORD}
    Add Backpack To Cart
    Go To                               ${BASE_URL}/cart.html
    Wait Until Page Contains Element    ${LOC_CART_ITEM}    ${WAIT}
    ${count}=    Get Element Count      ${LOC_CART_ITEM}
    Should Be Equal As Integers         ${count}    1

Add Two Items To Cart
    [Documentation]    Add backpack and bike light — cart must have 2 items.
    [Tags]    cart    positive
    Login With                          ${VALID_USER}    ${PASSWORD}
    Add Backpack To Cart
    Add Bike Light To Cart
    Go To                               ${BASE_URL}/cart.html
    Wait Until Page Contains Element    ${LOC_CART_ITEM}    ${WAIT}
    ${count}=    Get Element Count      ${LOC_CART_ITEM}
    Should Be Equal As Integers         ${count}    2

Remove Item From Cart
    [Documentation]    Add backpack, remove from cart — cart must be empty.
    [Tags]    cart    negative
    Login With                          ${VALID_USER}    ${PASSWORD}
    Add Backpack To Cart
    Remove Backpack From Cart
    Page Should Not Contain Element     ${LOC_CART_ITEM}

Cart Page Shows Added Items
    [Documentation]    Items added must appear on the cart page.
    [Tags]    cart    positive
    Login With                          ${VALID_USER}    ${PASSWORD}
    Add Backpack To Cart
    Add Bike Light To Cart
    Go To Cart
    Verify Cart Has Items

Complete Checkout Flow
    [Documentation]    Add item, checkout, finish — order must complete.
    [Tags]    checkout    e2e
    Login With                          ${VALID_USER}    ${PASSWORD}
    Add Backpack To Cart
    Go To Cart
    Complete Checkout                   Htuu Will    Oo    10110
    Verify Order Is Complete
