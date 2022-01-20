require_relative "classes/conta_bancaria"

@conta_bancaria = []

begin
    print "\nQuantas contas deseja adicionar? = "
    qtd_contas = gets.to_i

    index = 1
    while index <= qtd_contas
        print "\nDigite o nome do titular da conta bancaria #{index}: "
        nome_conta = gets.strip.capitalize

        print "Digite a quantia inicial do saldo desta conta: "
        saldo_conta = gets.chomp.to_f


        if saldo_conta >= 0 && !nome_conta.empty?
            @conta_bancaria.push(Classes::ContaBancaria.new(nome_conta, saldo_conta))
        else
            puts "Dado inválido. Essa operação não foi realizada!!"
        end

        index += 1
    end


    if qtd_contas > 0  && !@conta_bancaria.empty?
        puts "\n---------- Realize um saque ----------"
        print "Digite o nome do titular da conta que deseja sacar: "
        nome_conta_saque = gets.strip.capitalize
        print "Digite a quantia que deseja sacar: "
        valor_saque = gets.chomp.to_f

        if valor_saque >= 0 && !nome_conta_saque.empty?
            index = 0
            @conta_bancaria.each do |conta|
                if conta.nome == nome_conta_saque
                    conta.debitar(valor_saque)
                    break
                else
                    index += 1
                    if @conta_bancaria.length == index
                        puts "Dado inválido. Essa operação não foi realizada!!"
                    end
                end
            end
        else
            puts "Dado inválido. Essa operação não foi realizada!!"
        end


        puts "\n---------- Realize um deposito ----------"
        print "Digite o nome do titular da conta que deseja depositar: "
        nome_conta_deposito = gets.strip.capitalize
        print "Digite a quantia que deseja depositar: "
        valor_deposito = gets.chomp.to_f

       
        if valor_deposito >= 0 && !nome_conta_deposito.empty?
            index = 0
            @conta_bancaria.each do |conta|
                if conta.nome == nome_conta_deposito
                    conta.depositar(valor_deposito)
                    break
                else
                    index += 1
                    if  @conta_bancaria.length == index
                        puts "Dado inválido. Essa operação não foi realizada!!"
                    end
                end
            end
        else
            puts "Dado inválido. Essa operação não foi realizada!!"
        end

        puts "\n---------- Realize uma transferêcia ----------"
        print "Digite o nome do titular da conta que deseja fazer a transferência: "
        nome_conta_transf = gets.strip.capitalize
        print "Digite a quantia que deseja depositar: "
        valor_transf = gets.chomp.to_f
        print "Digite o nome do titular da conta que deseja receber o valor transferido: "
        nome_conta_recebe_transf = gets.strip.capitalize

        if valor_transf >= 0 && !nome_conta_transf.empty? && !nome_conta_recebe_transf.empty?
            index = 0
            @conta_bancaria.each do |conta|
                if conta.nome == nome_conta_transf
                    index = 0
                    @conta_bancaria.each do |conta_recebe_valor|
                        if conta_recebe_valor.nome == nome_conta_recebe_transf
                            conta.transferir(conta_recebe_valor, valor_transf)
                            break
                        else
                            index += 1
                            if  @conta_bancaria.length == index
                                puts "Dado inválido. Essa operação não foi realizada!!"
                            end
                        end
                    end
                else
                    index += 1
                    if  @conta_bancaria.length == index
                        puts "Dado inválido. Essa operação não foi realizada!!"
                    end
                end
            end
        else
            puts "Dado inválido. Essa operação não foi realizada!!"
        end

        @conta_bancaria.each do |conta|
            print "\nA conta pertencente a #{conta.nome} tem saldo atual de #{conta.saldo}"
        end

    else
        puts "Dado inválido ou zerado. O programa será encerrado!!"
    end

rescue Exception => e
    puts "Error: " + e.message
end