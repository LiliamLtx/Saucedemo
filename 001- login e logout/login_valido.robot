*** Settings ***
Library    SeleniumLibrary
Resource   ../variables.robot

*** Test Cases ***
Cenario: Login valido
    Dado que eu acessei o saucedemo
    Digitei um usuario valido
    Digitei uma senha valida
    E cliquei em entrar
    Então eu devo ver produtos

*** Keywords ***
Dado que eu acessei o saucedemo
    Open Browser    ${site}    ${browser}
Digitei um usuario valido
    Input Text    id:user-name    standard_user
Digitei uma senha valida
    Input Password    id:password    secret_sauce
E cliquei em entrar
    Click Button    id:login-button
Então eu devo ver produtos
    Element Should Be Visible    xpath=//span[@class='title'][contains(.,'Products')]