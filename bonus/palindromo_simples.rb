# No ruby temos o método "reverse", que inverte uma string
# sem muita dificuldade.

def palindromo(palavra)

    palavra.downcase!
    palavra_reversa = palavra.reverse

    if palavra_reversa == palavra
        return print "A sua palavra é um palíndromo = #{palavra_reversa}\n"
    else
        return print "A sua palavra não é um palíndromo = #{palavra_reversa}\n"
    end
end

print "\nDigite uma palavra: "
palavra = gets
palindromo(palavra.strip!)