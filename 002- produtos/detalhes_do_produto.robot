*** Settings ***
Library    SeleniumLibrary
Resource   ../variables.robot

*** Test Cases ***
Cenario: detalhes produto
    Dado que eu acessei o saucedemo
    Digitei um usuario valido
    Digitei uma senha valida
    Cliquei no botão entrar
    E vi a tela de produtos
    Quando clicar no produto
    Então os detalhes devem aparecer


*** Keywords ***
Dado que eu acessei o saucedemo
    Open Browser    ${site}    ${browser}
Digitei um usuario valido
    Input Text    id:user-name    standard_user
Digitei uma senha valida
    Input Password    id:password    secret_sauce
Cliquei no botão entrar
    Click Button    id:login-button
E vi a tela de produtos
    Element Should Be Visible    xpath=//span[@class='title'][contains(.,'Products')]
Quando clicar no produto
    Click Element    id:item_4_title_link
Então os detalhes devem aparecer
    Element Should Be Visible    xpath=//div[@class='inventory_details_desc large_size']