*** Settings ***
Library    Browser
Variables    ../../Locators.py

*** Variables***
${locIdenticalColor}        //div[contains(@class,'layout')]//*[contains(@fill,'#20336e')]
${locBarChartIdentical}     //div[contains(@class,'layout')]//*[contains(@fill,'#7b8288')]
${locBars}                  //div[contains(@class,'layout')]//*[contains(@fill,'#86ddd4')]
${locStroke}                //div[contains(@class,'layout')]//*[contains(@stroke,'#d9e4ed')] 

*** Keywords ***
Verify Chart Title    [Arguments]    ${argTitle}
    ${locChartTitle}=    Set Variable    //div[contains(@class,'layout')]//*[contains(text(),'${argTitle}')]
    Browser.Wait For Elements State    ${locChartTitle}    state=visible
    
Verify Chart Contains Items    [Arguments]    ${argItem}
    ${locChartItem}=    Set Variable    //div[contains(@class,'layout')]//*[contains(text(),'${argItem}')]
    Browser.Wait For Elements State    ${locChartItem}    state=visible
    
Verify Chart Contains Values    [Arguments]    ${argValue}
    ${locChartValue}=    Set Variable    //div[contains(@class,'layout')]//*[contains(text(),'${argValue}')]
    Browser.Wait For Elements State    ${locChartValue}    state=visible

Verify Identical Color Count    [Arguments]    ${argCount}
    Browser.Get Element Count    ${locIdenticalColor}    ==    ${argCount}
    
Verify Bar Chart Identical Color    [Arguments]    ${argCount}
    Browser.Get Element Count    ${locBarChartIdentical}    ==    ${argCount}

Verify Bars On Graph    [Arguments]    ${argCount}
    Browser.Get Element Count    ${locBars}    ==    ${argCount}
    
Verify Strokes on Graph    [Arguments]    ${argCount}
    Browser.Get Element Count    ${locStroke}    ==    ${argCount}
    
Verify Value Sum    [Arguments]    ${argTotal}
    ${locSum}=    Set Variable    //div[contains(@class,'layout')]//*[contains(text(),'${argTotal}')]
    Browser.Wait For Elements State    ${locSum}    state=visible        



    