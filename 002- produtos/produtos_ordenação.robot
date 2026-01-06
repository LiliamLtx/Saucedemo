*** Settings ***
Library    SeleniumLibrary
Resource   ../variables.robot

*** Test Cases ***
Cenario: ordenação produtos
    Set Selenium Speed    0.1s
    Dado que eu acessei o saucedemo
    Digitei um usuario valido
    Digitei uma senha valida
    Cliquei em entrar
    E cliquei em ordenar
    Então os produtos devem ser ordenados

*** Keywords ***
Dado que eu acessei o saucedemo
    Open Browser    ${site}    ${browser}
Digitei um usuario valido
    Input Text    id:user-name    standard_user
Digitei uma senha valida
    Input Password    id:password    secret_sauce
Cliquei em entrar
    Click Button    id:login-button
E cliquei em ordenar
    Click Element    xpath=//select[contains(@class,'container')]
Então os produtos devem ser ordenados
    Select From List By Value    xpath=//select[@class='product_sort_container']    za
    Click Element    xpath=//select[contains(@class,'container')]
    Select From List By Value    xpath=//select[@class='product_sort_container']    lohi
    Click Element    xpath=//select[contains(@class,'container')]
    Select From List By Value    xpath=//select[@class='product_sort_container']    hilo
    Click Element    xpath=//select[contains(@class,'container')]
    Select From List By Value    xpath=//select[@class='product_sort_container']    az

