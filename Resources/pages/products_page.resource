*** Settings ***
Library     SeleniumLibrary
Resource    ../variables.resource


*** Keywords ***

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
