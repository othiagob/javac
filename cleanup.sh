#!/bin/bash
# Script para remover arquivos desnecessários do repositório
# Uso: chmod +x cleanup.sh && ./cleanup.sh

set -e  # Para em caso de erro

echo "======================================"
echo "🧹 Limpeza do Repositório javac"
echo "======================================"
echo ""

# Função para remover com confirmação
remove_item() {
    local item="$1"
    local reason="$2"
    
    if [ -e "$item" ]; then
        echo "✓ Removendo: $item"
        echo "  Motivo: $reason"
        rm -rf "$item"
    else
        echo "⊘ Já removido: $item"
    fi
}

echo "📁 Removendo pastas geradas..."
echo ""

remove_item "/workspaces/javac/public" "Site compilado pelo Hugo"
remove_item "/workspaces/javac/resources/_gen" "Cache do Hugo"
remove_item "/workspaces/javac/resources" "Pasta de recursos gerados"
remove_item "/workspaces/javac/exampleSite/public" "Build local do site"

echo ""
echo "📄 Removendo arquivos temporários..."
echo ""

remove_item "/workspaces/javac/.hugo_build.lock" "Lock file temporário"
remove_item "/workspaces/javac/exampleSite/.hugo_build.lock" "Lock file temporário"

echo ""
echo "🗑️  Removendo arquivos redundantes..."
echo ""

remove_item "/workspaces/javac/exampleSite/configTaxo.toml" "Redundante (taxonomias já em hugo.toml)"
remove_item "/workspaces/javac/exampleSite/go.toml" "Usado apenas no Vercel (projeto usa GitHub Pages)"
remove_item "/workspaces/javac/exampleSite/LICENSE" "Duplicado (já existe na raiz)"
remove_item "/workspaces/javac/exampleSite/go.mod" "Gerado no build (criado a partir de go.default.mod)"

echo ""
echo "======================================"
echo "✨ Limpeza concluída!"
echo "======================================"
echo ""
echo "📋 Próximos passos:"
echo ""
echo "1. Remover do Git (se já commitados):"
echo "   git rm -r --cached public/ 2>/dev/null || true"
echo "   git rm -r --cached resources/ 2>/dev/null || true"
echo "   git rm -r --cached exampleSite/public/ 2>/dev/null || true"
echo "   git rm --cached exampleSite/configTaxo.toml 2>/dev/null || true"
echo "   git rm --cached exampleSite/go.toml 2>/dev/null || true"
echo "   git rm --cached exampleSite/LICENSE 2>/dev/null || true"
echo "   git rm --cached exampleSite/go.mod 2>/dev/null || true"
echo ""
echo "2. Adicionar as mudanças do .gitignore:"
echo "   git add .gitignore exampleSite/.gitignore"
echo ""
echo "3. Commit:"
echo "   git commit -m 'chore: remover arquivos desnecessários e atualizar .gitignore'"
echo ""
echo "4. Push:"
echo "   git push origin main"
echo ""
echo "✅ Os arquivos removidos não voltarão (protegidos pelo .gitignore)"
echo ""
