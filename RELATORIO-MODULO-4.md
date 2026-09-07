\# Relatório Módulo 4 - CI/CD com Trivy Automático



\*\*Autor:\*\* Luis Penabad

\*\*Repositório:\*\* penabadluis-rgb/meu-site

\*\*Data:\*\* 06/09/2026



\## Objetivo

Configurar pipeline CI/CD no GitHub Actions para escanear vulnerabilidades da imagem Docker com Trivy automaticamente a cada push.



\## O que foi feito



1\. Criei a pasta `.github/workflows/`

2\. Criei o arquivo `trivy.yml` com o seguinte conteúdo:



```yaml

name: Modulo 4 - CI/CD Trivy automatico

on: \[push]

jobs:

&#x20; scan:

&#x20;   runs-on: ubuntu-latest

&#x20;   steps:

&#x20;     - uses: actions/checkout@v4

&#x20;     - name: Build imagem Docker

&#x20;       run: docker build -t meu-site:latest.

&#x20;     - name: Scan com Trivy

&#x20;       uses: aquasecurity/trivy-action@master

&#x20;       with:

&#x20;         image-ref: meu-site:latest

&#x20;         severity: 'CRITICAL,HIGH'

&#x20;         exit-code: '1'



Erros encontrados e correção:

Erro 1: Usei aquasecurity/trivy-action@0.24.0 e deu erro Unable to resolve action.

Correção: Troquei para aquasecurity/trivy-action@master

Erro 2: Arquivo YAML sem indentação (sem espaços).

Correção: Corrigi indentação com 2 espaços.

Resultado

Pipeline executou com sucesso em 29s (succeeded).

Set up job: OK

Build imagem Docker: OK

Scan com Trivy: OK

Prints do Actions na pasta /prints

Conclusão

O CI/CD está funcionando e bloqueia o deploy se encontrar vulnerabilidades CRITICAL ou HIGH.

