*** Settings ***

Resource    ../../PageObjects/ChartGenerationResourceCollector.resource
Library     Browser     
Library    ScreenCapLibrary    
  

*** Variables ***

${envVarURL}                   https://spark.adobe.com/express-apps/chart/
${localItemAnimlPurchse}       Animal purchases
${localItemFood}               Food
${localItemGrooming}           Grooming/boarding
${localItemVetCare}            Vet care
${localItemOTCCare}            OTC Care/supplies
${localChartTitle}             test1
${localItem1}                  item1
${localItem2}                  item2
${localItem3}                  item3

*** Test Cases ***

Verify modifications in chart when items added/deleted
    
    [Documentation]    Test covers deletion & addition of items & values
    ...     along with verification of pie chart.
    [Setup]    Start Gif Recording

    Browser.New page    ${envVarURL}
    Log    === Delete all items ===
    SidePanelItemValuePO.Delete Item    ${localItemAnimlPurchse}    
    SidePanelItemValuePO.Delete Item    ${localItemFood}
    SidePanelItemValuePO.Delete Item    ${localItemGrooming}
    SidePanelItemValuePO.Delete Item    ${localItemVetCare}
    SidePanelItemValuePO.Delete Item    ${localItemOTCCare}
    Log    === Change chart title ===
    SidePanelItemValuePO.Clear Chart Title
    SidePanelItemValuePO.Fill Chart Title    ${localChartTitle}
    Log    === Add Items and values ===
    SidePanelItemValuePO.Select Add Item
    SidePanelItemValuePO.Add Item    ${localItem1}    argRow=2
    SidePanelItemValuePO.Select Add Item
    SidePanelItemValuePO.Add Item    ${localItem2}    argRow=3
    SidePanelItemValuePO.Add Item Value    ${localItem2}    20    
    SidePanelItemValuePO.Select Add Item
    SidePanelItemValuePO.Add Item    ${localItem3}    argRow=4 
    SidePanelItemValuePO.Add Item Value    ${localItem3}    30
    Log    === Verify chart entries ===
    ChartLayoutPO.Verify Chart Title    ${localChartTitle}
   
    ChartLayoutPO.Verify Chart Contains Items    ${localItem1}
    ChartLayoutPO.Verify Chart Contains Items    ${localItem2}
    ChartLayoutPO.Verify Chart Contains Items    ${localItem3}
    
    ChartLayoutPO.Verify Chart Contains Values    10
    ChartLayoutPO.Verify Chart Contains Values    20
    ChartLayoutPO.Verify Chart Contains Values    30

    ChartLayoutPO.Verify Identical Color Count    2
    ChartLayoutPO.Verify Value Sum    60
    [Teardown]    Stop Gif Recording    
