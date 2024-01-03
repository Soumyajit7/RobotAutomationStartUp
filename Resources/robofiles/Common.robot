*** Settings ***
Library     SeleniumLibrary
Library    ../pyfiles/Utilities.py
Resource    ../robofiles/Xpaths.robot


*** Keywords ***
Highlight Element
    [Documentation]    Highlighting the current element that is been interacted.
    [Arguments]    ${obj}
    ${attr}=  Get Element Attribute  ${obj}    style
    ${rObj}=    Utilities.replace_string    ${obj}    xpath://    //
    ${rfObj}=    Utilities.replace_string    ${rObj}    xpath:.//    //
    ${contains1}=    Run Keyword And Return Status    Should Contain    ${rfObj}    xpath:(//
    ${contains2}=    Run Keyword And Return Status    Should Contain    ${rfObj}    //
    IF  '${contains1}'=='False'
        IF    '${contains2}'=='True'
            SeleniumLibrary.Execute Javascript    document.evaluate("${rfObj}",document.body,null,9,null).singleNodeValue.setAttribute('style','background: grey; border: solid 3px yellow');
        END
    END


Click Dynamic Element
    [Arguments]    ${obj}    ${replaceValue}
    [Documentation]    This will do dynamic click operation using replace value in the xpath
    ${dynObj}=    Replace String    ${obj}    <<<>>>    ${replaceValue}
    Run Keyword and Ignore Error    Mouse Over    ${dynObj}
    Wait Until Element is visible    ${dynObj}    timeout=30
    Highlight Element    ${dynObj}
    Click Element    ${dynObj}
    Sleep    4


Input Dynamic Element
    [Arguments]    ${obj}    ${replaceValue}    ${text_value}
    [Documentation]    This will do dynamic click operation using replace value in the xpath
    ${dynObj}=    Replace String    ${obj}    <<<>>>    ${replaceValue}
    Run Keyword and Ignore Error    Mouse Over    ${dynObj}
    Wait Until Element is visible    ${dynObj}    timeout=30
    Highlight Element    ${dynObj}
    Input Text    ${dynObj}    ${text_value}
    Sleep    2


Open Dynamic Browser
    [Arguments]    ${URL}      ${BROWSER}
    [Documentation]    Open browser and Login to the site
    Open Browser    ${URL}     ${BROWSER}   options=add_experimental_option("detach", ${BROWSER_DETACH})
    Maximize Browser Window
    Sleep    2