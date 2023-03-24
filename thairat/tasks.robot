*** Settings ***
Library     RPA.Browser.Selenium
Library     RPA.Tables
Library     DataScraper
Library     Collections
Library     RPA.Windows
Library     String


*** Tasks ***
extract
    Open Available Browser    https://www.thairath.co.th/home    maximized=${TRUE}    alias=FirstBrowswr
    Sleep    2s
    Click Element If Visible    alias:let go
    ${count}=    Get Element Count
    ...    xpath://*[@id="__next"]/main/div/div[5]/div/div[2]/div/div/div[2]/div[1]/div[7]/div/div[1]/div
    ${list_count}=    Create List    ${count}
    Log    ${list_count}
    ${Data}=    Get WebElements
    ...    xpath://*[@id="__next"]/main/div/div[5]/div/div[2]/div/div/div[2]/div[1]/div[7]/div/div[1]/div
    ${thairatData}=    Create List
    ${thairatTime}=    Create List
    FOR    ${thairat}    IN RANGE    1    @{list_count}
        ${title}=    RPA.Browser.Selenium.Get Text
        ...    xpath://*[@id="__next"]/main/div/div[5]/div/div[2]/div/div/div[2]/div[1]/div[7]/div/div[1]/div[${thairat}]/div[2]
        Log    ${title}
        Append To List    ${thairatData}    ${title}
        ${time}=    RPA.Browser.Selenium.Get Text
        ...    xpath://*[@id="__next"]/main/div/div[5]/div/div[2]/div/div/div[2]/div[1]/div[7]/div/div[1]/div[${thairat}]/div[2]/div
        Log    ${time}
        Append To List    ${thairatTime}    ${time}
    END
    Log    ${Data}
    ${Diction}=    Create Dictionary    Title=${thairatData}    Time=${thairatTime}
    ${table}=    Create Table    ${Diction}    ${TRUE}
    Write table to CSV    ${table}    extrac.csv

thairat
    Open Available Browser    https://www.thairath.co.th/home    maximized=${TRUE}
    Click Element If Visible    alias:Go
    Click Element    alias:ActiveMenu07
    ${thairatTitle}=    Create List
    ${thairatTopic}=    Create List
    ${thairatDate}=    Create List
    ${thairatContent}=    Create List
    FOR    ${count}    IN RANGE    1    6
        ${Title}=    RPA.Browser.Selenium.Get Text
        ...    xpath://*[@id="__next"]/main/div/div[5]/div/div[2]/div/div/div[2]/div[1]/div[7]/div/div[1]/div[${count}]/div[2]/h2
        Append To List    ${thairatTitle}    ${Title}
        ${Topic}=    RPA.Browser.Selenium.Get Text
        ...    xpath://*[@id="__next"]/main/div/div[5]/div/div[2]/div/div/div[2]/div[1]/div[7]/div/div[1]/div[${count}]/div[2]/div/a
        Append To List    ${thairatTopic}    ${Topic}
        ${Date}=    RPA.Browser.Selenium.Get Text
        ...    xpath://*[@id="__next"]/main/div/div[5]/div/div[2]/div/div/div[2]/div[1]/div[7]/div/div[1]/div[${count}]/div[2]/div/span
        Append To List    ${thairatDate}    ${Date}
        Sleep    2s
        Click Element
        ...    xpath://*[@id="__next"]/main/div/div[5]/div/div[2]/div/div/div[2]/div[1]/div[7]/div/div[1]/div[${count}]/div[2]/h2
        ${Content}=    RPA.Browser.Selenium.Get Text
        ...    xpath://*[@id="Article_Detail"]/div[1]/div/div[3]/div[1]/div[3]/div[1]
        Append To List    ${thairatContent}    ${Content}
        Go Back
        Sleep    2s
        Click Element    alias:ActiveMenu07
    END
    ${List_data}=    Create Dictionary
    ...    Title=${thairatTitle}
    ...    Topic=${thairatTopic}
    ...    Date=${thairatDate}
    ...    Content=${thairatContent}
    ${table}=    Create Table    ${List_data}    ${TRUE}
    Write table to CSV    ${table}    Thairat.csv

