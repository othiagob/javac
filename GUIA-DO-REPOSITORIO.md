# 📚 Guia Completo do Repositório

> **String[] args** - Tema Hugo personalizado para blog pessoal  
> Este guia documenta toda a estrutura do repositório após a limpeza.

---

## 🗂️ Estrutura Geral

```
javac/
├── 📁 .github/          → Automação e CI/CD
├── 📁 assets/           → Estilos CSS (Tailwind)
├── 📁 exampleSite/      → O site/blog propriamente dito
├── 📁 i18n/             → Traduções da interface
├── 📁 images/           → Imagens do tema
├── 📁 layouts/          → Templates HTML do Hugo
├── 📁 static/           → Arquivos estáticos públicos
├── 📁 WIKI/             → Documentação detalhada
├── 📄 Arquivos de configuração (raiz)
└── 📄 cleanup.sh        → Script de limpeza
```

---

## 📁 Diretórios Principais

### `.github/` - Automação
**O que é:** Configurações do GitHub Actions para deploy automático.

**Estrutura:**
```
.github/
└── workflows/
    └── deploy.yml    → Pipeline de build e deploy para GitHub Pages
```

**Arquivos:**
- **`deploy.yml`**: Workflow que executa automaticamente quando há push na branch `main`:
  1. Instala Hugo e Bun
  2. Compila o CSS com Tailwind
  3. Gera o site estático
  4. Publica no GitHub Pages

**❗ Não edite** a menos que precise mudar o processo de deploy.

---

### `assets/` - Estilos CSS
**O que é:** Arquivos CSS fonte que são compilados com PostCSS e Tailwind.

**Estrutura:**
```
assets/
├── app.css      → CSS principal com diretivas Tailwind
├── custom.css   → Estilos customizados adicionais
└── main.css     → CSS compilado (gerado automaticamente)
```

**Arquivos:**
- **`app.css`**: Arquivo fonte principal. Contém:
  - `@import` do Tailwind CSS
  - Variáveis CSS customizadas
  - Estilos base do tema
  
- **`custom.css`**: Estilos adicionais específicos do seu blog

- **`main.css`**: ⚠️ **GERADO AUTOMATICAMENTE** pelo comando `bun run build:css`. Não edite manualmente!

**📝 Como usar:**
- Para mudar estilos: edite `app.css` ou `custom.css`
- Após editar, rode: `bun run build:css`

---

### `exampleSite/` - O Site
**O que é:** Contém TODO o conteúdo e configuração do blog. É aqui que você edita posts e configurações.

**Estrutura:**
```
exampleSite/
├── content/         → 📝 Todos os posts e páginas em Markdown
├── layouts/         → (vazio) Templates locais sobrescritos
├── static/          → Arquivos públicos locais
├── hugo.toml        → ⚙️ Configuração principal do Hugo
└── go.default.mod   → Template do módulo Go (usado no build)
```

#### **`hugo.toml`** - Configuração Principal ⭐
O arquivo mais importante! Define:
- **Informações do site**: título, autor, copyright, URL
- **Idioma**: `pt-BR`
- **Menu de navegação**: Sobre, Arquivo
- **Parâmetros do tema**: cor, avatar, GitHub
- **Taxonomias**: categorias, tags, séries
- **Markup e privacy**: configurações de renderização

**Exemplo de seção importante:**
```toml
[params]
  color = 'linen'           # Cor do tema
  github = 'othiagob'       # Usuário GitHub
  avatar = 'https://...'    # URL do avatar
```

#### **`content/`** - Conteúdo do Blog 📝
```
content/
├── _index.md           → Página inicial
├── about.md            → Página "Sobre"
├── archives.md         → Lista de arquivos
├── contact.md          → Página de contato
├── homepage/           → Seções da home
│   ├── about.md
│   ├── index.md
│   └── work.md
└── post/               → ⭐ POSTS DO BLOG
    ├── _index.md
    ├── bem-vindo.md
    ├── markdown-lab-01.md
    ├── markdown-lab-02.md
    └── markdown-lab-03.md
```

