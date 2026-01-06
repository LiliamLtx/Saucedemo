*** Settings ***
Library    SeleniumLibrary
Resource   ../variables.robot

*** Test Cases ***
Cenario: Login invalido
    Dado que eu acessei o saucedemo
    Digitei um usuario valido
    Digitei uma senha invalida
    E cliquei no botão entrar
    Então eu devo ver mensagem de erro

*** Keywords ***
Dado que eu acessei o saucedemo
    Open Browser    ${site}    ${browser}
Digitei um usuario valido
    Input Text    id:user-name    standarduser
Digitei uma senha invalida
    Input Password    id:password    erro
E cliquei no botão entrar
    Click Button    id:login-button
Então eu devo ver mensagem de erro
    Element Should Be Visible    xpath=//div[@class='error-message-container error'][contains(.,'Epic sadface: Username and password do not match any user in this service')]