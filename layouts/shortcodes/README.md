# layouts/shortcodes/

Shortcodes são componentes especiais que você pode usar **dentro dos posts**
em Markdown, como se fossem tags HTML simplificadas.

## Shortcodes disponíveis

### `collapse` — bloco expansível (acordeão)

Cria um elemento `<details>` que o leitor pode abrir/fechar.

**Uso no Markdown:**
```
{{< collapse summary="Clique para ver a resposta" content="Conteúdo oculto aqui!" >}}
```

**Parâmetros:**
| Parâmetro | Obrigatório | Descrição |
|-----------|-------------|-----------|
| `summary` | ✅ | Texto do cabeçalho (sempre visível) |
| `content` | Não | Conteúdo expandido (suporta Markdown) |
| `openByDefault` | Não | `true` para começar aberto |

**Exemplo prático:**
```
{{< collapse
  summary="O que é um objeto em Java?"
  content="Um objeto é uma instância de uma classe. Ele possui **estado** (atributos) e **comportamento** (métodos)."
>}}
```

## Como criar um novo shortcode

1. Crie um arquivo `.html` nesta pasta: `layouts/shortcodes/meu-shortcode.html`
2. Use-o no Markdown: `{{< meu-shortcode parametro="valor" >}}`

## Shortcodes nativos do Hugo

O Hugo também tem shortcodes próprios que funcionam sem criar arquivo:
- `{{< youtube ID_DO_VIDEO >}}` — embed de YouTube
- `{{< figure src="imagem.jpg" caption="Legenda" >}}` — imagem com legenda
- `{{< highlight java >}} ... {{< /highlight >}}` — código com syntax highlight

Veja mais em: https://gohugo.io/content-management/shortcodes/