**Como criar um post:**
1. Crie um arquivo `.md` em `content/post/`
2. Adicione o front matter:
```yaml
---
title: "Título do Post"
date: 2026-03-05T10:00:00-03:00
draft: false
tags: ["tag1", "tag2"]
categories: ["categoria"]
---
```
3. Escreva o conteúdo em Markdown

#### **`layouts/`** e **`static/`**
- **`layouts/`**: Pasta vazia com `.gitkeep`. Use para sobrescrever templates do tema.
- **`static/`**: Contém `.gitignore` para ignorar arquivos gerados localmente.

---

### `i18n/` - Traduções
**O que é:** Arquivos de tradução da interface do tema (botões, labels, mensagens).

**Estrutura:** Um arquivo YAML por idioma:
```
i18n/
├── ar.yaml      → Árabe
├── en.yaml      → Inglês
├── es.yaml      → Espanhol
├── fr.yaml      → Francês
├── pt-br.yaml   → Português (Brasil) ⭐
├── pt.yaml      → Português (Portugal)
└── ... (23 idiomas no total)
```

**Arquivo usado:** `pt-br.yaml` (definido no `hugo.toml`)

**Exemplo de conteúdo:**
```yaml
back_to_home: "Voltar para a página inicial"
read_more: "Leia mais"
words: "palavras"
```

**📝 Como usar:**
- Para mudar textos da interface: edite `i18n/pt-br.yaml`

---

### `images/` - Imagens do Tema
**O que é:** Imagens e ícones usados pelo tema.

**Arquivos:**
- **`javalogo.png`**: Logo Java usado como avatar
- **`screenshot.png`**: Screenshot do tema (para showcase)
- **`tn.png`**: Thumbnail/miniatura

---

### `layouts/` - Templates HTML
**O que é:** Templates que definem a estrutura HTML das páginas.

**Estrutura:**
```
layouts/
├── 404.html           → Página de erro 404
├── _default/          → Templates padrão
│   ├── baseof.html    → Template base (esqueleto)
│   ├── list.html      → Listagens (arquivos, categorias)
│   └── single.html    → Página de post individual
├── partials/          → Componentes reutilizáveis
│   ├── footer.html    → Rodapé
│   ├── head.html      → <head> do HTML
│   ├── header.html    → Cabeçalho/navegação
│   ├── math.html      → Suporte a KaTeX (matemática)
│   └── mermaid.html   → Suporte a diagramas Mermaid
└── shortcodes/        → Shortcodes customizados
    └── collapse.html  → Shortcode {{< collapse >}}
```

#### **`_default/`** - Templates Principais
- **`baseof.html`**: Template mestre que define a estrutura HTML básica:
  ```html
  <!DOCTYPE html>
  <html>
    {{ partial "head.html" . }}
    <body>
      {{ partial "header.html" . }}
      {{ block "main" . }}{{ end }}
      {{ partial "footer.html" . }}
    </body>
  </html>
  ```

- **`list.html`**: Para páginas de listagem (arquivo, categorias, tags)

- **`single.html`**: Para páginas de post individual. Inclui:
  - Título e metadados
  - Conteúdo do post
  - Suporte a math (KaTeX) e mermaid

#### **`partials/`** - Componentes
- **`head.html`**: Meta tags, CSS, favicon, Open Graph
- **`header.html`**: Logo, navegação, menu
- **`footer.html`**: Links sociais, copyright
- **`math.html`**: Carrega KaTeX para fórmulas matemáticas
- **`mermaid.html`**: Carrega Mermaid.js para diagramas

#### **`shortcodes/`** - Componentes Markdown
- **`collapse.html`**: Cria seções expansíveis/colapsáveis

**Uso:**
```markdown
{{< collapse "Clique para expandir" >}}
Conteúdo oculto aqui
{{< /collapse >}}
```

**❗ Cuidado:** Editar templates pode quebrar o site. Sempre teste localmente!

---

### `static/` - Arquivos Públicos
**O que é:** Arquivos servidos diretamente sem processamento.

