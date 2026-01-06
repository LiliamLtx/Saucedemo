*** Settings ***
Library    SeleniumLibrary
Resource   ../variables.robot

*** Test Cases ***
Cenario: itens corretos no carrinho
    Set Selenium Speed    0.3s
    Dado que eu acessei o saucedemo
    Digitei um usuario valido
    Digitei uma senha valida
    Cliquei no botão entrar
    Cliquei no botão de adicionar ao carrinho
    Quando eu clicar no carrinho
    Então todos os itens devem aparecer


*** Keywords ***
Dado que eu acessei o saucedemo
    Open Browser    ${site}    ${browser}
Digitei um usuario valido
    Input Text    id:user-name    standard_user
Digitei uma senha valida
    Input Password    id:password    secret_sauce
 Cliquei no botão entrar
    Click Button    id:login-button
Cliquei no botão de adicionar ao carrinho
    Click Button    id:add-to-cart-sauce-labs-backpack
    Click Button    id:add-to-cart-sauce-labs-bike-light
    Click Button    id:add-to-cart-sauce-labs-bolt-t-shirt
Quando eu clicar no carrinho
    Click Element   id:shopping_cart_container
Então todos os itens devem aparecer
    Element Should Be Visible    xpath=//div[@class='inventory_item_name'][contains(.,'Sauce Labs Backpack')]
    Element Should Be Visible    xpath=//div[@class='inventory_item_name'][contains(.,'Sauce Labs Bike Light')]
    Element Should Be Visible    xpath=//div[@class='inventory_item_name'][contains(.,'Sauce Labs Backpack')]