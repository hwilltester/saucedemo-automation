*** Settings ***
Resource        ../Resources/keywords.resource
Test Setup      Open Browser To Login Page
Test Teardown   Close Test Browser


*** Test Cases ***

Valid Login Shows Products Page
    [Documentation]    Standard user logs in — products page must appear.
    [Tags]    login    positive
    Login With              ${VALID_USER}    ${PASSWORD}
    Verify Products Page Is Shown

Locked Out User Cannot Login
    [Documentation]    Locked user must see an error, not get in.
    [Tags]    login    negative
    Login With              ${LOCKED_USER}    ${PASSWORD}
    Verify Error Message Is Shown

Wrong Password Shows Error
    [Documentation]    Wrong password must show an error message.
    [Tags]    login    negative
    Login With              ${VALID_USER}    ${WRONG_PASSWORD}
    Verify Error Message Is Shown