**Estrutura:**
```
static/
├── highlight.min.js    → Syntax highlighting de código
└── images/             → Imagens públicas
```

**Arquivos:**
- **`highlight.min.js`**: Biblioteca para destacar sintaxe de código nos posts

**Nota:** Arquivos em `static/` são copiados para `/` na pasta `public/` final.

---

### `WIKI/` - Documentação
**O que é:** Documentação detalhada de cada pasta e conceito do projeto.

**Estrutura:**
```
WIKI/
├── index.md                → Índice da documentação
├── assets.md               → Guia da pasta assets/
├── content.md              → Guia de criação de conteúdo
├── content-homepage.md     → Customizar homepage
├── content-post.md         → Criação de posts
├── exampleSite.md          → Estrutura do exampleSite
├── i18n.md                 → Sistema de traduções
├── layouts.md              → Sistema de templates
├── layouts-default.md      → Templates principais
├── layouts-partials.md     → Partials (componentes)
├── layouts-shortcodes.md   → Shortcodes customizados
├── static.md               → Arquivos estáticos
└── workflows.md            → GitHub Actions e deploy
```

**📝 Como usar:**
- Consulte a WIKI para entender detalhes de cada parte do projeto
- Comece pelo [index.md](WIKI/index.md)

---

## 📄 Arquivos de Configuração (Raiz)

### **`theme.toml`** - Metadados do Tema
Define informações sobre o tema Hugo:
```toml
name = "Paper"
license = "MIT"
description = "Tema simples e limpo para blogs Hugo"
min_version = "0.57.1"
```

**❗ Não edite** a menos que publique o tema separadamente.

---

### **`package.json`** - Scripts NPM/Bun
Define scripts de desenvolvimento e build:

```json
{
  "scripts": {
    "dev": "bun dev:css & bun dev:server",
    "build": "bun build:go & bun build:css & bun build:generate"
  }
}
```

**Scripts principais:**
- **`bun dev`**: Inicia servidor de desenvolvimento (CSS watch + Hugo server)
- **`bun build`**: Build completo (CSS + HTML)
- **`bun run build:css`**: Compila apenas o CSS

**Dependências:**
- Tailwind CSS 4
- PostCSS
- Autoprefixer
- Prettier (formatação)

---

### **`postcss.config.mjs`** - Configuração PostCSS
**O que faz:** Configura o processamento de CSS com Tailwind e Autoprefixer.

```javascript
export default {
  plugins: {
    '@tailwindcss/postcss': {},
    'autoprefixer': {}
  }
}
```

**❗ Não edite** a menos que adicione plugins CSS.

---

### **`go.mod`** - Módulo Go/Hugo
**O que é:** Define o módulo Hugo para o tema.

```go
module github.com/othiagob/javac
go 1.20
```

**❗ Não edite** manualmente.

---

### **Arquivos de ambiente:**
- **`.browserslistrc`**: Define browsers suportados para Autoprefixer
- **`.prettierrc.mjs`**: Configuração do Prettier (formatador)
- **`.prettierignore`**: Arquivos ignorados pelo Prettier

---

## 🧹 Script de Limpeza

### **`cleanup.sh`**
**O que faz:** Remove arquivos desnecessários e gerados.

**Para executar:**
```bash
chmod +x cleanup.sh
./cleanup.sh
```

**Remove:**
- `/public/` - Site compilado
- `/resources/_gen/` - Cache do Hugo
- `exampleSite/public/` - Build local
- Arquivos `.hugo_build.lock`
- `exampleSite/configTaxo.toml` (redundante)
- `exampleSite/go.toml` (não usado)
- `exampleSite/LICENSE` (duplicado)
- `exampleSite/go.mod` (gerado no build)

---

## 🚀 Workflows de Desenvolvimento

### **Desenvolvimento Local**
```bash
# 1. Instalar dependências
bun install

# 2. Iniciar servidor de desenvolvimento
bun dev

# O site estará em http://localhost:1313/javac/
```