thairat2
    Open Available Browser    https://www.thairath.co.th/home    maximized=${TRUE}
    Click Element If Visible    alias:Go
    Click Element    xpath://*[@id="activeMenu07"]/a
    ${thairat2Title}=    Create List
    ${thairat2Topic}=    Create List
    ${thairat2Time}=    Create List
    ${thairat2Content}=    Create List
    ${thairat2Attribute}=    Create List
    FOR    ${count}    IN RANGE    1    6
        Click Element
        ...    xpath://*[@id="__next"]/main/div/div[5]/div/div[2]/div/div/div[2]/div[1]/div[7]/div/div[1]/div[${count}]/div[2]/h2
        ${attribute}=    Get Element Attribute
        ...    xpath://*[@id="__next"]/main/div/div[5]/div/div[2]/div/div/div[2]/div[1]/div[7]/div/div[1]/div[${count}]/div[2]/h2/a
        ...    href
        Append To List    ${thairat2Attribute}    ${attribute}
        ${Title}=    RPA.Browser.Selenium.Get Text    xpath://*[@id="Article_Detail"]/div/div/div[3]/div[1]/div[1]
        Append To List    ${thairat2Title}    ${Title}
        ${Topic}=    RPA.Browser.Selenium.Get Text    xpath://*[@id="Article_Detail"]/div/div/div[2]/div[2]/ul/li[2]
        Append To List    ${thairat2Topic}    ${Topic}
        ${Time}=    RPA.Browser.Selenium.Get Text    xpath://*[@id="Article_Detail"]/div/div/div[2]/div[1]
        Append To List    ${thairat2Time}    ${Time}
        ${Content}=    RPA.Browser.Selenium.Get Text
        ...    xpath://*[@id="Article_Detail"]/div[1]/div/div[3]/div[1]/div[3]/div[1]
        Append To List    ${thairat2Content}    ${Content}
        Go Back
        Sleep    3s
        Click Element    xpath://*[@id="activeMenu07"]/a
        Sleep    3s
    END
    ${List2_data}=    Create Dictionary
    ...    Title=${thairat2Title}
    ...    Topic=${thairat2Topic}
    ...    Date=${thairat2Time}
    ...    Content=${thairat2Content}
    ...    Link=${thairat2Attribute}
    ${table}=    Create Table    ${List2_data}    ${TRUE}
    Write table to CSV    ${table}    Thairat2.csv

thairat3
    Open Available Browser    https://www.thairath.co.th/home    maximized=${TRUE}
    Click Element If Visible    alias:Go
    Click Element    xpath://*[@id="TR_Navbar_Navmain_news"]
    Go To    https://www.thairath.co.th/news/foreign
    ${thairat3Title}=    Create List
    ${thairat3Topic}=    Create List
    ${thairat3Time}=    Create List
    ${thairat3Content}=    Create List
    ${thairat3Attribute}=    Create List
    FOR    ${count}    IN RANGE    1    21
        Click Element    xpath:.//*[@id="__next"]/main/div/aside/div[1]/div/div[${count}]
        ${Title}=    RPA.Browser.Selenium.Get Text    xpath://*[@id="Article_Detail"]/div/div/div[3]/div[1]/div[1]
        Append To List    ${thairat3Title}    ${Title}
        ${Topic}=    RPA.Browser.Selenium.Get Text    xpath://*[@id="Article_Detail"]/div/div/div[2]/div[2]/ul/li[2]
        Append To List    ${thairat3Topic}    ${Topic}
        ${Time}=    RPA.Browser.Selenium.Get Text    xpath://*[@id="Article_Detail"]/div/div/div[2]/div[1]
        Append To List    ${thairat3Time}    ${Time}
        ${Content}=    RPA.Browser.Selenium.Get Text
        ...    xpath://*[@id="Article_Detail"]/div/div/div[3]/div[1]/div[3]/div[1]
        Append To List    ${thairat3Content}    ${Content}
        Go Back
        Sleep    3s
        Click Element    alias:ดูเพิ่ม
    END
    FOR    ${test}    IN RANGE    1    21
        ${attribute}=    Get Element Attribute
        ...    xpath:.//*[@id="__next"]/main/div/aside/div[1]/div/div[${test}]/div/a
        ...    href
        Append To List    ${thairat3Attribute}    ${attribute}
    END
    ${List3_data}=    Create Dictionary
    ...    Title=${thairat3Title}
    ...    Topic=${thairat3Topic}
    ...    Date=${thairat3Time}
    ...    Content=${thairat3Content}
    ...    Link=${thairat3Attribute}
    ${table}=    Create Table    ${List3_data}    ${TRUE}
    Write table to CSV    ${table}    Thairat3.csv

