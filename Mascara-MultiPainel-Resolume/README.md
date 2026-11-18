# Máscara MultiPainel para Resolume

Projeto FFGL para Resolume Arena 7, em C++/OpenGL, com compilação Windows x64 via GitHub Actions.

## O que esta primeira versão prepara

- Efeito de máscara de vídeo com até 8 painéis dispostos horizontalmente.
- Quantidade e espaçamento gerais.
- Largura, altura e posição vertical independentes para cada painel.
- Formas geométricas selecionáveis por controle.
- Interface em português.
- Arquivo `.dll` disponibilizado como artefato da compilação do GitHub Actions.

A licença vinculada a uma máquina fica para uma etapa posterior. Primeiro precisamos validar o efeito e os controles no Arena.

## Compilar

Acesse **Actions > Compilar plugin Windows x64 > Run workflow**. O pacote `Mascara-MultiPainel-Resolume-Windows-x64` será anexado à execução concluída.

## Instalar

Copie `Mascara-MultiPainel-Resolume.dll` para `Documentos\Resolume\Extra Effects` e reinicie o Arena.

## Estado

Este é o início do projeto, ainda sem binário compilado e sem validação dentro do Resolume. A base usa o SDK FFGL oficial da Resolume como dependência de compilação; o workflow baixa essa dependência durante a execução.
## Ativação em uma máquina

Planejamento para etapa posterior: a ativação será offline e vinculada ao identificador da máquina. O plugin poderá mostrar esse identificador; uma ferramenta separada emitirá um arquivo de licença assinado. A chave privada de emissão não será guardada no repositório nem incluída no plugin. Primeiro será necessário compilar e confirmar o funcionamento do efeito no Arena.
