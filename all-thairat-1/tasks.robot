*** Settings ***
Library     Collections
Library     RPA.Browser.Selenium
Library     RPA.Tables
Library     String


*** Tasks ***
All
    Open Available Browser    https://www.thairath.co.th/home    maximized=${TRUE}
    Click Element If Visible    alias:Go1
    Click Element If Visible    alias:Span
    Click Element    xpath://*[@id="TR_Navbar_Navmain_news"]
    ${thairatTitle}=    Create List
    ${thairatTopic}=    Create List
    ${thairatTime}=    Create List
    ${thairatContent}=    Create List
    ${thairatAttribute}=    Create List
    ${thairatImage}=    Create List
    ${thairatTag}=    Create List
    Go To    https://www.thairath.co.th/news/royal
    FOR    ${count}    IN RANGE    1    13
        ${attribute}=    Get Element Attribute
        ...    xpath:.//*[@id="__next"]/main/div/aside/div[1]/div/div[${count}]/div/a
        ...    href
        Append To List    ${thairatAttribute}    ${attribute}
        ${image}=    Get Element Attribute
        ...    xpath:.//*[@id="__next"]/main/div/aside/div[1]/div/div[${count}]/div/a/img
        ...    src
        Append To List    ${thairatImage}    ${image}
        Click Element    xpath:.//*[@id="__next"]/main/div/aside/div[1]/div/div[${count}]
        ${Title}=    Get Text    xpath://*[@id="Article_Detail"]/div/div/div[3]/div[1]/div[1]
        Append To List    ${thairatTitle}    ${Title}
        ${Topic}=    Get Text    xpath://*[@id="Article_Detail"]/div/div/div[2]/div[2]/ul/li[2]
        Append To List    ${thairatTopic}    ${Topic}
        ${Time}=    Get Text    xpath://*[@id="Article_Detail"]/div/div/div[2]/div[1]
        Append To List    ${thairatTime}    ${Time}
        ${Content}=    Get Text    xpath://*[@id="Article_Detail"]/div/div/div[3]/div[1]/div[3]/div[1]
        Append To List    ${thairatContent}    ${Content}
        Sleep    3s
        Execute Javascript    window.scrollTo(0,document.body.scrollHeight)
        ${contains}=    Does Page Contain Element
        ...    xpath:/html/body/div[2]/main/div/div[3]/div/div[3]/div/div/div[2]/div/div
        IF    ${contains}
            ${Tag}=    Get Text    xpath:/html/body/div[2]/main/div/div[3]/div/div[3]/div/div/div[2]/div/div
            Append To List    ${thairatTag}    ${Tag}
        ELSE
            Run Keyword And Ignore Error    Wait Until Element Is Visible    error
            Run Keyword And Ignore Error    RPA.Browser.Selenium.Get Text    error
        END
        Go Back
        Sleep    3s
        Click Element    alias:ดูเพิ่ม
    END
    Go To    https://www.thairath.co.th/news/local
    FOR    ${count}    IN RANGE    1    13
        ${attribute}=    Get Element Attribute
        ...    xpath:.//*[@id="__next"]/main/div/aside/div[1]/div/div[${count}]/div/a
        ...    href
        Append To List    ${thairatAttribute}    ${attribute}
        ${image}=    Get Element Attribute
        ...    xpath:.//*[@id="__next"]/main/div/aside/div[1]/div/div[${count}]/div/a/img
        ...    src
        Append To List    ${thairatImage}    ${image}
        Click Element    xpath://*[@id="__next"]/main/div/aside/div[1]/div/div[${count}]
        ${Title}=    Get Text    xpath://*[@id="Article_Detail"]/div/div/div[3]/div[1]/div[1]
        Append To List    ${thairatTitle}    ${Title}
        ${Topic}=    Get Text    xpath://*[@id="Article_Detail"]/div/div/div[2]/div[2]/ul/li[2]
        Append To List    ${thairatTopic}    ${Topic}
        ${Time}=    Get Text    xpath://*[@id="Article_Detail"]/div/div/div[2]/div[1]
        Append To List    ${thairatTime}    ${Time}
        ${Content}=    Get Text    xpath://*[@id="Article_Detail"]/div/div/div[3]/div[1]/div[3]/div[1]
        Append To List    ${thairatContent}    ${Content}
        Sleep    3s
        Execute Javascript    window.scrollTo(0,document.body.scrollHeight)
        ${contains}=    Does Page Contain Element
        ...    xpath:/html/body/div[2]/main/div/div[4]/div[1]/div[4]/div/div/div[2]/div/div
        IF    ${contains}
            ${Tag}=    Get Text    xpath:/html/body/div[2]/main/div/div[4]/div[1]/div[4]/div/div/div[2]/div/div
            Append To List    ${thairatTag}    ${Tag}
        ELSE
            Run Keyword And Ignore Error    Wait Until Element Is Visible    error
            Run Keyword And Ignore Error    RPA.Browser.Selenium.Get Text    error
        END
        Go Back
        Sleep    3s
        Click Element    alias:ดูเพิ่ม
    END
    Go To    https://www.thairath.co.th/news/society
    FOR    ${count}    IN RANGE    1    13
        ${attribute}=    Get Element Attribute
        ...    xpath:.//*[@id="__next"]/main/div/aside/div[1]/div/div[${count}]/div/a
        ...    href
        Append To List    ${thairatAttribute}    ${attribute}
        ${image}=    Get Element Attribute
        ...    xpath:.//*[@id="__next"]/main/div/aside/div[1]/div/div[${count}]/div/a/img
        ...    src
        Append To List    ${thairatImage}    ${image}
        Click Element    xpath:.//*[@id="__next"]/main/div/aside/div[1]/div/div[${count}]
        ${Title}=    Get Text    xpath://*[@id="Article_Detail"]/div/div/div[3]/div[1]/div[1]
        Append To List    ${thairatTitle}    ${Title}
        ${Topic}=    Get Text    xpath://*[@id="Article_Detail"]/div/div/div[2]/div[2]/ul/li[2]
        Append To List    ${thairatTopic}    ${Topic}
        ${Time}=    Get Text    xpath://*[@id="Article_Detail"]/div/div/div[2]/div[1]
        Append To List    ${thairatTime}    ${Time}
        ${Content}=    Get Text    xpath://*[@id="Article_Detail"]/div/div/div[3]/div[1]/div[3]/div[1]
        Append To List    ${thairatContent}    ${Content}
        Sleep    3s
        Execute Javascript    window.scrollTo(0,document.body.scrollHeight)
        ${contains}=    Does Page Contain Element
        ...    xpath:/html/body/div[2]/main/div/div[4]/div[1]/div[4]/div/div/div[2]/div/div
        IF    ${contains}
            ${Tag}=    Get Text    xpath:/html/body/div[2]/main/div/div[4]/div[1]/div[4]/div/div/div[2]/div/div
            Append To List    ${thairatTag}    ${Tag}
        ELSE
            Run Keyword And Ignore Error    Wait Until Element Is Visible    error
            Run Keyword And Ignore Error    RPA.Browser.Selenium.Get Text    error
        END
        Go Back
        Sleep    3s
        Click Element    alias:ดูเพิ่ม
    END
    Go To    https://www.thairath.co.th/news/politic
    FOR    ${count}    IN RANGE    1    13
        ${attribute}=    Get Element Attribute
        ...    xpath:.//*[@id="__next"]/main/div/aside/div[1]/div/div[${count}]/div/a
        ...    href
        Append To List    ${thairatAttribute}    ${attribute}
        ${image}=    Get Element Attribute
        ...    xpath:.//*[@id="__next"]/main/div/aside/div[1]/div/div[${count}]/div/a/img
        ...    src
        Append To List    ${thairatImage}    ${image}
        Click Element    xpath://*[@id="__next"]/main/div/aside/div[1]/div/div[${count}]
        ${Title}=    Get Text    xpath://*[@id="Article_Detail"]/div/div/div[3]/div[1]/div[1]
        Append To List    ${thairatTitle}    ${Title}
        ${Topic}=    Get Text    xpath://*[@id="Article_Detail"]/div/div/div[2]/div[2]/ul/li[2]
        Append To List    ${thairatTopic}    ${Topic}
        ${Time}=    Get Text    xpath://*[@id="Article_Detail"]/div/div/div[2]/div[1]
        Append To List    ${thairatTime}    ${Time}
        ${Content}=    Get Text    xpath://*[@id="Article_Detail"]/div/div/div[3]/div[1]/div[3]/div[1]
        Append To List    ${thairatContent}    ${Content}
        Sleep    3s
        Execute Javascript    window.scrollTo(0,document.body.scrollHeight)
        ${contains}=    Does Page Contain Element
        ...    xpath:/html/body/div[2]/main/div/div[4]/div[1]/div[4]/div/div/div[2]/div/div
        IF    ${contains}
            ${Tag}=    Get Text    xpath:/html/body/div[2]/main/div/div[4]/div[1]/div[4]/div/div/div[2]/div/div
            Append To List    ${thairatTag}    ${Tag}
        ELSE
            Run Keyword And Ignore Error    Wait Until Element Is Visible    error
            Run Keyword And Ignore Error    RPA.Browser.Selenium.Get Text    error
        END
        Go Back
        Sleep    3s
        Click Element    alias:ดูเพิ่ม
    END
    Go To    https://www.thairath.co.th/business
    FOR    ${count}    IN RANGE    1    4
        ${attribute}=    Get Element Attribute
        ...    xpath:.//*[@id="__next"]/main/div/div[10]/div/div[1]/div[2]/div[${count}]/a
        ...    href
        Append To List    ${thairatAttribute}    ${attribute}
        ${image}=    Get Element Attribute
        ...    xpath:.//*[@id="__next"]/main/div/div[10]/div/div[1]/div[2]/div[${count}]/a/img
        ...    src
        Append To List    ${thairatImage}    ${image}
        Sleep    3s
        Click Element    xpath://*[@id="__next"]/main/div/div[10]/div/div[1]/div[2]/div[${count}]/div
        ${Title}=    Get Text    xpath://*[@id="Article_Detail"]/div/div/div[3]/div[1]/div[1]
        Append To List    ${thairatTitle}    ${Title}
        ${Topic}=    Get Text    xpath://*[@id="Article_Detail"]/div/div/div[2]/div[2]/ul/li[1]
        Append To List    ${thairatTopic}    ${Topic}
        ${Time}=    Get Text    xpath://*[@id="Article_Detail"]/div/div/div[2]/div[1]
        Append To List    ${thairatTime}    ${Time}
        ${Content}=    Get Text    xpath://*[@id="Article_Detail"]/div/div/div[3]/div[1]/div[3]/div[1]
        Append To List    ${thairatContent}    ${Content}
        Sleep    3s
        Execute Javascript    window.scrollTo(0,document.body.scrollHeight)
        ${contains}=    Does Page Contain Element
        ...    xpath:/html/body/div[2]/main/div/div[4]/div[1]/div[4]/div/div/div[2]/div/div
        IF    ${contains}
            ${Tag}=    Get Text    xpath:/html/body/div[2]/main/div/div[4]/div[1]/div[4]/div/div/div[2]/div/div
            Append To List    ${thairatTag}    ${Tag}
        ELSE
            Run Keyword And Ignore Error    Wait Until Element Is Visible    error
            Run Keyword And Ignore Error    RPA.Browser.Selenium.Get Text    error
        END
        Go Back
    END
    Go To    https://www.thairath.co.th/news/foreign
    FOR    ${count}    IN RANGE    1    13
        ${attribute}=    Get Element Attribute
        ...    xpath:.//*[@id="__next"]/main/div/aside/div[1]/div/div[${count}]/div/a
        ...    href
        Append To List    ${thairatAttribute}    ${attribute}
        ${image}=    Get Element Attribute
        ...    xpath:.//*[@id="__next"]/main/div/aside/div[1]/div/div[${count}]/div/a/img
        ...    src
        Append To List    ${thairatImage}    ${image}
        Click Element    xpath://*[@id="__next"]/main/div/aside/div[1]/div/div[${count}]
        ${Title}=    Get Text    xpath://*[@id="Article_Detail"]/div/div/div[3]/div[1]/div[1]
        Append To List    ${thairatTitle}    ${Title}
        ${Topic}=    Get Text    xpath://*[@id="Article_Detail"]/div/div/div[2]/div[2]/ul/li[2]
        Append To List    ${thairatTopic}    ${Topic}
        ${Time}=    Get Text    xpath://*[@id="Article_Detail"]/div/div/div[2]/div[1]
        Append To List    ${thairatTime}    ${Time}
        ${Content}=    Get Text    xpath://*[@id="Article_Detail"]/div/div/div[3]/div[1]/div[3]/div[1]
        Append To List    ${thairatContent}    ${Content}
        Sleep    3s
        Execute Javascript    window.scrollTo(0,document.body.scrollHeight)
        ${contains}=    Does Page Contain Element
        ...    xpath:/html/body/div[2]/main/div/div[4]/div[1]/div[4]/div/div/div[2]/div/div
        IF    ${contains}
            ${Tag}=    Get Text    xpath:/html/body/div[2]/main/div/div[4]/div[1]/div[4]/div/div/div[2]/div/div
            Append To List    ${thairatTag}    ${Tag}
        ELSE
            Run Keyword And Ignore Error    Wait Until Element Is Visible    error
            Run Keyword And Ignore Error    RPA.Browser.Selenium.Get Text    error
        END
        Go Back
        Sleep    3s
        Click Element    alias:ดูเพิ่ม
    END
    Go To    https://www.thairath.co.th/news/crime
    FOR    ${count}    IN RANGE    1    13
        ${attribute}=    Get Element Attribute
        ...    xpath:.//*[@id="__next"]/main/div/aside/div[1]/div/div[${count}]/div/a
        ...    href
        Append To List    ${thairatAttribute}    ${attribute}
        ${image}=    Get Element Attribute
        ...    xpath:.//*[@id="__next"]/main/div/aside/div[1]/div/div[${count}]/div/a/img
        ...    src
        Append To List    ${thairatImage}    ${image}
        Click Element    xpath://*[@id="__next"]/main/div/aside/div[1]/div/div[${count}]
        ${Title}=    Get Text    xpath://*[@id="Article_Detail"]/div/div/div[3]/div[1]/div[1]
        Append To List    ${thairatTitle}    ${Title}
        ${Topic}=    Get Text    xpath://*[@id="Article_Detail"]/div/div/div[2]/div[2]/ul/li[2]
        Append To List    ${thairatTopic}    ${Topic}
        ${Time}=    Get Text    xpath://*[@id="Article_Detail"]/div/div/div[2]/div[1]
        Append To List    ${thairatTime}    ${Time}
        ${Content}=    Get Text    xpath://*[@id="Article_Detail"]/div/div/div[3]/div[1]/div[3]/div[1]
        Append To List    ${thairatContent}    ${Content}
        Sleep    3s
        Execute Javascript    window.scrollTo(0,document.body.scrollHeight)
        ${contains}=    Does Page Contain Element
        ...    xpath:/html/body/div[2]/main/div/div[4]/div[1]/div[4]/div/div/div[2]/div/div
        IF    ${contains}
            ${Tag}=    Get Text    xpath:/html/body/div[2]/main/div/div[4]/div[1]/div[4]/div/div/div[2]/div/div
            Append To List    ${thairatTag}    ${Tag}
        ELSE
            Run Keyword And Ignore Error    Wait Until Element Is Visible    error
            Run Keyword And Ignore Error    RPA.Browser.Selenium.Get Text    error
        END
        Go Back
        Sleep    3s
        Click Element    alias:ดูเพิ่ม
    END
    Go To    https://www.thairath.co.th/news/auto
    FOR    ${count}    IN RANGE    1    13
        ${attribute}=    Get Element Attribute
        ...    xpath:.//*[@id="__next"]/main/div/aside/div[1]/div/div[${count}]/div/a
        ...    href
        Append To List    ${thairatAttribute}    ${attribute}
        ${image}=    Get Element Attribute
        ...    xpath:.//*[@id="__next"]/main/div/aside/div[1]/div/div[${count}]/div/a/img
        ...    src
        Append To List    ${thairatImage}    ${image}
        Click Element    xpath://*[@id="__next"]/main/div/aside/div[1]/div/div[${count}]
        ${Title}=    Get Text    xpath://*[@id="Article_Detail"]/div/div/div[3]/div[1]/div[1]
        Append To List    ${thairatTitle}    ${Title}
        ${Topic}=    Get Text    xpath://*[@id="Article_Detail"]/div/div/div[2]/div[2]/ul/li[2]
        Append To List    ${thairatTopic}    ${Topic}
        ${Time}=    Get Text    xpath://*[@id="Article_Detail"]/div/div/div[2]/div[1]
        Append To List    ${thairatTime}    ${Time}
        ${Content}=    Get Text    xpath://*[@id="Article_Detail"]/div/div/div[3]/div[1]/div[3]/div[1]
        Append To List    ${thairatContent}    ${Content}
        Sleep    3s
        Execute Javascript    window.scrollTo(0,document.body.scrollHeight)
        ${contains}=    Does Page Contain Element
        ...    xpath:/html/body/div[2]/main/div/div[4]/div[1]/div[4]/div/div/div[2]/div/div
        IF    ${contains}
            ${Tag}=    Get Text    xpath:/html/body/div[2]/main/div/div[4]/div[1]/div[4]/div/div/div[2]/div/div
            Append To List    ${thairatTag}    ${Tag}
        ELSE
            Run Keyword And Ignore Error    Wait Until Element Is Visible    error
            Run Keyword And Ignore Error    RPA.Browser.Selenium.Get Text    error
        END
        Go Back
        Sleep    3s
        Click Element    alias:ดูเพิ่ม
    END
    Go To    https://www.thairath.co.th/news/tech
    FOR    ${count}    IN RANGE    1    13
        ${attribute}=    Get Element Attribute
        ...    xpath:.//*[@id="__next"]/main/div/aside/div[1]/div/div[${count}]/div/a
        ...    href
        Append To List    ${thairatAttribute}    ${attribute}
        ${image}=    Get Element Attribute
        ...    xpath:.//*[@id="__next"]/main/div/aside/div[1]/div/div[${count}]/div/a/img
        ...    src
        Append To List    ${thairatImage}    ${image}
        Click Element    xpath://*[@id="__next"]/main/div/aside/div[1]/div/div[${count}]
        ${Title}=    Get Text    xpath://*[@id="Article_Detail"]/div/div/div[3]/div[1]/div[1]
        Append To List    ${thairatTitle}    ${Title}
        ${Topic}=    Get Text    xpath://*[@id="Article_Detail"]/div/div/div[2]/div[2]/ul/li[2]
        Append To List    ${thairatTopic}    ${Topic}
        ${Time}=    Get Text    xpath://*[@id="Article_Detail"]/div/div/div[2]/div[1]
        Append To List    ${thairatTime}    ${Time}
        ${Content}=    Get Text    xpath://*[@id="Article_Detail"]/div/div/div[3]/div[1]/div[3]/div[1]
        Append To List    ${thairatContent}    ${Content}
        Sleep    3s
        Execute Javascript    window.scrollTo(0,document.body.scrollHeight)
        ${contains}=    Does Page Contain Element
        ...    xpath:/html/body/div[2]/main/div/div[4]/div[1]/div[4]/div/div/div[2]/div/div
        IF    ${contains}
            ${Tag}=    Get Text    xpath:/html/body/div[2]/main/div/div[4]/div[1]/div[4]/div/div/div[2]/div/div
            Append To List    ${thairatTag}    ${Tag}
        ELSE
            Run Keyword And Ignore Error    Wait Until Element Is Visible    error
            Run Keyword And Ignore Error    RPA.Browser.Selenium.Get Text    error
        END
        Go Back
        Sleep    3s
        Click Element    alias:ดูเพิ่ม
    END
    ${List_data}=    Create Dictionary
    ...    Title=${thairatTitle}
    ...    Topic=${thairatTopic}
    ...    Date=${thairatTime}
    ...    Content=${thairatContent}
    ...    Link=${thairatAttribute}
    ...    Image=${thairatImage}
    ...    Tag=${thairatTag}
    ${table}=    Create Table    ${List_data}    ${TRUE}
    Write table to CSV    ${table}    AllThairat.csv    encoding=UTF-8-sig
