# Neste exemplo, podemos observar uma forma mais verbosa de se encontrar
# um palíndromo, mas que também funciona.

def palindromo(palavra)
    indice = palavra.length
    palavra_reversa = ""
    palavra.downcase!

    until indice == 0
        palavra_reversa << palavra[indice - 1]
        indice -= 1
    end

    if palavra_reversa == palavra
        return print "A sua palavra é um palíndromo = #{palavra_reversa}\n"
    else
        return print "A sua palavra não é um palíndromo = #{palavra_reversa}\n"
    end
end

print "\nDigite uma palavra: "
palavra = gets
palindromo(palavra.strip!)