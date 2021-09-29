require 'csv'

class AllReports

    def initialize

       @@vms_prices =  CSV.parse(File.read("./csv/prices.csv"), headers: %i[type price])
        
    end


    def price_vm(cpu, ram, hdd_type, hdd_capacity, dop)

        @cpu = cpu.to_i
        @ram = ram.to_i
        @hdd_type = hdd_type
        @hdd_capacity = hdd_capacity.to_f / 1000
        @dop = dop

        if !@dop 

            price = @cpu * @@vms_prices[:price][0].to_i + @ram * @@vms_prices[:price][1].to_i

            if @hdd_type == @@vms_prices[:type][2]
                price +=  @@vms_prices[:price][2].to_i * @hdd_capacity
            elsif @hdd_type == @@vms_prices[:type][3]
                price += @@vms_prices[:price][3].to_i * @hdd_capacity
            elsif @hdd_type == @@vms_prices[:type][4] 
                price += @@vms_prices[:price][4].to_i * @hdd_capacity
            end

        return "Цена ВМ  #{price}"

        else 

            price = @cpu * @@vms_prices[:price][0].to_i + @ram * @@vms_prices[:price][1].to_i

            if @hdd_type == @@vms_prices[:type][2]
                price +=  @@vms_prices[:price][2].to_i * @hdd_capacity
            elsif @hdd_type == @@vms_prices[:type][3]
                price += @@vms_prices[:price][3].to_i * @hdd_capacity
            elsif @hdd_type == @@vms_prices[:type][4] 
                price += @@vms_prices[:price][4].to_i * @hdd_capacity
            end

            @dop.each do |hash|
                if hash["type"] == @@vms_prices[:type][2]
                    price +=  @@vms_prices[:price][2].to_i * hash["value"].to_f / 1000
                elsif hash["type"] == @@vms_prices[:type][3]
                    price += @@vms_prices[:price][3].to_i * hash["value"].to_f / 1000
                elsif hash["type"] == @@vms_prices[:type][4] 
                    price += @@vms_prices[:price][4].to_i * hash["value"].to_f / 1000
                end   
            end

            return "Цена ВМ с доп дисками #{price}"

        end

    end
  
end