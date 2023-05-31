*** Settings ***
Resource            ../Resources/Page/Login/loginPO.robot
Resource            ../Resources/gherkin.robot
Resource            ../Resources/setup_teardown.robot
Resource            ../Data/data.robot

Test Setup          Navegar até o site   ${URL} 

*** Test Cases ***
# Test Setup     Navegar até o site ${URL}
Validar Login com sucesso em Swag Labs
    Given que estou na tela de login do Swag Labs
    When preencher o usuário "${USER_NAME}"
    And preencher o password "${PASSWORD}"
    And clicar no botão Login
    Then sera redimencionado para tela de produtos

Validar Login com usuário bloqueado em Swag Labs
    Given que estou na tela de login do Swag Labs
    When preencher o usuário "${USER_LOCKED}"
    And preencher o password "${PASSWORD}"
    And clicar no botão Login
    Then aparecera uma notificacao de usuario bloqueado

Validar Login sem informações
        Given que estou na tela de login do Swag Labs
        When preencher o usuário ""
        And preencher o password ""
        And clicar no botão Login
        Then aparecera uma notificação de usuário requerido

