*** Settings ***
Library    SeleniumLibrary
Resource   ../variables.robot

*** Test Cases ***
Cenario: Logout
    Dado que eu acessei o saucedemo
    Digitei um usuario valido
    Digitei uma senha valida
    E cliquei em entrar
    E cliquei no menu
    Quando clicar em logout
    Então eu devo sair

*** Keywords ***
Dado que eu acessei o saucedemo
    Open Browser    ${site}    ${browser}
Digitei um usuario valido
    Input Text    id:user-name    standard_user
Digitei uma senha valida
    Input Password    id:password    secret_sauce
E cliquei em entrar
    Click Button    id:login-button
E cliquei no menu
    Click Button    id:react-burger-menu-btn
Quando clicar em logout
    Wait Until Element Is Visible    id:logout_sidebar_link    timeout=10s
    Click Element   id:logout_sidebar_link
Então eu devo sair
    Element Should Be Visible    xpath=//div[contains(@class,'login_wrapper-inner')]