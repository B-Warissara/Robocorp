*** Settings ***
Library     Collections
Library     RPA.Browser.Selenium
Library     RPA.Tables
Library     String


*** Tasks ***
khaosod
    Open Available Browser    https://www.khaosod.co.th/home    maximized=${TRUE}
    ${KhaosodTitle}=    Create List
    ${KhaosodTopic}=    Create List
    ${KhaosodTime}=    Create List
    ${KhaosodContent}=    Create List
    ${KhaosodAttribute}=    Create List
    ${KhaosodImage}=    Create List
    ${KhaosodTag}=    Create List
    Go To    https://www.khaosod.co.th/crime
    FOR    ${count}    IN RANGE    1    11
        ${attribute}=    Get Element Attribute
        ...    xpath:./html/body/main/div[3]/div[1]/div[1]/div[2]/div/div[${count}]/div/div[1]/div/a
        ...    href
        Append To List    ${KhaosodAttribute}    ${attribute}
        ${image}=    Get Element Attribute
        ...    xpath:./html/body/main/div[3]/div[1]/div[1]/div[2]/div/div[${count}]/div/div[1]/div/a/img
        ...    src
        Append To List    ${KhaosodImage}    ${image}
        Execute Javascript    window.scrollTo(0,document.body.scrollHeight)
        Click Element    xpath:./html/body/main/div[3]/div[1]/div[1]/div[2]/div/div[${count}]
        Sleep    3s
        Clear All Highlights
        ${Title}=    Get Text    xpath:/html/body/main/article/div[1]/div/div/h1
        Append To List    ${KhaosodTitle}    ${Title}
        ${Topic}=    Get Text    xpath:/html/body/main/article/div[1]/div/div/div[3]/div[1]/span
        Append To List    ${KhaosodTopic}    ${Topic}
        ${Time}=    Get Text    xpath:/html/body/main/article/div[1]/div/div/div[6]
        Append To List    ${KhaosodTime}    ${Time}
        ${Content}=    Get Text    xpath:/html/body/main/article/div[2]/div[3]/div/div[1]/div[2]
        Append To List    ${KhaosodContent}    ${Content}
        Sleep    3s
        Execute Javascript    window.scrollTo(0,document.body.scrollHeight)
        ${contains}=    Does Page Contain Element
        ...    xpath:/html/body/main/article/div[2]/div[3]/div/div[1]/footer/div/ul
        IF    ${contains}
            ${getcount}=    Get Element Count
            ...    xpath:/html/body/main/article/div[2]/div[3]/div/div[1]/footer/div/ul/li
            Log    ${getcount}
            ${value}=    Set Variable
            FOR    ${countTag}    IN RANGE    1    ${getcount}+1
                ${Tag}=    Get Text
                ...    xpath:/html/body/main/article/div[2]/div[3]/div/div[1]/footer/div/ul/li[${countTag}]
                ${valueTag}=    Set Variable    ${Tag}
                ${value}=    Catenate    ${valueTag}    ,    ${value}
            END
        ELSE
            Run Keyword And Ignore Error    Wait Until Element Is Visible    error
            Run Keyword And Ignore Error    RPA.Browser.Selenium.Get Text    error
            ${value}=    Set Variable    -
        END
        Append To List    ${KhaosodTag}    ${value}
        Go Back
        Sleep    3s
    END
    ${List_data}=    Create Dictionary
    ...    Title=${KhaosodTitle}
    ...    Topic=${KhaosodTopic}
    ...    Date=${KhaosodTime}
    ...    Content=${KhaosodContent}
    ...    Link=${KhaosodAttribute}
    ...    Image=${KhaosodImage}
    ...    Tag=${KhaosodTag}
    ${table}=    Create Table    ${List_data}    ${TRUE}
    Write table to CSV    ${table}    testKhao.csv    encoding=UTF-8-sig