module BrasilSystem
    class Clientes
        
        require 'net/http'
        require 'json'

        def lista_clientes
            uri = URI('http://jsonplaceholder.typicode.com/users')
            response = Net::HTTP.get(uri)
            yield JSON.parse(response) if block_given?
        end

        def listar_clientes
            lista_clientes do |clientes|
                clientes.each do |nome|
                    puts nome["name"]
                end
            end
        end
    end
end