# 🗑️ Arquivos para Remover Manualmente

Este documento lista **todos os arquivos e pastas desnecessários** que devem ser removidos do repositório.

---

## ⚡ Remoção Rápida (Script)

Execute o script de limpeza para remover tudo automaticamente:

```bash
chmod +x cleanup.sh
./cleanup.sh
```

---

## 📋 Lista Detalhada de Remoções

### 1️⃣ Pastas Geradas pelo Build

Estas pastas contêm arquivos compilados/gerados e **NÃO devem** estar no Git:

#### **`/public/`** - Site compilado
**Por que remover:** Gerado automaticamente pelo comando `hugo build`  
**Tamanho:** ~2-5 MB  
**Conteúdo:** HTML, CSS, XML compilados

```bash
rm -rf /workspaces/javac/public
```

**Proteção futura:** Já está no `.gitignore` atualizado.

---

#### **`/resources/_gen/`** - Cache do Hugo
**Por que remover:** Cache de assets processados pelo Hugo  
**Tamanho:** Variável  
**Conteúdo:** CSS, imagens processadas

```bash
rm -rf /workspaces/javac/resources/_gen
# Ou remover toda a pasta resources:
rm -rf /workspaces/javac/resources
```

**Proteção futura:** Adicionado ao `.gitignore`.

---

#### **`/exampleSite/public/`** - Build local
**Por que remover:** Cópia local do site compilado  
**Tamanho:** ~2-5 MB

```bash
rm -rf /workspaces/javac/exampleSite/public
```

**Proteção futura:** Já está no `.gitignore` do `exampleSite/`.

---

### 2️⃣ Arquivos Lock Temporários

#### **`.hugo_build.lock`** (raiz)
**Por que remover:** Lock file temporário do Hugo

```bash
rm -f /workspaces/javac/.hugo_build.lock
```

---

#### **`exampleSite/.hugo_build.lock`**
**Por que remover:** Lock file temporário

```bash
rm -f /workspaces/javac/exampleSite/.hugo_build.lock
```

**Proteção futura:** Ambos já estão nos `.gitignore` respectivos.

---

### 3️⃣ Arquivos de Configuração Duplicados/Obsoletos

#### **`exampleSite/configTaxo.toml`** ❌
**Por que remover:** Redundante  
**Motivo:** As taxonomias (categories, tags, series) já estão definidas em `hugo.toml`  
**Verificado:** Não é referenciado em nenhum lugar do projeto

```bash
rm -f /workspaces/javac/exampleSite/configTaxo.toml
```

---

#### **`exampleSite/go.toml`** ❌
**Por que remover:** Usado apenas no Vercel  
**Motivo:** O projeto usa GitHub Pages, não Vercel. O deploy usa `hugo.toml`  
**Verificado:** GitHub Actions workflow usa `--config exampleSite/hugo.toml`, não `go.toml`

```bash
rm -f /workspaces/javac/exampleSite/go.toml
```

---

#### **`exampleSite/LICENSE`** ❌
**Por que remover:** Duplicado  
**Motivo:** Já existe `LICENSE` na raiz do projeto com o mesmo conteúdo

```bash
rm -f /workspaces/javac/exampleSite/LICENSE
```

---

#### **`exampleSite/go.mod`** (se commitado)
**Por que remover:** Gerado no build  
**Motivo:** É criado automaticamente no build a partir de `go.default.mod`  
**Verificado:** GitHub Actions executa `cp exampleSite/go.default.mod exampleSite/go.mod`

```bash
rm -f /workspaces/javac/exampleSite/go.mod
```

**Proteção futura:** Já está no `.gitignore` do `exampleSite/`.

---

## ✅ Resumo das Remoções

| Arquivo/Pasta | Status | Motivo | Protegido? |
|--------------|--------|--------|-----------|
| `/public/` | 🔴 Remover | Gerado no build | ✅ |
| `/resources/` | 🔴 Remover | Cache Hugo | ✅ |
| `/exampleSite/public/` | 🔴 Remover | Build local | ✅ |
| `.hugo_build.lock` | 🔴 Remover | Lock temporário | ✅ |
| `exampleSite/.hugo_build.lock` | 🔴 Remover | Lock temporário | ✅ |
| `exampleSite/configTaxo.toml` | 🔴 Remover | Redundante | ✅ |
| `exampleSite/go.toml` | 🔴 Remover | Não usado | ✅ |
| `exampleSite/LICENSE` | 🔴 Remover | Duplicado | ⚠️ |
| `exampleSite/go.mod` | 🔴 Remover | Gerado | ✅ |

