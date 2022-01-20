require_relative "classes/conta_bancaria"
require_relative "classes/conta_com_taxa"
require_relative "utils/metodos_utils"

begin
    @conta_bancaria = []

    print "\nQuantas contas deseja adicionar? = "
    qtd_contas = gets.to_i

    if qtd_contas > 0

        index = 1
        while index <= qtd_contas
            print "\nDigite o nome do titular da conta bancaria #{index}: "
            nome_conta = gets.strip.capitalize

            print "Digite a quantia inicial do saldo desta conta: "
            saldo_conta = gets.chomp.to_f

            if saldo_conta >= 0 && !nome_conta.empty?
                @conta_bancaria.push(
                    Classes::ContaBancaria.new(
                        nome_conta,
                        saldo_conta
                    )
                )
            else
                Utils::MetodosUtils.mensagem_operacao_invalida
            end

            index += 1
        end


        if !@conta_bancaria.empty?

            puts "\n---------- Realize um deposito ----------"
            print "Digite o nome do titular da conta que deseja depositar: "
            nome_conta_deposito = gets.strip.capitalize
            print "Digite a quantia que deseja depositar: "
            valor_deposito = gets.chomp.to_f

            Utils::MetodosUtils.transacoes_bancarias(
                nome_conta_deposito,
                valor_deposito,
                @conta_bancaria,
                "depositar",
                ""
            )


            puts "\n---------- Realize um saque ----------"
            print "Digite o nome do titular da conta que deseja sacar: "
            nome_conta_saque = gets.strip.capitalize
            print "Digite a quantia que deseja sacar: "
            valor_saque = gets.chomp.to_f

            Utils::MetodosUtils.transacoes_bancarias(
                nome_conta_saque,
                valor_saque,
                @conta_bancaria,
                "sacar",
                ""
            )
        
            
            if @conta_bancaria.length > 1
                puts "\n---------- Realize uma transferêcia ----------"
                print "Digite o nome do titular da conta que deseja fazer a transferência: "
                nome_conta_transf = gets.strip.capitalize
                print "Digite a quantia que deseja trasnferir: "
                valor_transf = gets.chomp.to_f
                print "Digite o nome do titular da conta que deseja receber o valor transferido: "
                nome_conta_recebe_transf = gets.strip.capitalize

                Utils::MetodosUtils.transacoes_bancarias(
                    nome_conta_transf,
                    valor_transf,
                    @conta_bancaria,
                    "transferir",
                    nome_conta_recebe_transf
                )
            end

            Utils::MetodosUtils.to_string_contas

        else
            puts "Não existe nenhuma conta!!"
        end

    else
        Utils::MetodosUtils.mensagem_operacao_invalida
    end

rescue Exception => e
    puts "Error: " + e.message
end