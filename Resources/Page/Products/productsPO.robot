*** Settings ***
Library          SeleniumLibrary
Library          Collections
Library          FakerLibrary        locale=pt_BR

*** Variables ***
# Produtos da Loja
${MOCHILA}                                     XPATH=//*[@id="item_4_title_link"]/div
${ACESSORIO_LUZ_BIKE}                          XPATH=//*[@id="item_0_title_link"]/div
${CAMISETE_T_SHIRT}                            XPATH=//*[@id="item_1_title_link"]/div
${JACKET}                                      XPATH=//*[@id="item_5_title_link"]/div
${CAMISETA_INFANTIL}                           XPATH=//*[@id="item_2_title_link"]/div
${CAMISETA_MANGA_LONGA}                        XPATH=//*[@id="item_3_title_link"]/div
# Funções e Icones 
${BTN_ADD_CARRINHO}                            XPATH=//*[contains(text(),"Add to cart")]
${BTN_REMOVER_PRODUTO_FORA_DO_CARRINHO}        XPATH=//*[@id="remove-sauce-labs-backpack"]
${BTN_CARRINHO}                                XPATH=//*[@id="shopping_cart_container"]/a
${BTN_VOLTAR_PRODUTOS}                         XPATH=//*[@id="back-to-products"]
${BTN_FILTRO}                                  XPATH=//*[@id="header_container"]/div[2]/div/span/select
@{SELECIONAR_FILTRO}                  
...                                            XPATH=//*[@id="header_container"]/div[2]/div/span/select/option[1]
...                                            XPATH=//*[@id="header_container"]/div[2]/div/span/select/option[2]
...                                            XPATH=//*[@id="header_container"]/div[2]/div/span/select/option[3]
...                                            XPATH=//*[@id="header_container"]/div[2]/div/span/select/option[4]
${CARRINHO}                                    XPATH=//*[@id="cart_contents_container"]/div/div[1]
${BTN_CHECKOUT}                                XPATH=//*[@id="checkout"]
# Cadastro
${CAMPO_FISTNAME}                              XPATH=//*[@id="first-name"]
${CAMPO_LASTNAME}                              XPATH=//*[@id="last-name"]
${CAMPO_POSTAL}                                XPATH=//*[@id="postal-code"]
${BTN_CONTINUE}                                XPATH=//*[@id="continue"]
# Overview Carrinho
${TITLE_OVERVIEW_CARRINHO}                     XPATH=//*[@id="header_container"]/div[2]/span
${PAGAMENTO}                                   XPATH=//*[@id="checkout_summary_container"]/div/div[2]/div[1]
${SHIPPING}                                    XPATH=//*[@id="checkout_summary_container"]/div/div[2]/div[3]
${PRECO}                                       XPATH=//*[@id="checkout_summary_container"]/div/div[2]/div[5]
${BTN_FINISH}                                  XPATH=//*[@id="finish"]
${COMPRA_FINALIZADA}                           XPATH=//*[@id="checkout_complete_container"]/h2

*** Variables ***
${elementos_produto}   Create Dictionary
...    MOCHILA                   ${MOCHILA}
...    ACESSORIO_LUZ_BIKE        ${ACESSORIO_LUZ_BIKE}
...    CAMISETE T SHIRT          ${CAMISETE_T_SHIRT}
...    JACKET                    ${JACKET}
...    CAMISETA INFANTIL         ${CAMISETA_INFANTIL}
...    CAMISETA MANGA LONGA      ${CAMISETA_MANGA_LONGA}

*** Keywords ***
# que vou comprar uma "${produto}"
#     [Arguments]    ${produto}
#     ${elemento}    Set Variable If    '${produto}' in @{elementos_produto}    ${elementos_produto['${produto}']}    'Não encontrado'
#     Run Keyword If    '${elemento}' != 'Não encontrado'    Click Element    ${elemento}
#     ...    ELSE    Log    O produto '${produto}' não foi encontrado

que vou comprar uma
    [Arguments]    ${produto}
    Run Keyword If    "${produto}" == "MOCHILA" 
    ...    Click Element    ${MOCHILA}

    ...    ELSE IF    "${produto}" == "ACESSORIO_LUZ_BIKE"
    ...    Click Element    ${ACESSORIO_LUZ_BIKE}

    ...    ELSE IF    "${produto}" == "CAMISETE T SHIRT"
    ...    Click Element    ${CAMISETE_T_SHIRT}

    ...    ELSE IF    "${produto}" == "JACKET"
    ...    Click Element    ${JACKET}

    ...    ELSE IF    "${produto}" == "CAMISETA INFANTIL"
    ...    Click Element    ${CAMISETA_INFANTIL}
    
    ...   ELSE IF    "${produto}" == "CAMISETA MANGA LONGA"
    ...   Click Element    ${CAMISETA_MANGA_LONGA}

    ...    ELSE
    ...    Log    A variável não atendeu às condições anteriores

eu adicionar um item no carrinho
    Click Element    ${BTN_ADD_CARRINHO}
    Click Element    ${BTN_CARRINHO}

confirmar a comprar de um item no carrinho
    Element Should Be Visible    ${CARRINHO}
    Click Element   ${BTN_CHECKOUT}
    
preencher o nome do comprador
    ${Nome}              FakerLibrary.First Name
    Input Text           ${CAMPO_FISTNAME}              ${Nome}

preencher o sobrenome do comprador
    ${Sobrenome}         FakerLibrary.Last Name
    Input Text           ${CAMPO_LASTNAME}              ${Sobrenome}

preencher a caixa postal do comprador
    ${Zip}         FakerLibrary.Postcode
    Input Text           ${CAMPO_POSTAL}              ${Zip}
    Click Element    ${BTN_CONTINUE}
confirmo a comprar de um item
    Element Should Be Visible    ${TITLE_OVERVIEW_CARRINHO}
    Element Should Be Visible    ${PAGAMENTO}
    Element Should Be Visible    ${SHIPPING}
    Element Should Be Visible    ${PRECO}
    Click Element    ${BTN_FINISH} 

confirmo a mensagem de comprar realizada
    Sleep    2s
    Element Should Be Visible    ${COMPRA_FINALIZADA}