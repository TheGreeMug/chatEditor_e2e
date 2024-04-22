*** Settings ***
Documentation       Check "4-Basic SS" ENGLISH vocabulary
Resource            ../../../../../Resources/resources.robot
Resource            ../../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor

*** Test Cases ***
Validate "4-Basic SS" vocabulary
    Create new configuration of ChatEditor
    Select Touch Chat
    Select English
    Select Symbol Set: SymbolStix without aditional vocabularies
    Create english user
    Maximize the window
    Reach Library of vocabs
    Select TouchChatEnglishSimbolstix vocabularies    ${4BasicSS}

Assertions for "4-Basic SS" vocabulary
    # Click on a button's text - 4-Basic SS
    Set Resolution    ${window}    1800    800
    ${text}    Set Variable    I want
    Click On Button With Text    ${text}    4BasicSS\\iWant.png    0.6
    ${message}=    RPA.Windows.Get Value    id:1000
    Should Contain    ${message}    I want

    Check to see if the user exist

    # Check to see if the dictionary's name is included in the text box - 4-Basic SS
    RPA.Windows.Click    ${edit_mode_btn}
    ${message}=    RPA.Windows.Get Text    id:65535
    Should Contain    ${message}    The vocabulary "4-Basic SS"
    RPA.Windows.Click    id:7

    # Check to see if the dictionary's 'name' attribute is its actual name - 4-Basic SS
    RPA.Desktop.Press Keys    alt    l
    RPA.Windows.Click    name:English
    RPA.Windows.Click    name:SymbolStix
    ${name}=    RPA.Windows.Get Attribute    name:"4-Basic SS (Current)"    Name
    Should Be Equal    ${name}    4-Basic SS (Current)
