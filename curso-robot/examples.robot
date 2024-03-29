*** Settings ***
Test Setup      Log To Console    ${\n}
Test Teardown   Log To Console    ${\n}

*** Test Cases ***
Teste de FOR do tipo IN RANGE
    Usando FOR IN RANGE

*** Keywords ***

Usando FOR IN RANGE
    Log To Console  ${\n}
    FOR  ${CONTADOR}   IN RANGE  0   5
        Log To Console    Minha posição agora é console: ${CONTADOR}
        Log   Minha posição agora é: ${CONTADOR}
    END