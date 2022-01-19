# Tarefa - 6: Faça um programa que, dado um número a partir do qual 
# deve-se começar a contagem regressiva, imprima na tela a contagem 
# regressiva desse número até 0. Ao final da contagem, imprima a 
# mensagem KABUM.

# Importante: cada número deve ser impresso em uma nova linha, assim 
# como a mensagem KABUM ao final.

# ------------------------ Entrada ------------------------
#A entrada será sempre um número positivo a partir do qual deve-se 
# começar a contagem regressiva.

# ------------------------ Saída ------------------------
# Imprima na tela a contagem regressiva, colocando cada número da 
# contagem em uma linha, incluindo o valor inicial fornecido na entrada
# e o zero. Na última linha, deve estar sempre a palavra KABUM.

loop_regressivo = true

while loop_regressivo

    begin
        print "Digite um número positivo para iniciar a contagem regressiva: "
        num = gets.to_i
    rescue Exception => e
        print "Dado inválido: " + e.message
    end

    if num >= 0
        until num < 0
            puts num
            num -= 1
        end
        puts "KABUM"
        loop_regressivo = false
    else
        puts "\nSeu número informado é um número negativo. Tente novamente!!\n"
    end
end