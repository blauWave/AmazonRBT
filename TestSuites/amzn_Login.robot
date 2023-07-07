*** Settings ***
Resource    ../Resources/amazon.robot
Resource    ../Resources/common.robot
Resource    ../Resources/amazon_datareader.robot

Library      Dialogs
Library      OperatingSystem
Test Setup     start browser
Test Teardown    exit browser


*** Variables ***
#Browsers Firefox, Chrome, Edge
${Url}               https://www.amazon.com/
${Browser}                     Chrome
&{proddata}     searchitem=iphone   expected=iphone
&{credential}   email=anjali_am@outlook.com  password=testpassword
${filepath}    C:\\Users\\PC\\PycharmProjects\\AmazonRBT\\TestData\\csvdata.csv
${filepathprod}  C:\\Users\\PC\\PycharmProjects\\AmazonRBT\\TestData\\product.csv
*** Test Cases ***
amazon login invalid scenarios
    [Tags]  Negative
    [Documentation]    to test  invalid login scenarios with data driven
    @{csvdata}=    Get csv data    ${filepath}
    FOR    ${val}    IN    @{csvdata}
        log to console    ${val}
        amzon login csv    @{val}
    END
amazon login scenarios
    [Tags]    Positive
    [Documentation]    to test  valid login scenarios
    [Template]    amazon login
    &{credential}