### **Criar Novo Post**
```bash
# 1. Criar arquivo em exampleSite/content/post/
# 2. Adicionar front matter YAML
# 3. Escrever conteúdo em Markdown
# 4. Testar localmente com `bun dev`
```

### **Build de Produção**
```bash
# Build manual (opcional, GitHub Actions faz automaticamente)
bun build

# Site compilado vai para /public/
```

### **Deploy**
Automático via GitHub Actions:
1. Push para branch `main`
2. GitHub Actions executa o workflow
3. Site é publicado em: https://othiagob.github.io/javac/

---

## 📚 Pastas Geradas (NÃO no Git)

Estas pastas são **GERADAS** automaticamente e **NÃO devem** ser commitadas:

### **`/public/`**
Site compilado final. Gerado pelo comando `hugo`.

### **`/resources/`**
Cache e arquivos processados pelo Hugo.

### **`exampleSite/public/`**
Build de teste local.

### **`node_modules/`**
Dependências NPM (se instaladas).

**🔒 Proteção:** Todas estão listadas no `.gitignore`.

---

## 🎯 Arquivos Essenciais (Não Remover!)

### Para Funcionar:
- ✅ `exampleSite/hugo.toml` - Configuração principal
- ✅ `exampleSite/content/` - Todo o conteúdo
- ✅ `layouts/` - Templates HTML
- ✅ `assets/app.css` - Estilos fonte
- ✅ `i18n/pt-br.yaml` - Traduções
- ✅ `.github/workflows/deploy.yml` - Deploy
- ✅ `package.json` - Scripts de build
- ✅ `go.mod` - Módulo Hugo

### Para Desenvolvimento:
- ✅ `postcss.config.mjs` - Build de CSS
- ✅ `.browserslistrc` - Compatibilidade
- ✅ `exampleSite/go.default.mod` - Template usado no build

### Documentação:
- ✅ `README.md` - Visão geral
- ✅ `WIKI/` - Documentação detalhada
- ✅ `GUIA-DO-REPOSITORIO.md` (este arquivo)

---

## ❓ FAQ - Perguntas Frequentes

### Onde estão os posts?
`exampleSite/content/post/`

### Como mudar a cor do tema?
Edite `color` em `exampleSite/hugo.toml`:
```toml
[params]
  color = 'linen'  # ou: 'wheat', 'gray', 'light', etc.
```

### Como adicionar uma página?
Crie um arquivo `.md` em `exampleSite/content/` e adicione ao menu em `hugo.toml`.

### Posso deletar a WIKI?
Sim, é apenas documentação. Mas recomendo manter!

### E se eu deletar public/ por engano?
Não tem problema! É gerada automaticamente com `bun build` ou no deploy.

### Como testar localmente?
```bash
bun install  # primeira vez
bun dev      # iniciar servidor
```

### Onde fica o CSS compilado?
`assets/main.css` (gerado por `bun run build:css`)

---

## 📌 Resumo Rápido

| Pasta/Arquivo | O que faz | Você edita? |
|--------------|-----------|-------------|
| `exampleSite/hugo.toml` | Configuração principal | ✅ Sim - sempre |
| `exampleSite/content/` | Posts e páginas | ✅ Sim - seu conteúdo |
| `assets/app.css` | Estilos do tema | ✅ Sim - se customizar |
| `layouts/` | Templates HTML | ⚠️ Cuidado |
| `i18n/pt-br.yaml` | Traduções | ✅ Sim - textos UI |
| `.github/workflows/` | Deploy automático | ⚠️ Raramente |
| `public/` | Site compilado | ❌ Gerado |
| `resources/` | Cache Hugo | ❌ Gerado |
| `WIKI/` | Documentação | 📖 Referência |

---

## 🔗 Links Úteis

- **Site publicado:** https://othiagob.github.io/javac/
- **Documentação Hugo:** https://gohugo.io/documentation/
- **Tailwind CSS:** https://tailwindcss.com/docs
- **Tema original Paper:** https://github.com/nanxiaobei/hugo-paper

---

**Última atualização:** Março 2026  
**Versão do guia:** 1.0
