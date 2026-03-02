# Public Java

Blog pessoal de Thiago B. — programação, Java e Tibia.

**Acesse:** https://othiagob.github.io/javablog/

---

## Estrutura do projeto

```
blog/
├── assets/            → CSS (Tailwind) — estilos do tema
├── exampleSite/       → O site em si: configuração e conteúdo
│   ├── hugo.toml      → Configuração principal do blog
│   └── content/       → Todos os textos e posts do blog
├── i18n/              → Traduções da interface
├── layouts/           → Templates HTML que geram as páginas
├── static/            → Arquivos públicos (ícones, imagens, JS)
├── .github/workflows/ → Deploy automático para o GitHub Pages
├── go.mod             → Módulo Hugo (não editar)
├── package.json       → Scripts de build (Bun + PostCSS)
└── postcss.config.mjs → Configuração do processador de CSS
```

## Como funciona o deploy

Todo push na branch `main` dispara o GitHub Actions automaticamente:
1. Compila o CSS com PostCSS (Tailwind)
2. Gera o site estático com Hugo
3. Publica no GitHub Pages

## Como editar o blog

Para a maioria das mudanças, você só precisa editar arquivos dentro de `exampleSite/`.
Veja o README de cada pasta para saber exatamente o que cada arquivo faz.

## Dependências de desenvolvimento

- [Hugo Extended](https://gohugo.io/) — gerador de site estático
- [Bun](https://bun.sh/) — runtime para scripts e instalação de pacotes
- [Tailwind CSS v4](https://tailwindcss.com/) — framework de CSS
