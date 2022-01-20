module Utils
    class MetodosUtils

        require_relative "../classes/conta_bancaria"
        require_relative "../classes/conta_com_taxa"


        def self.transacoes_bancarias(
            nome,
            valor,
            list_contas,
            tipo_transacao,
            outra_conta)

            @list_contas = list_contas
            if valor >= 0 && !nome.empty?
                index = 0
                @list_contas.each do |conta|
                    if conta.nome == nome

                        if tipo_transacao == "sacar"
                            conta.debitar(valor)
                            break
                        elsif tipo_transacao == "depositar"
                            conta.depositar(valor)
                            break
                        elsif tipo_transacao == "transferir"
                            metodo_tranferir(nome, valor, outra_conta)
                            break
                        end

                        index += 1
                        if @list_contas.length == index
                            mensagem_operacao_invalida
                        end
                    end
                end
            else
                mensagem_operacao_invalida
            end
        end




        def self.metodo_tranferir(nome, valor, outra_conta)
            if valor >= 0 && !nome.empty? && !outra_conta.empty?
                index = 0
                @list_contas.each do |conta|
                    if conta.nome == nome
                        index = 0
                        @list_contas.each do |conta_recebe_valor|
                            if conta_recebe_valor.nome == outra_conta && conta_recebe_valor.nome != nome
                                conta.transferir(conta_recebe_valor, valor)
                                break
                            else
                                index += 1
                                if  @list_contas.length == index
                                    mensagem_operacao_invalida
                                end
                            end
                        end
                    else
                        index += 1
                        if  @list_contas.length == index
                            mensagem_operacao_invalida
                        end
                    end
                end
            else
                mensagem_operacao_invalida
            end
        end


        def self.to_string_contas
            @list_contas.each do |conta|
                print "\nA conta pertencente a #{conta.nome} tem saldo atual de #{conta.saldo}"
            end
        end
        
        def self.mensagem_operacao_invalida
            puts "Dado inválido. Essa operação não foi realizada!!"
        end
    end
end