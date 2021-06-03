*** Settings ***
Library    OperatingSystem    
Library    String    

*** Tasks ***
Invoke Resource Collector
    [Documentation]    Resource Collector collects all resource files for UI, so that these can be used in
    ...    one single Resource statement in the tests.

    # Prep Directory for temp storing files

    ${actualDirectory}=    Evaluate   os.getcwd()   os
    Set Test Variable    ${actualDirectory}
    Create Directory   ${actualDirectory}${/}TMP
    Empty Directory    ${actualDirectory}${/}TMP

    # LocalResources PageObjects
    Append To File     ${actualDirectory}${/}TMP${/}ChartGenerationResourceCollector.resource    *** Settings ***\n
    Add Directory Files To Common Collector File    ChartGenerationUI    PageObjects    ChartGenerationResourceCollector
    OperatingSystem.Copy File    ${actualDirectory}${/}TMP${/}ChartGenerationResourceCollector.resource
    ...     ${actualDirectory}${/}ChartGenerationUI${/}PageObjects${/}ChartGenerationResourceCollector.resource

    # Clean TMP directory again
    Empty Directory    ${actualDirectory}${/}TMP

*** Keywords ***
Add Directory Files To Common Collector File    [Arguments]    ${argBaseDirectory}    ${argDirectory}
    ...     ${argTargetCollectorFile}
    [Documentation]     Add Directory files to the overall collector files
    # 1. Add all files in the current directory
    
    Set Test Variable    ${actualDirectory}
    ${filesToAppend}=    OperatingSystem.List Files In Directory
    ...     ${actualDirectory}${/}${argBaseDirectory}${/}${argDirectory}    *

    Log Many    ${filesToAppend}
    FOR    ${file}    IN    @{filesToAppend}
        ${dir}=    Replace String        ${argDirectory}                  ${/}    /
        ${path}    ${extension}=    Split Extension    ${file}
        Continue For Loop IF    "${extension}" != "resource" and "${extension}" != "py" and "${extension}" != "robot"
        ${setting}=     Run Keyword If    "${extension}"!="py"  Set Variable    Resource
        ...    ELSE    Set Variable    Variables
        Append To File    ${actualDirectory}${/}TMP${/}${argTargetCollectorFile}.resource
        ...     ${setting}${SPACE}${SPACE}${SPACE}${SPACE}../${dir}/${file}\n
    END

    # 2. Loop over the directories in this directory and recursively add those files
    ${directoriesToAppend}=   List Directories In Directory
    ...     ${actualDirectory}${/}${argBaseDirectory}${/}${argDirectory}
    Log Many    ${directoriesToAppend}

    FOR    ${directory}    IN    @{directoriesToAppend}
        Add Directory Files To Common Collector File    ${argBaseDirectory}    ${argDirectory}${/}${directory}
        ...     ${argTargetCollectorFile}
    END
