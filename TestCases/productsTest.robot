*** Settings ***
Resource            ../Resources/Page/Products/productsPO.robot
# Resource            ../Resources/gherkin.robot
Resource            ../Resources/setup_teardown.robot
Resource            ../Data/data.robot
 
Test Setup            Given Navegar até a tela de bem vindo


*** Test Cases ***
Cenário:01 comprar de uma MOCHILA
        Given que vou comprar uma     MOCHILA
        When eu adicionar um item no carrinho
        And confirmar a comprar de um item no carrinho
        And preencher o nome do comprador
        And preencher o sobrenome do comprador
        And preencher a caixa postal do comprador
        Then confirmo a comprar de um item
        And confirmo a mensagem de comprar realizada

Cenário:02 comprar de um ACESSORIO LUZ BIKE
        Given que vou comprar uma     ACESSORIO LUZ BIKE
        When eu adicionar um item no carrinho
        And confirmar a comprar de um item no carrinho
        And preencher o nome do comprador
        And preencher o sobrenome do comprador
        And preencher a caixa postal do comprador
        Then confirmo a comprar de um item
        And confirmo a mensagem de comprar realizada

Cenário:03 comprar de um CAMISETE T SHIRT
        Given que vou comprar uma     CAMISETE T SHIRT
        When eu adicionar um item no carrinho
        And confirmar a comprar de um item no carrinho
        And preencher o nome do comprador
        And preencher o sobrenome do comprador
        And preencher a caixa postal do comprador
        Then confirmo a comprar de um item
        And confirmo a mensagem de comprar realizada

Cenário:04 comprar de uma JACKET
        Given que vou comprar uma     JACKET
        When eu adicionar um item no carrinho
        And confirmar a comprar de um item no carrinho
        And preencher o nome do comprador
        And preencher o sobrenome do comprador
        And preencher a caixa postal do comprador
        Then confirmo a comprar de um item
        And confirmo a mensagem de comprar realizada

Cenário:05 comprar de um CAMISETA INFANTIL
        Given que vou comprar uma     CAMISETA INFANTIL
        When eu adicionar um item no carrinho
        And confirmar a comprar de um item no carrinho
        And preencher o nome do comprador
        And preencher o sobrenome do comprador
        And preencher a caixa postal do comprador
        Then confirmo a comprar de um item
        And confirmo a mensagem de comprar realizada

Cenário:06 comprar de um CAMISETA MANGA LONGA
        Given que vou comprar uma     CAMISETA MANGA LONGA
        When eu adicionar um item no carrinho
        And confirmar a comprar de um item no carrinho
        And preencher o nome do comprador
        And preencher o sobrenome do comprador
        And preencher a caixa postal do comprador
        Then confirmo a comprar de um item
        And confirmo a mensagem de comprar realizada