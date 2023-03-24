*** Settings ***
Library     RPA.Browser.Selenium
Library     RPA.FileSystem
Library     RPA.Tables
Library     String
Library     DateTime
Library     RPA.Robocorp.WorkItems
Library     Collections
Library     RPA.Excel.Files


*** Tasks ***
test
    Open Available Browser    https://www.geeksforgeeks.org/c-programming-language/    maximized=${TRUE}
    ${title}=    Get Text    alias:COutputMultipleChoiceQuestions
    ${text}=    Get Text    alias:Paragraph
    ${title1}=    Get Text    alias:CompleteInterviewPreparation
    ${text1}=    Get Text    alias:Paragraph1
    ${list_name}=    Create List    ${title}    ${title1}
    ${list_data}=    Create List    ${text}    ${text1}
    ${List}=    Create Dictionary    TITLE=${list_name}    DATA=${list_data}
    ${table}=    Create Table    ${List}
    Write table to CSV    ${table}    test.csv

test1
    Open Available Browser    https://testautomationpractice.blogspot.com/    maximized=${TRUE}
    ${rows}=    Get Element Count    xpath://table[@name='BookTable']/tbody/tr
    ${columns}=    Get Element Count    xpath://table[@name='BookTable']/tbody/tr[1]/th
    Log    ${rows}
    Log    ${columns}
    ${title}=    Get Text    alias:TableRow1
    ${data}=    Get Text    alias:TableRow
    ${data2}=    Get Text    alias:TableRow2
    ${data3}=    Get Text    alias:TableRow3
    ${data4}=    Get Text    alias:TableRow4
    Log    ${title}
    Log    ${data}
    ${name_title}=    Create List    ${title}
    ${name_data}=    Create List    ${data}    ${data2}    ${data3}    ${data4}
    ${table}=    Create Table    ${name_data}    columns=${name_title}
    Write table to CSV    ${table}    test1.csv

image
    Open Available Browser    https://www.cafe-amazon.com/index.aspx
    Capture Element Screenshot    alias:LogoAmazonCafe
    Capture Page Screenshot    cup.png

test2
    Open Available Browser    https://www.thairath.co.th/home
    Click Element If Visible    alias:go
    ${text}=    Get Text    alias:Div1
    ${data}=    Create List    ${text}
    FOR    ${data_text}    IN    @{data}
        Append To List    ${data}
    END
    Log    ${data_text}

test3
    Open Available Browser    https://www.thairath.co.th/home
    Click Element If Visible    alias:go
    FOR    ${click}    IN    ${TRUE}
        Click Element    alias:clicks
        ${title}=    Get Text    alias:title
        ${list}=    Create List    ${title}
        Append To List    ${list}
        Log    ${click}
    END
    ${list1}=    Create List    ${click}

test4
    Open Available Browser
    ...    https://www.abc.net.au/news/2023-01-19/someone-removes-memorial-plaque-from-bench-at-largs-bay/101870780
    ${items}=    Create List
    ${count}=    Get Element Count    xpath://*[@id="body"]/div/div[1]/div/p
    Log    ${count}
    Sleep    3s
    Execute Javascript    window.scrollTo(0,document.body.scrollHeight)
    ${str}=    Set Variable
    FOR    ${counttest}    IN RANGE    1    ${count}+1
        ${test}=    Get Text    xpath://*[@id="body"]/div/div[1]/div/p[${counttest}]
        ${str}=    Catenate    ${str}    ${test}
    END
    Append To List    ${items}    ${str}
    Log    ${str}
    ${List_data}=    Create Dictionary    Test=${items}
    ${table}=    Create Table    ${List_data}    ${TRUE}
    Write table to CSV    ${table}    test.csv    encoding=UTF-8-sig
