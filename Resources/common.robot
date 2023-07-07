*** Settings ***
Library    SeleniumLibrary
Library                 ../Libraries/Driver_Manager.py
*** Variables ***


*** Keywords ***
start browser
    ${chromedriver_path}=    Get Driver Path    Chrome
    Create Webdriver    Chrome    executable_path=${chromedriver_path}
    maximize browser window
exit browser
    close all browsers
