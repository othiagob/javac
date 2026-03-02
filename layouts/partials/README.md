# layouts/partials/

Componentes HTML reutilizáveis que são incluídos nos templates principais.
Cada arquivo é uma parte específica do layout do site.

## Arquivos

| Arquivo | O que renderiza | Impacto se editado |
|---------|-----------------|-------------------|
| `head.html` | Todo o conteúdo do `<head>`: meta tags, CSS, fonts, favicons | 🔴 Alto — afeta carregamento e SEO de todas as páginas |
| `header.html` | **Cabeçalho** do site: logo, navegação, botão dark mode, redes sociais | 🟡 Médio — muda o topo de todas as páginas |
| `footer.html` | **Rodapé** do site: copyright, link do Hugo | 🟢 Baixo — muda só o rodapé |
| `math.html` | Suporte a fórmulas matemáticas (KaTeX/MathJax) | 🟢 Baixo — só afeta posts com fórmulas |
| `mermaid.html` | Suporte a diagramas Mermaid nos posts | 🟢 Baixo — só afeta posts com diagramas |

## Customizações comuns

### Adicionar Google Analytics
Edite `head.html` e adicione o script do GA antes do fechamento do `</head>`.

### Mudar o rodapé
Edite `footer.html` — é o arquivo mais seguro para customizar.

### Adicionar link no menu
Não edite `header.html` — em vez disso, adicione ao `hugo.toml`:
```toml
[[menu.main]]
  name = "Projetos"
  url = "/projects/"
  weight = 30
```

### Mudar ícones de redes sociais
Os ícones são controlados pelos parâmetros em `hugo.toml`:
```toml
[params]
  github = 'seu-usuario'
  linkedin = 'seu-usuario'
  # twitter, instagram, mastodon, bluesky, threads, rss
```

## ⚠️ Cuidados

- `header.html` contém o JavaScript do dark mode — cuidado ao editar
- `head.html` controla o carregamento do CSS — erro aqui pode quebrar o visual completamente
