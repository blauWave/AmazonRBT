*** Settings ***
Library                 SeleniumLibrary
Library                 Collections
Library                 BuiltIn
Library                 DateTime
Library                 String
Library                 DebugLibrary


## Custom Libraries:
Library                 ../Libraries/Methods.py
Library                 ../Libraries/Driver_Manager.py
Library                 ../Libraries/LambdaTestStatus.py

*** Variables ***
${text}                             Done! This text is coming from Robot Framework
${environmentToRunTest}             LOCAL
${os}                               Windows
${osVersion}                        10
${browserVersion}                   latest

${Driver}                           webdriverManager


# Here we can set the Browser-Window Sizes in Pixels.
${SCREEN_WIDTH}   1440
${SCREEN_HEIGHT}  900


*** Keywords ***
Open Browser with Base-URL and Base-Browser
    [Documentation]    Generic test setup to switch between local and Browserstack testsetup
    [Arguments]      ${Url}    ${Browser}

    Run Keyword If    '${environmentToRunTest}'=='LOCAL'           ${Driver}    ${Url}     ${Browser}
    ...     ELSE IF   '${environmentToRunTest}'=='BROWSERSTACK'    testSetupBrowserstack    ${Url}
    ...     ELSE IF   '${environmentToRunTest}'=='LAMBDATEST'    testSetupLambdatest    ${Url}
    ...     ELSE      Log       testSetup went wrong. Check the value of the variable.


testSetupLocal
    [Arguments]      ${Url}     ${Browser}
    open browser    ${Url}    ${Browser}


Close Browser Session
    Run keyword if  '${environmentToRunTest}'=='LAMBDATEST'
    ...  Report Lambdatest Status
    ...  ${TEST_NAME}
    ...  ${TEST_STATUS}
    close all browsers


webdriverManager
    [Arguments]      ${Url}     ${Browser}
    #Create Webdriver    ${Browser}    #executable_path=${chromedriver_path}
    Go to  ${Url}
    maximize browser window


