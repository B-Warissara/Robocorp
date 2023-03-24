*** Settings ***
Library     RPA.Browser.Selenium
Library     Collections
Library     RPA.Tables
Library     String


*** Tasks ***
Weather
    Open Available Browser    https://www.tmd.go.th/weather/provinces    maximized=${TRUE}
    Click Element If Visible    alias:Ccbbuttonconsentgive
    ${sector}=    Create List
    ${province}=    Create List
    ${temperature}=    Create List
    ${dew}=    Create List
    ${moisture}=    Create List
    ${wind}=    Create List
    ${cloud}=    Create List
    ${visibility}=    Create List
    ${barometric}=    Create List
    ${rain}=    Create List
    ${getcount}=    Get Element Count    xpath://*[@id="web-content"]/div/div[2]/div/div/div[1]/p
    Log    ${getcount}
    FOR    ${countsector}    IN RANGE    1    ${getcount}+1
        ${getsector}=    Get Text    xpath://*[@id="web-content"]/div/div[2]/div/div/div[1]/h3
        Append To List    ${sector}    ${getsector}
    END
    FOR    ${count}    IN RANGE    1    ${getcount}+1
        ${getprovince}=    Get Text    xpath://*[@id="web-content"]/div/div[2]/div/div/div[1]/p[${count}]/a
        Append To List    ${province}    ${getprovince}
        Scroll Element Into View    xpath://*[@id="web-content"]/div/div[2]/div/div/div[1]/p[${count}]/a
        Click Element    xpath://*[@id="web-content"]/div/div[2]/div/div/div[1]/p[${count}]/a
        Sleep    5s
        ${gettemperature}=    Get Text    xpath://*[@id="lblDryBlubTemperature"]
        Append To List    ${temperature}    ${gettemperature}
        ${getdew}=    Get Text    xpath://*[@id="lblDewpoint"]
        Append To List    ${dew}    ${getdew}
        ${getmoisture}=    Get Text    xpath://*[@id="lblRelativeHumidity"]
        Append To List    ${moisture}    ${getmoisture}
        ${getwind}=    Get Text    xpath://*[@id="lblWindDirection"]
        Append To List    ${wind}    ${getwind}
        ${getcloud}=    Get Text    xpath://*[@id="lblTotalCloudAmount"]
        Append To List    ${cloud}    ${getcloud}
        ${getvisibilty}=    Get Text    xpath://*[@id="lblLandVisibility"]
        Append To List    ${visibility}    ${getvisibilty}
        ${getbarometric}=    Get Text    xpath://*[@id="lblMSLPressure"]
        Append To List    ${barometric}    ${getbarometric}
        ${getrain}=    Get Text    xpath://*[@id="lblRainfall"]
        Append To List    ${rain}    ${getrain}
        Go Back
        Sleep    5s
    END
    ${getcount}=    Get Element Count    xpath://*[@id="web-content"]/div/div[2]/div/div/div[2]/p
    Log    ${getcount}
    FOR    ${countsector}    IN RANGE    1    ${getcount}+1
        ${getsector}=    Get Text    xpath://*[@id="web-content"]/div/div[2]/div/div/div[2]/h3
        Append To List    ${sector}    ${getsector}
    END
    FOR    ${count}    IN RANGE    1    ${getcount}+1
        ${getprovince}=    Get Text    xpath://*[@id="web-content"]/div/div[2]/div/div/div[2]/p[${count}]/a
        Append To List    ${province}    ${getprovince}
        Click Element    xpath://*[@id="web-content"]/div/div[2]/div/div/div[2]/p[${count}]/a
        Sleep    5s
        ${gettemperature}=    Get Text    xpath://*[@id="lblDryBlubTemperature"]
        Append To List    ${temperature}    ${gettemperature}
        ${getdew}=    Get Text    xpath://*[@id="lblDewpoint"]
        Append To List    ${dew}    ${getdew}
        ${getmoisture}=    Get Text    xpath://*[@id="lblRelativeHumidity"]
        Append To List    ${moisture}    ${getmoisture}
        ${getwind}=    Get Text    xpath://*[@id="lblWindDirection"]
        Append To List    ${wind}    ${getwind}
        ${getcloud}=    Get Text    xpath://*[@id="lblTotalCloudAmount"]
        Append To List    ${cloud}    ${getcloud}
        ${getvisibilty}=    Get Text    xpath://*[@id="lblLandVisibility"]
        Append To List    ${visibility}    ${getvisibilty}
        ${getbarometric}=    Get Text    xpath://*[@id="lblMSLPressure"]
        Append To List    ${barometric}    ${getbarometric}
        ${getrain}=    Get Text    xpath://*[@id="lblRainfall"]
        Append To List    ${rain}    ${getrain}
        Go Back
        Sleep    5s
    END
    ${getcount}=    Get Element Count    xpath://*[@id="web-content"]/div/div[2]/div/div/div[3]/p
    Log    ${getcount}
    FOR    ${countsector}    IN RANGE    1    ${getcount}+1
        ${getsector}=    Get Text    xpath://*[@id="web-content"]/div/div[2]/div/div/div[3]/h3
        Append To List    ${sector}    ${getsector}
    END
    FOR    ${count}    IN RANGE    1    ${getcount}+1
        ${getprovince}=    Get Text    xpath://*[@id="web-content"]/div/div[2]/div/div/div[3]/p[${count}]/a
        Append To List    ${province}    ${getprovince}
        Scroll Element Into View    xpath://*[@id="web-content"]/div/div[2]/div/div/div[3]/p[${count}]/a
        Execute Javascript    window.scrollTo(0,document.body.scrollHeight)
        Click Element    xpath://*[@id="web-content"]/div/div[2]/div/div/div[3]/p[${count}]/a
        Sleep    5s
        ${gettemperature}=    Get Text    xpath://*[@id="lblDryBlubTemperature"]
        Append To List    ${temperature}    ${gettemperature}
        ${getdew}=    Get Text    xpath://*[@id="lblDewpoint"]
        Append To List    ${dew}    ${getdew}
        ${getmoisture}=    Get Text    xpath://*[@id="lblRelativeHumidity"]
        Append To List    ${moisture}    ${getmoisture}
        ${getwind}=    Get Text    xpath://*[@id="lblWindDirection"]
        Append To List    ${wind}    ${getwind}
        ${getcloud}=    Get Text    xpath://*[@id="lblTotalCloudAmount"]
        Append To List    ${cloud}    ${getcloud}
        ${getvisibilty}=    Get Text    xpath://*[@id="lblLandVisibility"]
        Append To List    ${visibility}    ${getvisibilty}
        ${getbarometric}=    Get Text    xpath://*[@id="lblMSLPressure"]
        Append To List    ${barometric}    ${getbarometric}
        ${getrain}=    Get Text    xpath://*[@id="lblRainfall"]
        Append To List    ${rain}    ${getrain}
        Go Back
        Sleep    5s
    END
    Scroll Element Into View    xpath://*[@id="web-content"]/div/div[2]/div/div/div[4]/h3
    ${getcount}=    Get Element Count    xpath://*[@id="web-content"]/div/div[2]/div/div/div[4]/p
    Log    ${getcount}
    FOR    ${countsector}    IN RANGE    1    ${getcount}+1
        ${getsector}=    Get Text    xpath://*[@id="web-content"]/div/div[2]/div/div/div[4]/h3
        Append To List    ${sector}    ${getsector}
    END
    Execute Javascript    window.scrollTo(0,500)
    FOR    ${count}    IN RANGE    1    ${getcount}+1
        ${getprovince}=    Get Text    xpath://*[@id="web-content"]/div/div[2]/div/div/div[4]/p[${count}]/a
        Append To List    ${province}    ${getprovince}
        Scroll Element Into View    xpath://*[@id="web-content"]/div/div[2]/div/div/div[4]/p[${count}]/a
        Execute Javascript    window.scrollTo(0,document.body.scrollHeight)
        Click Element    xpath://*[@id="web-content"]/div/div[2]/div/div/div[4]/p[${count}]/a
        Sleep    5s
        ${contains}=    Does Page Contain Element    xpath://*[@id="currentWeather"]/div
        IF    $contains
            ${gettemperature}=    Get Text    xpath://*[@id="lblDryBlubTemperature"]
            Append To List    ${temperature}    ${gettemperature}
            ${getdew}=    Get Text    xpath://*[@id="lblDewpoint"]
            Append To List    ${dew}    ${getdew}
            ${getmoisture}=    Get Text    xpath://*[@id="lblRelativeHumidity"]
            Append To List    ${moisture}    ${getmoisture}
            ${getwind}=    Get Text    xpath://*[@id="lblWindDirection"]
            Append To List    ${wind}    ${getwind}
            ${getcloud}=    Get Text    xpath://*[@id="lblTotalCloudAmount"]
            Append To List    ${cloud}    ${getcloud}
            ${getvisibilty}=    Get Text    xpath://*[@id="lblLandVisibility"]
            Append To List    ${visibility}    ${getvisibilty}
            ${getbarometric}=    Get Text    xpath://*[@id="lblMSLPressure"]
            Append To List    ${barometric}    ${getbarometric}
            ${getrain}=    Get Text    xpath://*[@id="lblRainfall"]
            Append To List    ${rain}    ${getrain}
        ELSE
            ${gettemperature}=    Get Text    xpath://*[@id="currentWeather"]
            ${result1}=    Replace String    ${gettemperature}    ไม่มีข้อมูล    0
            Append To List    ${temperature}    ${result1}
            ${getdew}=    Get Text    xpath://*[@id="currentWeather"]
            ${result2}=    Replace String    ${gettemperature}    ไม่มีข้อมูล    0
            Append To List    ${dew}    ${result2}
            ${getmoisture}=    Get Text    xpath://*[@id="currentWeather"]
            ${result3}=    Replace String    ${gettemperature}    ไม่มีข้อมูล    0
            Append To List    ${moisture}    ${result3}
            ${getwind}=    Get Text    xpath://*[@id="currentWeather"]
            Append To List    ${wind}    ${getwind}
            ${getcloud}=    Get Text    xpath://*[@id="currentWeather"]
            Append To List    ${cloud}    ${getcloud}
            ${getvisibilty}=    Get Text    xpath://*[@id="currentWeather"]
            ${result4}=    Replace String    ${gettemperature}    ไม่มีข้อมูล    0
            Append To List    ${visibility}    ${result4}
            ${getbarometric}=    Get Text    xpath://*[@id="currentWeather"]
            ${result5}=    Replace String    ${gettemperature}    ไม่มีข้อมูล    0
            Append To List    ${barometric}    ${result5}
            ${getrain}=    Get Text    xpath://*[@id="currentWeather"]
            ${result6}=    Replace String    ${gettemperature}    ไม่มีข้อมูล    0
            Append To List    ${rain}    ${result6}
        END
        Go Back
        Sleep    5s
    END
    Scroll Element Into View    xpath://*[@id="web-content"]/div/div[2]/div/div/div[5]/h3
    ${getcount}=    Get Element Count    xpath://*[@id="web-content"]/div/div[2]/div/div/div[5]/p
    Log    ${getcount}
    FOR    ${countsector}    IN RANGE    2    11
        ${getsector}=    Get Text    xpath://*[@id="web-content"]/div/div[2]/div/div/div[5]/h3
        Append To List    ${sector}    ${getsector}
    END
    FOR    ${count}    IN RANGE    2    11
        ${getprovince}=    Get Text    xpath://*[@id="web-content"]/div/div[2]/div/div/div[5]/p[${count}]/a
        Append To List    ${province}    ${getprovince}
        Scroll Element Into View    xpath://*[@id="web-content"]/div/div[2]/div/div/div[5]/p[${count}]/a
        Click Element    xpath://*[@id="web-content"]/div/div[2]/div/div/div[5]/p[${count}]/a
        Sleep    5s
        ${gettemperature}=    Get Text    xpath://*[@id="lblDryBlubTemperature"]
        Append To List    ${temperature}    ${gettemperature}
        ${getdew}=    Get Text    xpath://*[@id="lblDewpoint"]
        Append To List    ${dew}    ${getdew}
        ${getmoisture}=    Get Text    xpath://*[@id="lblRelativeHumidity"]
        Append To List    ${moisture}    ${getmoisture}
        ${getwind}=    Get Text    xpath://*[@id="lblWindDirection"]
        ${result}=    Replace String    ${getwind}    -    ไม่มีข้อมูล
        Append To List    ${wind}    ${result}
        ${getcloud}=    Get Text    xpath://*[@id="lblTotalCloudAmount"]
        Append To List    ${cloud}    ${getcloud}
        ${getvisibilty}=    Get Text    xpath://*[@id="lblLandVisibility"]
        Append To List    ${visibility}    ${getvisibilty}
        ${getbarometric}=    Get Text    xpath://*[@id="lblMSLPressure"]
        Append To List    ${barometric}    ${getbarometric}
        ${getrain}=    Get Text    xpath://*[@id="lblRainfall"]
        Append To List    ${rain}    ${getrain}
        Go Back
        Sleep    5s
    END
    Scroll Element Into View    xpath://*[@id="web-content"]/div/div[2]/div/div/div[6]/h3
    ${getcount}=    Get Element Count    xpath://*[@id="web-content"]/div/div[2]/div/div/div[6]/p
    Log    ${getcount}
    FOR    ${countsector}    IN RANGE    1    ${getcount}+1
        ${getsector}=    Get Text    xpath://*[@id="web-content"]/div/div[2]/div/div/div[6]/h3
        Append To List    ${sector}    ${getsector}
    END
    FOR    ${count}    IN RANGE    1    ${getcount}+1
        ${getprovince}=    Get Text    xpath://*[@id="web-content"]/div/div[2]/div/div/div[6]/p[${count}]/a
        Append To List    ${province}    ${getprovince}
        Scroll Element Into View    xpath://*[@id="web-content"]/div/div[2]/div/div/div[6]/p[${count}]/a
        Click Element    xpath://*[@id="web-content"]/div/div[2]/div/div/div[6]/p[${count}]/a
        Sleep    5s
        ${gettemperature}=    Get Text    xpath://*[@id="lblDryBlubTemperature"]
        Append To List    ${temperature}    ${gettemperature}
        ${getdew}=    Get Text    xpath://*[@id="lblDewpoint"]
        Append To List    ${dew}    ${getdew}
        ${getmoisture}=    Get Text    xpath://*[@id="lblRelativeHumidity"]
        Append To List    ${moisture}    ${getmoisture}
        ${getwind}=    Get Text    xpath://*[@id="lblWindDirection"]
        Append To List    ${wind}    ${getwind}
        ${getcloud}=    Get Text    xpath://*[@id="lblTotalCloudAmount"]
        Append To List    ${cloud}    ${getcloud}
        ${getvisibilty}=    Get Text    xpath://*[@id="lblLandVisibility"]
        Append To List    ${visibility}    ${getvisibilty}
        ${getbarometric}=    Get Text    xpath://*[@id="lblMSLPressure"]
        Append To List    ${barometric}    ${getbarometric}
        ${getrain}=    Get Text    xpath://*[@id="lblRainfall"]
        Append To List    ${rain}    ${getrain}
        Go Back
        Sleep    5s
    END
    ${List_data}=    Create Dictionary
    ...    Sector=${sector}
    ...    Province=${province}
    ...    Temperature=${temperature}
    ...    Dew=${dew}
    ...    Moisture=${moisture}
    ...    Wind=${wind}
    ...    Cloud=${cloud}
    ...    Visibility=${visibility}
    ...    Barometric=${barometric}
    ...    Rain=${rain}
    ${table}=    Create Table    ${List_data}
    Write table to CSV    ${table}    Weather.csv    encoding=UTF-8-sig
