*** Settings ***
Documentation       Check "Communication Journey Aphasia SS" ENGLISH vocabulary
Resource            ../../../../../Resources/resources.robot
Resource            ../../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor

*** Test Cases ***
Validate "Communication Journey Aphasia SS" vocabulary
    Create new configuration of ChatEditor
    Select Touch Chat
    Select English
    Select Symbol Set: SymbolStix without aditional vocabularies
    Create english user
    Maximize the window
    Reach Library of vocabs
    Select TouchChatEnglishSimbolstix vocabularies    ${communicationJourneyAphasiaSS}

Assertions for "Communication Journey Aphasia SS" vocabulary
    # Click on a button's text - Communication Journey Aphasia SS
    Set Resolution    ${window}    1800    800
    ${text}    Set Variable    Things
    Click On Button With Text    ${text}    communicationJourneyAphasiaSS\\things.png    0.6

    Check to see if the user exist

    # Check to see if the dictionary's name is included in the text box - Communication Journey Aphasia SS
    RPA.Windows.Click    ${edit_mode_btn}
    ${message}=    RPA.Windows.Get Text    id:65535
    Should Contain    ${message}    The vocabulary "Communication Journey Aphasia SS"
    RPA.Windows.Click    id:7

    # Check to see if the dictionary's 'name' attribute is its actual name - Communication Journey Aphasia SS
    RPA.Desktop.Press Keys    alt    l
    RPA.Windows.Click    name:English
    RPA.Windows.Click    name:SymbolStix
    ${name}=    RPA.Windows.Get Attribute    name:"Communication Journey Aphasia SS (Current)"    Name
    Should Be Equal    ${name}    Communication Journey Aphasia SS (Current)
