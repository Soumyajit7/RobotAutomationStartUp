*** Settings ***
Library     SeleniumLibrary
Library    ../pyfiles/Utilities.py
Library    ../Resources/pyfiles/ExcelReaderWriter.py    ../Data/TestData.xlsx
Resource    ../Resources/robofiles/Xpaths.robot
Resource    ../robofiles/Common.robot


*** Keywords ***

Open Browser and Login
    [Documentation]    Open Browser and Login
    [Arguments]
    Open Dynamic Browser      ${URL}      ${BROWSER}
    Maximize Browser Window
    Input Dynamic Element    ${input_contain_id}    user-name    standard_user
    Input Dynamic Element    ${input_contain_id}    password    secret_sauce
    Click Dynamic Element    ${input_contain_id}    login-button
    Sleep    5


Add Cart product
    [Documentation]    Add Cart all products
    [Arguments]
    CLick Dynamic Element    ${div_contain_text}    Sauce Labs Backpack
    Click Dynamic Element    ${button_contain_text}    ADD TO CART
    Click Dynamic Element    ${button_contain_text}    Back


Saucedemo Testcase
    [Documentation]    Saucedemo Testcase
    [Arguments]    
    Given Open Browser and Login
    Then Add Cart product