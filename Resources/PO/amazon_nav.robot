*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${amazon}   https://www.amazon.in/


*** Keywords ***
navigate to amazon home page
    go to        ${amazon}

navigate to amazon login page
    go to   https://www.amazon.de/ap/signin?openid.pape.max_auth_age=0&openid.return_to=https%3A%2F%2Fwww.amazon.de%2F%3Fref_%3Dnav_custrec_signin&openid.identity=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.assoc_handle=deflex&openid.mode=checkid_setup&openid.claimed_id=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.ns=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0
navigate to amazon cart page
    go to    https://www.amazon.in/gp/cart/view.html?ref_=nav_cart

navigate to user account
    go to    https://www.amazon.in/gp/css/homepage.html?ref_=nav_AccountFlyout_ya
navigate to address update page
    go to  https://www.amazon.in/gp/buy/addressselect/handlers/display.html?hasWorkingJavascript=1