#!/bin/bash
# EXECUTE ESTE SCRIPT PARA LIMPAR O REPOSITÓRIO
# Uso: bash EXECUTAR-LIMPEZA.sh

set -e

echo "==========================================="
echo "🧹 LIMPEZA AUTOMÁTICA DO REPOSITÓRIO"
echo "==========================================="
echo ""

# Função para remover com feedback
remove_item() {
    local item="$1"
    if [ -e "$item" ]; then
        echo "✓ Removendo: $item"
        rm -rf "$item"
    else
        echo "⊘ Não existe: $item"
    fi
}

# PASTAS GERADAS
echo "📁 Removendo pastas geradas..."
remove_item "public"
remove_item "resources"
remove_item "exampleSite/public"

# ARQUIVOS TEMPORÁRIOS
echo ""
echo "📄 Removendo arquivos temporários..."
remove_item ".hugo_build.lock"
remove_item "exampleSite/.hugo_build.lock"

# ARQUIVOS REDUNDANTES
echo ""
echo "🗑️  Removendo arquivos redundantes..."
remove_item "exampleSite/configTaxo.toml"
remove_item "exampleSite/go.toml"
remove_item "exampleSite/LICENSE"
remove_item "exampleSite/go.mod"

# ARQUIVOS DE DOCUMENTAÇÃO DO PROCESSO (OPCIONAL)
echo ""
echo "📋 Removendo arquivos de documentação do processo..."
remove_item "cleanup.sh"
remove_item "ARQUIVOS-PARA-REMOVER.md"
remove_item "RESUMO-DA-LIMPEZA.md"

echo ""
echo "==========================================="
echo "✅ LIMPEZA CONCLUÍDA!"
echo "==========================================="
echo ""
echo "📋 PRÓXIMOS PASSOS:"
echo ""
echo "1. Remover do Git (arquivos que já foram commitados):"
echo "   git rm -r --cached public/ 2>/dev/null || true"
echo "   git rm -r --cached resources/ 2>/dev/null || true"
echo "   git rm -r --cached exampleSite/public/ 2>/dev/null || true"
echo "   git rm --cached exampleSite/configTaxo.toml 2>/dev/null || true"
echo "   git rm --cached exampleSite/go.toml 2>/dev/null || true"
echo "   git rm --cached exampleSite/LICENSE 2>/dev/null || true"
echo "   git rm --cached exampleSite/go.mod 2>/dev/null || true"
echo ""
echo "2. Verificar status:"
echo "   git status"
echo ""
echo "3. Adicionar mudanças:"
echo "   git add ."
echo ""
echo "4. Commit:"
echo "   git commit -m \"chore: limpeza do repositório - removidos arquivos gerados e redundantes\""
echo ""
echo "5. Push:"
echo "   git push origin main"
echo ""
echo "🎉 Repositório limpo e pronto para commit!"
