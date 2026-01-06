*** Settings ***
Library    SeleniumLibrary
Resource   ../variables.robot

*** Test Cases ***
Cenario: itens corretos no carrinho
    Set Selenium Speed    0.4s
    Dado que acessei o saucedemo
    Digitei um usuario valido
    Digitei uma senha valida
    Cliquei no botão entrar
    Cliquei no botão de adicionar ao carrinho
    Clicar no carrinho
    E todos os itens aparecerem
    Quando eu clicar em remover
    Então itens serão removidos


*** Keywords ***
Dado que acessei o saucedemo
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
Clicar no carrinho
    Click Element   id:shopping_cart_container
E todos os itens aparecerem
    Element Should Be Visible    xpath=//div[@class='inventory_item_name'][contains(.,'Sauce Labs Backpack')]
    Element Should Be Visible    xpath=//div[@class='inventory_item_name'][contains(.,'Sauce Labs Bike Light')]
    Element Should Be Visible    xpath=//div[@class='inventory_item_name'][contains(.,'Sauce Labs Backpack')]
Quando eu clicar em remover
    Click Button    id:remove-sauce-labs-backpack
    Click Button    id:remove-sauce-labs-bike-light
    Click Button    id:remove-sauce-labs-bolt-t-shirt
Então itens serão removidos
    Element Should Not Be Visible    id:add-to-cart-sauce-labs-backpack
    Element Should Not Be Visible    id:add-to-cart-sauce-labs-bike-light
    Element Should Not Be Visible    id:add-to-cart-sauce-labs-bolt-t-shirt