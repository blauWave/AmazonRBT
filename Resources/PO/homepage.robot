*** Settings ***
Library    SeleniumLibrary
Library    DebugLibrary

*** Variables ***

*** Keywords ***
search item
    [Arguments]    ${searchitem}
    input text    id:twotabsearchtextbox    ${searchitem}
    click button    nav-search-submit-button


search and select item
    [Arguments]    ${searchitem}    ${locator}
    input text    id:twotabsearchtextbox    ${searchitem}
    click button    nav-search-submit-button
    click element    ${locator}
    sleep   3s
    #debug
    switch window    NEW
    click button    add-to-cart-button



