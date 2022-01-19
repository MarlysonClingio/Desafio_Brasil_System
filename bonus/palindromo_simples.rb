# No ruby temos o método "reverse", que inverte uma string
# sem muita dificuldade.

def palindromo(palavra)

    palavra.downcase!

    if palavra.reverse == palavra
        return print "A sua palavra é um palíndromo = #{palavra}\n"
    else
        return print "A sua palavra não é um palíndromo = #{palavra}\n"
    end
end

print "\nDigite uma palavra: "
palavra = gets
palindromo(palavra.strip!)