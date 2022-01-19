# Tarefa - 5: Leia um número inteiro que representa um código de DDD 
# para discagem interurbana. Em seguida, informe à qual cidade o DDD 
# pertence, considerando a tabela abaixo:

# DDD DESTINATION
# 61 Brasília
# 71 Salvador
# 11 Sao Paulo
# 21 Rio de Janeiro
# 32 Juiz de Fora
# 19 Campinas

# Se a entrada for qualquer outro DDD que não esteja presente na tabela acima, o programa
# deverá informar: DDD nao cadastrado

# ------------------------ Entrada ------------------------
# A entrada consiste de um único valor inteiro.

# ------------------------ Saída ------------------------
# Imprima o nome da cidade correspondente ao DDD existente na entrada.
# Imprima DDD nao cadastrado caso não existir DDD correspondente ao 
# número digitado.


begin
    print "Digite o DDD da cidade que deseja encontrar: "
    ddd = gets.to_i
rescue Exception => e
    print "Dado inválido: " + e.message
end


case ddd
when 61
    print "Brasília"
when 71
    print "Salvador"
when 11
    print "São Paulo"
when 21
    print "Rio de Janeiro"
when 32
    print "Juiz de Fora"
when 19
    print "Campinas"
else
    print "DDD não cadastrado"
end