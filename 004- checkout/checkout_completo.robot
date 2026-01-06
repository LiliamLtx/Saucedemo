*** Settings ***
Library    SeleniumLibrary
Library    Process
Resource   ../variables.robot

*** Test Cases ***
Cenario: Ckeckout completo
    Set Selenium Speed    0.3s
    Dado que eu acessei o saucedemo
    Digitei um usuario valido
    Digitei uma senha valida
    Cliquei em entrar
    Adicionar ao carrinho
    Clicar no carrinho
    E todos os itens selecionados aparecerem
    Quando eu clicar no botão checkout
    Digitar nome, sobrenome e cep
    Clicar em continue
    Checar meu pedido
    E Clicar em finish
    Então meu pedido deve ser feito


*** Keywords ***
Dado que eu acessei o saucedemo
    Open Browser    ${site}    ${browser}
Digitei um usuario valido
    Input Text    id:user-name    standard_user
Digitei uma senha valida
    Input Password    id:password    secret_sauce
 Cliquei em entrar
    Click Button    id:login-button
Adicionar ao carrinho
    Sleep    1s     #caso apareca alerta de google senhClicar em ok
    Click Button    id:add-to-cart-sauce-labs-backpack
    Click Button    id:add-to-cart-sauce-labs-bike-light
    Click Button    id:add-to-cart-sauce-labs-bolt-t-shirt
Clicar no carrinho
    Click Element   id:shopping_cart_container
E todos os itens selecionados aparecerem
    Element Should Be Visible    xpath=//div[@class='inventory_item_name'][contains(.,'Sauce Labs Backpack')]
    Element Should Be Visible    xpath=//div[@class='inventory_item_name'][contains(.,'Sauce Labs Bike Light')]
    Element Should Be Visible    xpath=//div[@class='inventory_item_name'][contains(.,'Sauce Labs Backpack')]
Quando eu clicar no botão checkout
    Click Button    id:checkout
Digitar nome, sobrenome e cep
    Input Text    id:first-name    meu nome
    Input Text    id:last-name   meu sobrenome
    Input Text    id:postal-code    717171
Clicar em continue
    Click Button    id:continue
Checar meu pedido
    Element Should Be Visible    xpath=//span[@class='title'][contains(.,'Checkout: Overview')]
E Clicar em finish
    Click Button    id:finish
Então meu pedido deve ser feito
    Element Should Be Visible    xpath=//h2[@class='complete-header'][contains(.,'Thank you for your order!')]