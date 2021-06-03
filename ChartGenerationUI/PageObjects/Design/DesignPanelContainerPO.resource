*** Settings ***
Library    Browser
Variables    ../../Locators.py


*** Keywords ***

Select Chart Type    [Arguments]    ${argChart}
    ${locChart}=    Set Variable    //*[contains(@class,'LayoutsPanelContainer')]//button[contains(text(),'${argChart}')]
    Browser.Click   ${locChart}