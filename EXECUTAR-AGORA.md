# ⚡ INSTRUÇÕES DE LIMPEZA RÁPIDA

## 🎯 Execute Agora

Abra o **Terminal Integrado do VS Code** (Ctrl+\`) e execute:

```bash
chmod +x EXECUTAR-LIMPEZA.sh
./EXECUTAR-LIMPEZA.sh
```

O script irá remover automaticamente:
- ✓ `/public/` - Site compilado
- ✓ `/resources/` - Cache do Hugo
- ✓ `/exampleSite/public/` - Build local
- ✓ Arquivos `.hugo_build.lock`
- ✓ `exampleSite/configTaxo.toml` - Redundante
- ✓ `exampleSite/go.toml` - Não usado
- ✓ `exampleSite/LICENSE` - Duplicado
- ✓ `exampleSite/go.mod` - Gerado

## 📝 Depois da Limpeza: Commit

```bash
# 1. Remover do histórico do Git
git rm -r --cached public/ 2>/dev/null || true
git rm -r --cached resources/ 2>/dev/null || true
git rm -r --cached exampleSite/public/ 2>/dev/null || true
git rm --cached exampleSite/configTaxo.toml 2>/dev/null || true
git rm --cached exampleSite/go.toml 2>/dev/null || true
git rm --cached exampleSite/LICENSE 2>/dev/null || true
git rm --cached exampleSite/go.mod 2>/dev/null || true

# 2. Verificar o que mudou
git status

# 3. Adicionar todas as mudanças
git add .

# 4. Commit
git commit -m "chore: limpeza do repositório

- Removidos arquivos gerados (public/, resources/)
- Removidos arquivos redundantes (configTaxo.toml, go.toml, etc)
- Atualizado .gitignore para prevenir re-commit
- Adicionada documentação completa do projeto"

# 5. Push
git push origin main
```

## ✅ Pronto!

Seu repositório estará limpo e apenas com arquivos essenciais.

---

**Alternativa manual:** Se preferir fazer manualmente sem o script, execute:

```bash
rm -rf public resources exampleSite/public
rm -f .hugo_build.lock exampleSite/.hugo_build.lock
rm -f exampleSite/configTaxo.toml exampleSite/go.toml exampleSite/LICENSE exampleSite/go.mod
```

E depois siga os passos de commit acima.
