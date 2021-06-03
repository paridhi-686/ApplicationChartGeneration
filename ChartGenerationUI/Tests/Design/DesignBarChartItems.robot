*** Settings ***

Resource    ../../PageObjects/ChartGenerationResourceCollector.resource
Library     Browser      

  
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
${localItem4}                  item4

*** Test Cases ***

Verify Bar Chart View when items added
    
    Browser.New page    ${envVarURL}
    Log    === Delete existing items ===
    SidePanelItemValuePO.Delete Item    ${localItemAnimlPurchse}    
    SidePanelItemValuePO.Delete Item    ${localItemFood}
    SidePanelItemValuePO.Delete Item    ${localItemGrooming}
    SidePanelItemValuePO.Delete Item    ${localItemVetCare}
    SidePanelItemValuePO.Delete Item    ${localItemOTCCare}
    
    Log    === Add chart title ===
    SidePanelItemValuePO.Clear Chart Title
    SidePanelItemValuePO.Fill Chart Title    ${localChartTitle}
    Log    === Add items and values ===
    SidePanelItemValuePO.Select Add Item
    SidePanelItemValuePO.Add Item    ${localItem1}    argRow=2
    SidePanelItemValuePO.Add Item Value    ${localItem1}    20
    SidePanelItemValuePO.Select Add Item
    SidePanelItemValuePO.Add Item    ${localItem2}    argRow=3
    SidePanelItemValuePO.Add Item Value    ${localItem2}    10    
    SidePanelItemValuePO.Select Add Item
    SidePanelItemValuePO.Add Item    ${localItem3}    argRow=4 
    SidePanelItemValuePO.Add Item Value    ${localItem3}    50
    SidePanelItemValuePO.Select Add Item
    SidePanelItemValuePO.Add Item    ${localItem4}    argRow=5 
    SidePanelItemValuePO.Add Item Value    ${localItem4}    5
    NavigationTabsPO.Navigate To Design
    DesignPanelContainerPO.Select Chart Type    Bar chart
    Log    === Verify Bar chart entries ===
    ChartLayoutPO.Verify Identical Color Count    1
    ChartLayoutPO.Verify Bar Chart Identical Color    15
    ChartLayoutPO.Verify Bars On Graph    4
    ChartLayoutPO.Verify Chart Contains Items    ${localItem1}
    ChartLayoutPO.Verify Chart Contains Items    ${localItem2}
    ChartLayoutPO.Verify Chart Contains Items    ${localItem3}
    ChartLayoutPO.Verify Chart Contains Items    ${localItem4}
