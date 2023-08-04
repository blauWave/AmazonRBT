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
amazon logout scenarios
    [Tags]     logout
    [Documentation]    to test  valid logout scenarios
    [Template]    amazon logout
    &{credential}







