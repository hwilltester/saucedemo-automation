*** Settings ***
Library     SeleniumLibrary
Resource    ../variables.resource


*** Keywords ***

Add Backpack To Cart
    [Documentation]    Adds backpack and waits for state to update.
    Wait Until Element Is Visible       id:add-to-cart-sauce-labs-backpack    ${WAIT}
    Execute JavaScript                  document.getElementById('add-to-cart-sauce-labs-backpack').click()
    Wait Until Element Is Visible       id:remove-sauce-labs-backpack         ${WAIT}

Add Bike Light To Cart
    [Documentation]    Adds bike light and waits for state to update.
    Wait Until Element Is Visible       ${LOC_ADD_BIKE_LIGHT}              ${WAIT}
    Execute JavaScript                  document.getElementById('add-to-cart-sauce-labs-bike-light').click()
    Wait Until Element Is Visible       id:remove-sauce-labs-bike-light    ${WAIT}

Remove Backpack From Cart
    [Documentation]    Removes backpack from cart page.
    Go To                               ${BASE_URL}/cart.html
    Wait Until Element Is Visible       css:[data-test="remove-sauce-labs-backpack"]    ${WAIT}
    Execute JavaScript                  document.querySelector('[data-test="remove-sauce-labs-backpack"]').click()
    Wait Until Element Is Not Visible   css:[data-test="remove-sauce-labs-backpack"]    ${WAIT}

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
