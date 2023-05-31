*** Settings ***
Library        SeleniumLibrary

*** Variables ***
${URL}                      https://www.saucedemo.com/
${USERNAME_CAMPO}           XPATH=//*[@id="user-name"]
${PASSWORD_CAMPO}           XPATH=//*[@id="password"]
${BTN_LOGIN}                XPATH=//*[@id="login-button"]
${MNG_USER_BLOQUEADO}       XPATH=//*[contains(text(),"Epic sadface: Sorry, this user has been locked out.")]
${MSG_USER_REQUIRED}        XPATH=//*[contains(text(),"Epic sadface: Username is required")]
${TELA_INICIAL}             XPATH=//*[@id="header_container"]/div[1]/div[2]/div
${TELA_INICIAL_SWAG_LABS}   XPATH=//*[@id="header_container"]/div[2]/span


*** Keywords ***
que estou na tela de login do Swag Labs
    ${URL Atual}    Get Location
    Should Be Equal As Strings    ${URL Atual}    ${URL}
     
preencher o usuário "${username}"
    Element Should Be Visible    ${USERNAME_CAMPO}
    Input Text    ${USERNAME_CAMPO}    ${USER_NAME}

preencher o password "${password}"
    Element Should Be Visible    ${PASSWORD_CAMPO}
    Input Text    ${PASSWORD_CAMPO}    ${PASSWORD}
clicar no botão Login
    Click Element    ${BTN_LOGIN}

sera redimencionado para tela de produtos
    Sleep    5s
    Element Should Be Visible    ${TELA_INICIAL}
    Element Should Be Visible    ${TELA_INICIAL_SWAG_LABS}  

aparecera uma notificacao de usuario bloqueado
    Element Should Be Visible    ${MNG_USER_BLOQUEADO}

aparecera uma notificação de usuário requerido
    Sleep    2s
    Element Should Be Visible    ${MSG_USER_REQUIRED}
