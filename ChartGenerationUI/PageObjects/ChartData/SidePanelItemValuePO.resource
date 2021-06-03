*** Settings ***
Library    Browser
Variables    ../../Locators.py


*** Keywords ***

Delete Item    [Arguments]    ${argItemToBeDeleted}
    ${locDelItem}=    Set Variable    //table/tbody//input[contains(@value,'${argItemToBeDeleted}')]/ancestor-or-self::tr//td/button[contains(@class,'delete-button')]
    Browser.Click    ${locDelItem}
    
Clear Chart Title
    Browser.Clear Text    ${commonLocChartTitle}
    
Fill Chart Title    [Arguments]    ${argChartTitle}
    Browser.Fill Text    ${commonLocChartTitle}    ${argChartTitle}
    
Select Add Item
    Browser.Click    ${commonLocAddItem}
    
Add Item    [Arguments]    ${argItemToBeAdded}    ${argRow}
    ${locAddItem}=    Set Variable    //table/tbody//tr[${argRow}]//input[contains(@placeholder, 'Type to add ...')]
    Browser.Wait For Elements State    ${locAddItem}    state=visible  
    Browser.Fill Text    ${locAddItem}     ${argItemToBeAdded}   
    
Add Item Value    [Arguments]    ${argItem}    ${argItemValue}
    ${locAddItemValue}=    Set Variable    //table/tbody//input[contains(@value,'${argItem}')]/ancestor-or-self::tr//td/input[contains(@class, 'item-value-input')]
    Browser.Click    ${locAddItemValue}
    Browser.Clear Text    ${locAddItemValue}
    Browser.Fill Text    ${locAddItemValue}    ${argItemValue}    

    


    