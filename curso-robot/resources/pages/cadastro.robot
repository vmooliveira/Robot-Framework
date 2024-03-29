*** Settings ***
Resource    ../main.robot

*** Variables ***
#${PYTHON_PATH}            C:\Users\vitor\AppData\Local\Programs\Python\Python312\Lib\site-packages
${CAMPO_NOME}             id:form-nome
${CAMPO_CARGO}            id:form-cargo
${CAMPO_IMAGEM}           id:form-imagem
${CAMPO_TIME}             class:lista-suspensa
${BOTAO_CARD}             id:form-botao
${CAMPO_TIME}             class:lista-suspensa
${TIME_PROGRAMACAO}       //option[contains(.,'Programação')]
@{selecionar_times}
...                       //option[contains(.,'Programação')]
...                       //option[contains(.,'Front-End')]
...                       //option[contains(.,'Data Science')]
...                       //option[contains(.,'Devops')] 
...                       //option[contains(.,'UX e Design')]
...                       //option[contains(.,'Mobile')]
...                       //option[contains(.,'Inovação e Gestão')]

*** Keywords ***
Dado que eu clique no botão Criar card
    Click Button    ${BOTAO_CARD}

Então o sistema exibe uma mensagem de campo obrigatório
    Element Should Be Visible    id:form-nome-erro
    Element Should Be Visible    id:form-cargo-erro
    Element Should Be Visible    id:form-times-erro

Dado que preencha os campos do formulário
#    ${Nome}             FakerLibrary.First Name
    Input Text          ${CAMPO_NOME}       Vitor
#    ${Cargo}            FakerLibrary.Job    
    Input Text          ${CAMPO_CARGO}      Gerente
#    ${Imagem}           FakerLibrary.Image Url    widht=100 height=100
    Input Text          ${CAMPO_IMAGEM}     https://picsum.photos/200/300?grayscale
    Click Element       ${CAMPO_TIME}
    Click Element       ${TIME_PROGRAMACAO}

E clique no botão criar card
    Click Button    ${BOTAO_CARD}

Então identificar o card no time esperado
    Element Should Be Visible    class:colaborador
    Sleep    10s

Então criar 3 cards e identificá-los no time esperado
    Element Should Be Visible    class:colaborador
    FOR    ${i}    IN RANGE    1    3
        Dado que preencha os campos do formulário
        E clique no botão criar card
    END
    Sleep    10s

Então criar e identificar 1 card em cada time disponível
    FOR    ${indice}    ${time}    IN ENUMERATE    @{selecionar_times}
        Dado que preencha os campos do formulário
        Click Element       ${CAMPO_TIME}
        Click Element       ${time}
        E clique no botão criar card
    END
    sleep   10s