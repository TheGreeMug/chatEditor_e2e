*** Settings ***
Documentation       Check "Talk-About" ENGLISH vocabulary
Resource            ../../../../../Resources/resources.robot
Resource            ../../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor

*** Test Cases ***
Validate "Talk-About" vocabulary
    Create new configuration of ChatEditor
    Select Touch Chat
    Select English
    Select Symbol Set: SymbolStix with Talk-About aditional vocabulary
    Create english user
    Maximize the window
    Reach Library of vocabs
    Select "Talk-About" vocabulary

Assertions for "Talk-About" vocabulary
    # Click on a button's text - Talk-About
    Set Resolution    ${window}    1800    800
    ${text}    Set Variable    GO BACK
    Click On Button With Text    ${text}    talkAbout\\goBack.png    0.6

    Check to see if the user exist

    # Check to see if the dictionary's name is included in the text box - Talk-About
    RPA.Windows.Click    ${edit_mode_btn}
    ${message}=    RPA.Windows.Get Text    id:65535
    Should Contain     ${message}    The vocabulary "Talk-About"
    RPA.Windows.Click    id:7

    # Check to see if the dictionary's 'name' attribute is its actual name - Talk-About
    RPA.Desktop.Press Keys    alt    l
    RPA.Windows.Click    name:English
    RPA.Windows.Click    name:SymbolStix
    ${name}=    RPA.Windows.Get Attribute        name:"Talk-About (Current)"    Name
    Should Be Equal    ${name}    Talk-About (Current)
