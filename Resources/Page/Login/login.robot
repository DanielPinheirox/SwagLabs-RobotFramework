*** Settings ***
Resource    loginPO.robot

*** Variables ***

*** Keywords ***
que estou na tela de login do Swag Labs
    que estou na tela de login do Swag Labs

preencher o usuário "${user}"
   [Arguments]    ${user}
   preencher o usuário "${user}"

preencher o password "${senha}"
    [Arguments]  ${senha}
    preencher o password "${senha}"

clicar no botão Login
    clicar no botão Login

sera redimencionado para tela de produtos
    sera redimencionado para tela de produtos

aparecera uma notificacao de usuario bloqueado
    aparecera uma notificacao de usuario bloqueado

aparecera uma notificação de usuário requerido
    aparecera uma notificação de usuário requerido

