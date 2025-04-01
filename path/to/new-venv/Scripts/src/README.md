# Explicação do testes realizados referentes à vaga de estágio da IntuitiveCare

## Testes de raspagem e transformação de dados.

Os 2 primeiros testes foram realizados utilizando a interface do Jupyter, o que facilita não só o desenvolvimento, mas a compreensão do código, mostrando cada procedimento em passo a passo.

## Teste de banco de dados

A seguir, vêm os comandos SQL utilizados para criar a database, importar e tratar os dados como pedido, realizando queries analíticas para determinar as 10 empresas com mais gasto no último trimestre, e no último ano. 

## Teste de API
E finalmente, o teste de API, com uma sub-pasta dedicada. Para o servidor Python, foi utilizada a API Flask, pela sua simplicidade a praticidade para consultas como as pedidas pelo desafio. A seguir, eu coloco em mais detalhes a configuração do projeto.

## Configuração de projeto
```
npm install
```

### Compila e carrega para desenvolvimento
```
npm run serve
```

### Compila e minimiza para produção
```
npm run build
```

### Configuração personalizada
Veja a [referência de configuração](https://cli.vuejs.org/config/).