# RELATÓRIO - MÓDULO 4 - CI/CD e Segurança com Trivy

**Autor:** luis penabad
**Repositório:** meu-site
**Data:** 10/09/2026

## 1. Objetivo
Implementar pipeline CI/CD com scan de vulnerabilidades usando Trivy Action e Deploy automático para EC2.

## 2. Incidente Detectado

Durante a execução dos workflows, foi identificado falha de segurança na Action `aquasecurity/trivy-action`.

- **Versão vulnerável usada no módulo:** `v0.24.0` e `@0.35.0` sem o `v` (tags mutáveis)
- **Problema:** No dia 14/09/2025 houve um incidente de supply chain. A tag `0.24.0` foi comprometida e versões sem prefixo `v` são consideradas mutáveis, podendo ser sobrescritas por atacantes.
- **Erro observado:** Os workflows `#8` e `#9` falharam com `Process completed with exit code 1` devido ao `docker build` sem espaço e ao uso de tag não pinada.

O arquivo `deploy.yml` também foi sobrescrito acidentalmente com o conteúdo do `trivy.yml`, causando duplicidade de workflows com mesmo nome.

## 3. Correção Aplicada

### 3.1. Restauração do Deploy
```bash
git checkout 2810ba2 -- .github/workflows/deploy.yml

