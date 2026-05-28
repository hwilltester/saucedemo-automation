*** Settings ***
Library     SeleniumLibrary
Resource    ../variables.resource


*** Keywords ***

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