**Total de espaço liberado:** ~5-15 MB (principalmente das pastas `public/`)

---

## 🔒 Proteção Contra Re-commit

Após a remoção, estes arquivos **NÃO serão mais commitados** graças aos `.gitignore` atualizados:

### **`.gitignore` (raiz):**
```gitignore
/node_modules
/public          # ← Adicionado
/resources       # ← Adicionado
.hugo_build.lock
```

### **`exampleSite/.gitignore`:**
```gitignore
# Arquivos gerados
go.mod
go.sum

# Build artifacts
/public
.hugo_build.lock

# Sistema
.DS_Store
```

---

## 🚀 Depois da Limpeza

1. **Remover do Git (se já commitados):**
   ```bash
   git rm -r --cached public/
   git rm -r --cached resources/
   git rm -r --cached exampleSite/public/
   git rm --cached exampleSite/configTaxo.toml
   git rm --cached exampleSite/go.toml
   git rm --cached exampleSite/LICENSE
   git rm --cached exampleSite/go.mod 2>/dev/null || true
   ```

2. **Commit as mudanças:**
   ```bash
   git add .gitignore exampleSite/.gitignore
   git commit -m "chore: remover arquivos desnecessários e atualizar .gitignore"
   ```

3. **Push:**
   ```bash
   git push origin main
   ```

---

## ⚠️ Não Remova Estes Arquivos!

Certifique-se de **NÃO** remover os seguintes arquivos essenciais:

### **Configuração essencial:**
- ✅ `go.mod` (raiz) - Módulo Hugo do tema
- ✅ `exampleSite/go.default.mod` - Template usado no build
- ✅ `exampleSite/hugo.toml` - Configuração principal
- ✅ `theme.toml` - Metadados do tema
- ✅ `package.json` - Scripts de build
- ✅ `postcss.config.mjs` - Build CSS

### **Assets:**
- ✅ `assets/app.css` - CSS fonte
- ✅ `assets/custom.css` - Customizações
- ⚠️ `assets/main.css` - Gerado, mas pode ser commitado para referência

### **Conteúdo:**
- ✅ `exampleSite/content/` - TODO o conteúdo do blog
- ✅ `layouts/` - Templates HTML
- ✅ `i18n/` - Traduções
- ✅ `static/` - Arquivos públicos

### **Configuração de ambiente:**
- ✅ `.browserslistrc` - Autoprefixer
- ✅ `.prettierrc.mjs` - Formatação
- ✅ `.prettierignore` - Ignorar formatação
- ✅ `bun.lock` - Lock de dependências

### **Deploy:**
- ✅ `.github/workflows/deploy.yml` - CI/CD

### **Documentação:**
- ✅ `README.md`, `LICENSE`, `WIKI/`, `GUIA-DO-REPOSITORIO.md`

---

## 📊 Antes vs. Depois

### **Antes (com arquivos desnecessários):**
```
javac/
├── public/                    ← ❌ ~3 MB gerados
├── resources/_gen/            ← ❌ ~1 MB cache
├── exampleSite/
│   ├── public/                ← ❌ ~3 MB duplicado
│   ├── configTaxo.toml        ← ❌ redundante
│   ├── go.toml                ← ❌ não usado
│   ├── go.mod                 ← ❌ gerado
│   └── LICENSE                ← ❌ duplicado
└── ... (arquivos essenciais)
```

### **Depois (limpo):**
```
javac/
├── assets/                    ← ✅ Fonte CSS
├── exampleSite/
│   ├── content/               ← ✅ Conteúdo
│   ├── hugo.toml              ← ✅ Config principal
│   └── go.default.mod         ← ✅ Template
├── layouts/                   ← ✅ Templates
├── i18n/                      ← ✅ Traduções
├── .github/workflows/         ← ✅ CI/CD
└── ... (apenas essenciais)
```

**Tamanho do repositório:** ~15 MB menor! 📉

---

## ✨ Benefícios da Limpeza

1. ✅ **Repositório mais leve** - Downloads mais rápidos
2. ✅ **Builds mais rápidas** - Menos arquivos para processar
3. ✅ **Histórico limpo** - Git não tracka arquivos gerados
4. ✅ **Sem conflitos** - Arquivos gerados não causam merge conflicts
5. ✅ **Melhor organização** - Apenas código fonte no Git

---

**Última atualização:** Março 2026
