# layouts/_default/

Templates principais que definem a estrutura de todas as páginas do blog.

## Arquivos

| Arquivo | O que faz | Impacto se editado |
|---------|-----------|-------------------|
| `baseof.html` | **Template base** — estrutura HTML comum a todas as páginas (`<html>`, `<head>`, `<body>`) | 🔴 Alto — afeta **todo** o site |
| `list.html` | Template de **listagem** — página inicial, lista de tags, categorias, arquivo | 🟡 Médio — afeta páginas de lista |
| `single.html` | Template de **post individual** — como cada post é exibido | 🟡 Médio — afeta todos os posts |

## Como funciona a hierarquia

```
baseof.html  (estrutura base)
    ↓
list.html    (preenche o bloco "main" para páginas de lista)
single.html  (preenche o bloco "main" para posts individuais)
```

## Exemplos do que você pode customizar

**`single.html`** — adicionar tempo de leitura, botão de compartilhar, etc.

**`list.html`** — mudar como os posts aparecem na listagem (resumo, imagem, etc.)

**`baseof.html`** — adicionar Google Analytics, fonts externas, scripts globais:
```html
<!-- exemplo: adicionar no <head> via baseof.html -->
{{- partial "head.html" . -}}
<script async src="https://analytics..."></script>
```

## ⚠️ Cuidados

- Sempre teste o build localmente antes de fazer push ao editar esses arquivos
- A sintaxe de template do Go é sensível — um `{{` sem fechar quebra o build
- Faça backup (commit) antes de grandes alterações
