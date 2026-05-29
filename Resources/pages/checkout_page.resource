*** Settings ***
Library     SeleniumLibrary
Resource    ../variables.resource


*** Keywords ***

Complete Checkout
    [Documentation]    Fills checkout form and finishes order.
    [Arguments]         ${first}    ${last}    ${postal}
    Click Element                    ${LOC_CHECKOUT_BTN}
    Wait Until Location Contains     checkout-step-one    ${WAIT}
    Wait Until Element Is Visible    ${LOC_FIRST_NAME}    ${WAIT}
    Scroll Element Into View         ${LOC_FIRST_NAME}
    Input Text                       ${LOC_FIRST_NAME}     ${first}
    Input Text                       ${LOC_LAST_NAME}      ${last}
    Input Text                       ${LOC_POSTAL_CODE}    ${postal}
    Scroll Element Into View         ${LOC_CONTINUE_BTN}
    Click Element                    ${LOC_CONTINUE_BTN}
    Wait Until Location Contains     checkout-step-two    ${WAIT}
    Wait Until Element Is Visible    ${LOC_FINISH_BTN}    ${WAIT}
    Click Element                    ${LOC_FINISH_BTN}

Verify Order Is Complete
    [Documentation]    Checks the order confirmation message.
    Wait Until Element Is Visible    ${LOC_COMPLETE_HEADER}    ${WAIT}
    Element Text Should Be           ${LOC_COMPLETE_HEADER}    Thank you for your order!
