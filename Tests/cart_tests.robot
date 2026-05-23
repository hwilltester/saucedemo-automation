*** Settings ***
Resource        ../Resources/keywords.resource
Test Setup      Open Browser To Login Page
Test Teardown   Close Test Browser


*** Test Cases ***

Add One Item To Cart
    [Documentation]    Add backpack — cart badge must show 1.
    [Tags]    cart    positive
    Login With                  ${VALID_USER}    ${PASSWORD}
    Add Backpack To Cart
    Verify Cart Badge Count Is  1

Add Two Items To Cart
    [Documentation]    Add backpack and bike light — cart badge must show 2.
    [Tags]    cart    positive
    Login With                  ${VALID_USER}    ${PASSWORD}
    Add Backpack To Cart
    Add Bike Light To Cart
    Verify Cart Badge Count Is  2

Remove Item From Cart
    [Documentation]    Add backpack then remove it — cart must be empty.
    [Tags]    cart    negative
    Login With                  ${VALID_USER}    ${PASSWORD}
    Add Backpack To Cart
    Remove Backpack From Cart
    Go To Cart
    Page Should Not Contain Element    ${LOC_CART_ITEM}

Cart Page Shows Added Items
    [Documentation]    Items added must appear on the cart page.
    [Tags]    cart    positive
    Login With                  ${VALID_USER}    ${PASSWORD}
    Add Backpack To Cart
    Add Bike Light To Cart
    Go To Cart
    Verify Cart Has Items

Complete Checkout Flow
    [Documentation]    Add item, go to cart, fill checkout, finish — order must complete.
    [Tags]    checkout    e2e
    Login With                  ${VALID_USER}    ${PASSWORD}
    Add Backpack To Cart
    Go To Cart
    Complete Checkout           Htuu Will    Oo    10110
    Verify Order Is Complete