thairat4
    Open Available Browser    https://www.thairath.co.th/home    maximized=${TRUE}
    Click Element    xpath://*[@id="TR_Navbar_Navmain_news"]
    Go To    https://www.thairath.co.th/news/foreign
    ${thairat4Title}=    Create List
    ${thairat4Topic}=    Create List
    ${thairat4Time}=    Create List
    ${thairat4Content}=    Create List
    ${thairat4Attribute}=    Create List
    ${thairat4Image}=    Create List
    ${thairat4Tag}=    Create List
    FOR    ${count}    IN RANGE    1    11
        Sleep    3s
        Click Element    xpath:.//*[@id="__next"]/main/div/aside/div[1]/div/div[${count}]
        ${Title}=    RPA.Browser.Selenium.Get Text    xpath://*[@id="Article_Detail"]/div/div/div[3]/div[1]/div[1]
        Append To List    ${thairat4Title}    ${Title}
        ${Topic}=    RPA.Browser.Selenium.Get Text    xpath://*[@id="Article_Detail"]/div/div/div[2]/div[2]/ul/li[1]
        Append To List    ${thairat4Topic}    ${Topic}
        ${Time}=    RPA.Browser.Selenium.Get Text    xpath://*[@id="Article_Detail"]/div/div/div[2]/div[1]
        Append To List    ${thairat4Time}    ${Time}
        ${Content}=    RPA.Browser.Selenium.Get Text
        ...    xpath://*[@id="Article_Detail"]/div/div/div[3]/div[1]/div[3]/div[1]
        Append To List    ${thairat4Content}    ${Content}
        Sleep    5s
        ${return_value}=    Execute Javascript    window.scrollTo(0,document.body.scrollHeight)
        Wait Until Element Is Visible
        ...    xpath:/html/body/div[2]/main/div/div[4]/div[1]/div[4]/div/div/div[2]/div/div
        ...    10
        ${Tag}=    RPA.Browser.Selenium.Get Text
        ...    xpath:/html/body/div[2]/main/div/div[4]/div[1]/div[4]/div/div/div[2]/div/div
        Run Keyword And Ignore Error    Wait Until Element Is Visible    error
        Append To List    ${thairat4Tag}    ${Tag}
        Go Back
    END
    FOR    ${test}    IN RANGE    1    11
        ${attribute}=    Get Element Attribute
        ...    xpath:.//*[@id="__next"]/main/div/aside/div[1]/div/div[${test}]/div/a
        ...    href
        Append To List    ${thairat4Attribute}    ${attribute}
        ${image}=    Get Element Attribute
        ...    xpath:.//*[@id="__next"]/main/div/aside/div[1]/div/div[${test}]/div/a/img
        ...    src
        Append To List    ${thairat4Image}    ${image}
    END
    ${List4_data}=    Create Dictionary
    ...    Title=${thairat4Title}
    ...    Topic=${thairat4Topic}
    ...    Date=${thairat4Time}
    ...    Content=${thairat4Content}
    ...    Link=${thairat4Attribute}
    ...    Tag=${thairat4Tag}
    ...    Image=${thairat4Image}
    ${table}=    Create Table    ${List4_data}    ${TRUE}
    Write table to CSV    ${table}    Thairat4.csv
