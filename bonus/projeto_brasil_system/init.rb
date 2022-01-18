require_relative 'lib/brasil_system_core/servicos'
require_relative 'lib/brasil_system_core/clientes'
require 'net/http'
require 'json'
require 'awesome_print'

cliente = BrasilSystem::Clientes.new

brasil_system = %Q(\n----------------- Brasil System -----------------)

descricao = <<~Descricao
    \nOlá, seja muito bem-vindo a Brasil System.
    Somos uma empresa de desenvolvimento soluções de software, 
    ajudando nossos clientes a inovar, se diferenciar e crescer.
    
    Com experiência em diversas tecnologias, construímos aplicações web
    inseridas em contextos de alta complexidade e necessidade
    específicas para cada negócio.\n
Descricao

puts brasil_system
puts descricao

puts "\n----------------- Nossos Clientes -----------------\n"
cliente.listar_clientes

print "\nCliente novo? Digite seu nome: "
@name = gets

puts "\nOlá, seja bem-vindo #{@name}"

loop_visualizar = false
while loop_visualizar == false

    print "\nDeseja visualizar nossos serviços oferecidos? (s/n) = "
    vizualizar = gets
    vizualizar.downcase!
    vizualizar.strip!

    case vizualizar
        when "s"
            BrasilSystem::Servicos.categorias
            loop_categoria = false
            while loop_categoria == false
                print "\nInforme a categoria do serviço: "
                categoria = gets.to_i
                if categoria == 1 || categoria == 2 || categoria == 3
                    categoria = BrasilSystem::Servicos.servicos(categoria)
                    loop_categoria = true
               else
                    puts "\nOpção Inválida!! Tente novamente\n"
               end
            end
            loop_visualizar = true
        when "n"
            puts "\nObrigado, volte sempre #{@name}\n"
            loop_visualizar = true
        else
            puts "\nOpção Inválida!! Tente novamente.\n"
    end
end