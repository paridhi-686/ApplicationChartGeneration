*** Settings ***
Library    Browser        

Suite Setup    Launch Browser

*** Variables ***
#Browser required variables
${windowWidth}             1920
${windowHeight}            1080

*** Keywords ***

Launch Browser
    Browser.New Browser    chromium    headless=false
    New Context    viewport={'width': ${windowWidth}, 'height': ${windowHeight}}  
