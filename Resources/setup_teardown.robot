*** Settings ***
Library        SeleniumLibrary
Resource       ../Data/data.robot
*** Keywords ***
Navegar até a tela de bem vindo
    Open Browser                  ${url}  chrome
    Maximize Browser Window
    Input Text                    id:user-name                          ${USER_NAME}  
    Input Password                XPATH=//*[@id="password"]             ${PASSWORD}
    Click Button                  XPATH=//*[@id="login-button"]
    
Navegar até o site
    [Arguments]   ${url}
    Open Browser    ${url}  chrome
    Maximize Browser Window

Fechar Navegar
    Close Browser