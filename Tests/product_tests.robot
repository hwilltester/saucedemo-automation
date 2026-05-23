*** Settings ***
Resource        ../Resources/keywords.resource
Test Setup      Open Browser To Login Page
Test Teardown   Close Test Browser


*** Test Cases ***

Products Page Loads After Login
    [Documentation]    Products page title must say "Products" after login.
    [Tags]    products    positive
    Login With                  ${VALID_USER}    ${PASSWORD}
    Verify Products Page Is Shown

Sort Products Low To High
    [Documentation]    Sort by price low-to-high — first item must be Sauce Labs Bike Light.
    [Tags]    products    sorting
    Login With                  ${VALID_USER}    ${PASSWORD}
    Sort Products By            lohi
    ${first}=                   Get First Product Name
    Should Be Equal             ${first}    Sauce Labs Bike Light

Sort Products High To Low
    [Documentation]    Sort by price high-to-low — first item must be Sauce Labs Fleece Jacket.
    [Tags]    products    sorting
    Login With                  ${VALID_USER}    ${PASSWORD}
    Sort Products By            hilo
    ${first}=                   Get First Product Name
    Should Be Equal             ${first}    Sauce Labs Fleece Jacket

Sort Products A To Z
    [Documentation]    Default sort A-Z — first item must be Sauce Labs Backpack.
    [Tags]    products    sorting
    Login With                  ${VALID_USER}    ${PASSWORD}
    Sort Products By            az
    ${first}=                   Get First Product Name
    Should Be Equal             ${first}    Sauce Labs Backpack
