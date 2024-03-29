*** Settings ***
Documentation    reading all the data required for amazon application
Library    ../Libraries/csvinput.py
Library    ../Libraries/excelreader.py
*** Variables ***


*** Keywords ***
Get csv data
    [Arguments]    ${filepath}
    ${data} =    csv input process   ${filepath}
    [Return]    ${data}

Get excel data
    [Arguments]    ${filepath}    ${minrow}    ${maxrow}    ${mincol}    ${maxcol}
    ${data}=    excel input process  ${filepath}    ${minrow}    ${maxrow}    ${mincol}    ${maxcol}
    [Return]    ${data}