*** Settings ***
Library    SeleniumLibrary
Resource   ../variables.robot

*** Test Cases ***
Cenario: Login invalido
    Dado que eu acessei o saucedemo
    Digitei um usuario invalido
    Digitei uma senha valida
    E cliquei no botão entrar
    Então eu devo ver mensagem de erro

*** Keywords ***
Dado que eu acessei o saucedemo
    Open Browser    ${site}    ${browser}
Digitei um usuario invalido
    Input Text    id:user-name    errado
Digitei uma senha valida
    Input Password    id:password    secret_sauce
E cliquei no botão entrar
    Click Button    id:login-button
Então eu devo ver mensagem de erro
    Element Should Be Visible    xpath=//div[@class='error-message-container error'][contains(.,'Epic sadface: Username and password do not match any user in this service')]