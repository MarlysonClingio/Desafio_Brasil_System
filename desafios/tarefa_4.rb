# Tarefa - 4: Faça o somatório da sua data de nascimento.

begin
    print "Digite sua data de nascimento(Ex.: 07/07/1987): "
    data_nascimento = gets.chomp.strip
rescue Exception => e
    print "Sua data foi inserida de forma incorreta: " + e.message
end


list_texto = data_nascimento.split("")

list_numeros = []
list_texto.each do |item|
    list_numeros += item.split('').map { |s| s.to_i }
end


ultimo = 0
soma = 0
list_numeros.each do |item|
    
    if item == 0
        ultimo += 1
        next item
    else
        soma += item
        print "#{item}"

        if ultimo < list_numeros.length - 1
            print "+"
            ultimo += 1
        end
    end
end

print " = #{soma}"