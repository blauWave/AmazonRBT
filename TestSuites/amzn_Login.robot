*** Settings ***
Resource    ../Resources/amazon.robot
Resource    ../Resources/common.robot
Resource    ../Resources/amazon_datareader.robot

Library      Dialogs
Library      OperatingSystem

Test Setup     start browser
Test Teardown    exit browser


*** Variables ***
&{proddata}         searchitem=iphone   expected=iphone
&{credential}       email=akyurt.a@gmx.de  password=17290641Naz.
${filepath}         C:\\Users\\PC\\PycharmProjects\\AmazonRBT\\TestData\\csvdata.csv
${filepathprod}     C:\\Users\\PC\\PycharmProjects\\AmazonRBT\\TestData\\product.csv


*** Test Cases ***
amazon login invalid scenarios
    [Tags]  Negative skome regression
    [Documentation]    to test  invalid login scenarios with data driven
    #List
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

amazon logout scenarios
    [Tags]     logout
    [Documentation]    to test  valid logout scenarios
    [Template]    amazon logout
    &{credential}







