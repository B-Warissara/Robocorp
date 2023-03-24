*** Settings ***
Library     RPA.Browser.Selenium
Library     Collections
Library     RPA.Tables
Library     String


*** Tasks ***
Test
    Open Available Browser
    ...    https://www.oae.go.th/view/1/%E0%B8%A3%E0%B8%B2%E0%B8%84%E0%B8%B2%E0%B8%AA%E0%B8%B4%E0%B8%99%E0%B8%84%E0%B9%89%E0%B8%B2%E0%B8%A3%E0%B8%B2%E0%B8%A2%E0%B8%A7%E0%B8%B1%E0%B8%99/%E0%B8%A1%E0%B8%B5.%E0%B8%84.66/40984/TH-TH
    ${day}=    Create List
    ${month}=    Create List
    ${year}=    Create List
    ${type}=    Create List
    ${price}=    Create List
    ${getcount}=    Get Element Count    xpath://*[@id="table_data"]/tbody/tr
    Log    ${getcount}
    FOR    ${count}    IN RANGE    7    ${getcount}+1
        ${value}=    Set Variable    ${EMPTY}
        ${Dayone}=    Get Text    xpath://*[@id="table_data"]/tbody/tr[${count}]/td[2]
        ${result3}=    Replace String    ${Dayone}    ${value}    0    1
        Append To List    ${day}    ${result3}
        ${Priceone}=    Get Text    xpath://*[@id="table_data"]/tbody/tr[${count}]/td[3]
        ${result1}=    Replace String    ${Priceone}    ${value}    0    1
        ${delete}=    Remove String    ${result1}    -
        Append To List    ${price}    ${delete}
        ${Typeone}=    Get Text    xpath://*[@id="table_data"]/tbody/tr[1]/th[2]
        Append To List    ${type}    ${Typeone}
        ${Yearone}=    Get Text    xpath://*[@id="table_data"]/tbody/tr[1]/th[1]
        ${result2}=    Replace String    ${Yearone}    ปี    ${EMPTY}
        Append To List    ${year}    ${result2}
    END
    FOR    ${count1}    IN RANGE    31
        ${Monthone}=    Get Text    xpath://*[@id="table_data"]/tbody/tr[7]/td[1]
        Append To List    ${month}    ${Monthone}
    END
    ${List_data}=    Create Dictionary
    ...    Day=${day}
    ...    Month=${month}
    ...    Year=${year}
    ...    Price=${price}
    ...    Type=${type}
    ${table}=    Create Table    ${List_data}
    Write table to CSV    ${table}    Test.csv

Weather
    Open Available Browser    https://www.tmd.go.th/
    ${dateweather}=    Create List
    ${nowweather}=    Create List
    ${temperature}=    Create List
    ${weather}=    Create List
    ${getdateweather}=    Get Text    xpath://*[@id="weather7days"]/div/div/div/div[1]/div/div[1]/div[2]
    ${result1}=    Replace String    ${getdateweather}    มี.ค.    ${EMPTY}
    Append To List    ${dateweather}    ${result1}
    ${getnowweather}=    Get Text    xpath://*[@id="widget-forcast-area"]/div/div[2]/div[1]/div/h3
    Append To List    ${nowweather}    ${getnowweather}
    ${gettemperature}=    Get Text    xpath://*[@id="temperature"]
    ${result}=    Remove String    ${gettemperature}    °
    Append To List    ${temperature}    ${result}
    ${getweather}=    Get Text    xpath://*[@id="phenomenonText"]
    Append To List    ${weather}    ${getweather}
    ${getcount}=    Get Element Count    xpath://*[@id="weather7days"]/div/div/div/div
    FOR    ${count}    IN RANGE    2    ${getcount}+1
        ${getdate7weather}=    Get Text    xpath://*[@id="weather7days"]/div/div/div/div[${count}]/div/div[1]/div[2]
        ${result2}=    Replace String    ${getdate7weather}    มี.ค.    ${EMPTY}
        Append To List    ${dateweather}    ${result2}
        ${getnow7weather}=    Get Text    xpath://*[@id="weather7days"]/div/div/div/div[${count}]/div/div[1]/div[1]
        Append To List    ${nowweather}    ${getnow7weather}
        ${get7temperature}=    Get Text    xpath://*[@id="weather7days"]/div/div/div/div[${count}]/div/div[3]/div[3]
        ${result3}=    Remove String    ${get7temperature}    °
        Append To List    ${temperature}    ${result3}
        ${getweather7}=    Get Text    xpath://*[@id="weather7days"]/div/div/div/div[${count}]/div/div[4]
        Append To List    ${weather}    ${getweather7}
        ${getcount}=    Get Element Count    xpath://*[@id="weather7days"]/div/div/div/div
    END
    ${List_data}=    Create Dictionary
    ...    Date=${dateweather}
    ...    Nowweather=${nowweather}
    ...    Temperature=${temperature}
    ...    Weather=${weather}
    ${table}=    Create Table    ${List_data}
    Write table to CSV    ${table}    Weather.csv    encoding=UTF-8-sig
