*** Settings ***
Library     RPA.Browser.Selenium    auto_close=${FALSE}


*** Tasks ***
main
    Open Available Browser    https://randommer.io/random-animals    maximized=${TRUE}
    ${animal}=    Get Text    alias:Paragraph
    Go To    https://randommer.io/random-cities
    ${city}=    Get Text    alias:Voronezh
    Go To    https://creator.nightcafe.studio/
    Input Text    alias:Textinput    ${animal} in ${city}
    Click Element    alias:Span

