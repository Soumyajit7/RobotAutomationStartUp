*** Settings ***
Library     SeleniumLibrary
Resource    ../Resources/robofiles/MyKeywords.robot

*** Variables ***
${BROWSER}    Chrome
${BROWSER_DETACH}    False    # True / False
${URL}    https://www.saucedemo.com/v1/

*** Keywords ***


*** Test Cases ***

Saucedemo Testcase
    Saucedemo Testcase
    [Tags]    test231