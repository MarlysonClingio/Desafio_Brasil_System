module Classes
    class ContaBancaria

        attr_accessor :nome, :saldo

        def initialize(nome, saldo)
            @nome = nome
            @saldo = saldo
        end

        def transferir(outra_conta, valor)
            if @saldo >= valor
                debitar(valor)
                outra_conta.depositar(valor)
            else
                puts "Saldo insuficiente!!"
            end
        end

        def debitar(valor)
            if @saldo >= valor
                @saldo -= valor
            else
                puts "Saldo insuficiente!!"
            end
        end

        def depositar(valor)
            @saldo += valor
        end

        def nome
            @nome
        end

        def saldo
            @saldo
        end
    end
end