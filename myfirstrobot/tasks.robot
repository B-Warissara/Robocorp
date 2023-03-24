*** Settings ***
Library     RPA.Tables
Library     RPA.Browser.Selenium    auto_close=${FALSE}


*** Tasks ***
main
    [Documentation]    https://www.rpa-unlimited.com/youtube/robocorp-tutorial/
    ${customers}=    Read table from CSV    C:\\Users\\pupea\\OneDrive\\เดสก์ท็อป\\customers.csv
    Open Available Browser    https://www.rpa-unlimited.com/youtube/robocorp-tutorial/    headless=${FALSE}
    FOR    ${customer}    IN    @{customers}
        Input Text    alias:CompanyName    ${customer}[๏ปฟcustomer_name]
        Input Text    alias:CompanyContact    ${customer}[contact_person]
        Input Text    alias:Address    ${customer}[address]
        Input Text    alias:Zipcode    ${customer}[zipcode]
        Input Text    alias:City    ${customer}[city]
        Input Text    alias:Country    ${customer}[country]
        Input Text    alias:Telephone    ${customer}[telephone]
        Input Text    alias:Email    ${customer}[email]
        Submit Form
    END
