module BrasilSystem
    class Servicos

        attr_accessor :categoria

        def initialize(categoria)
            @categoria = categoria
        end

        def self.categorias
            puts "\nEscolha o número de uma de nossas categorias:\n1 - Administrativo\n2 - Comercial\n3 - Fiscal"
        end

        def self.servicos(categoria)

            case categoria
                when 1
                    mensagem = <<~Mensagem
                    \nServiços da categoria Administrativo:
                    Produtos
                    Colaborador
                    Despesas
                    Ordem de serviço
                    Franquias
                    Pagamentos
                    Mensagem
                    puts mensagem
                when 2  
                    mensagem = <<~Mensagem
                    \nServiços da categoria Comercial:
                    Vendas
                    Estoque
                    Mensagem
                    puts mensagem
                when 3
                    mensagem = <<~Mensagem
                    \nServiços da categoria Fiscal:
                    Gestão e emissão de notas fiscais
                    Mensagem
                    puts mensagem
            end
        end
    end
end