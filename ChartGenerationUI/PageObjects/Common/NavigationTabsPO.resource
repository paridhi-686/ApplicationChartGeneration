*** Settings ***
Library    Browser
Variables    ../../Locators.py


*** Keywords ***

Navigate To Design
    Browser.Click    ${commonLocDesignTab}