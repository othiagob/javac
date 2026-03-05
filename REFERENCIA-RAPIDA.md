# 🚀 Referência Rápida - javac

## 📝 Criar Novo Post
```bash
# 1. Criar arquivo
touch exampleSite/content/post/meu-post.md

# 2. Adicionar front matter
---
title: "Título do Post"
date: 2026-03-05T10:00:00-03:00
draft: false
tags: ["tag1", "tag2"]
categories: ["categoria"]
---

# 3. Testar
bun dev
```

## 🎨 Mudar Cor do Tema
```toml
# exampleSite/hugo.toml
[params]
  color = 'linen'  # wheat, gray, light, dark
```

## 🏃 Comandos Principais
```bash
# Desenvolvimento
bun dev              # Servidor + CSS watch
bun run build:css    # Apenas CSS

# Build completo
bun build

# Limpeza
./cleanup.sh
```

## 📁 Onde Está?
| O que | Onde |
|-------|------|
| **Posts** | `exampleSite/content/post/` |
| **Páginas** | `exampleSite/content/` |
| **Configuração** | `exampleSite/hugo.toml` |
| **CSS** | `assets/app.css` |
| **Templates** | `layouts/` |
| **Traduções** | `i18n/pt-br.yaml` |

## 🔧 Arquivos Importantes
| Arquivo | Editar? | Para que |
|---------|---------|----------|
| `exampleSite/hugo.toml` | ✅ Sim | Config principal |
| `exampleSite/content/` | ✅ Sim | Conteúdo |
| `assets/app.css` | ✅ Sim | Estilos |
| `layouts/` | ⚠️ Cuidado | Templates |
| `package.json` | ⚠️ Raramente | Scripts |
| `public/` | ❌ Não | Gerado |

## 🧹 Limpeza Rápida
```bash
# 1. Executar script
chmod +x cleanup.sh && ./cleanup.sh

# 2. Remover do Git
git rm -r --cached public/ resources/ exampleSite/public/ 2>/dev/null || true
git rm --cached exampleSite/{configTaxo.toml,go.toml,LICENSE,go.mod} 2>/dev/null || true

# 3. Commit
git add .gitignore exampleSite/.gitignore
git commit -m "chore: limpeza do repositório"
git push
```

## 🔗 Links
- **Site:** https://othiagob.github.io/javac/
- **Guia completo:** [GUIA-DO-REPOSITORIO.md](GUIA-DO-REPOSITORIO.md)
- **Documentação:** [WIKI/](WIKI/index.md)

## 🆘 Problemas Comuns
**Build falha:**
```bash
bun install      # Reinstalar dependências
rm -rf public/   # Limpar cache
bun build        # Build novamente
```

**CSS não muda:**
```bash
bun run build:css  # Recompilar CSS
```

**Post não aparece:**
- Verifique `draft: false` no front matter
- Verifique a data (não pode ser futuro)

---
**Última atualização:** Março 2026
