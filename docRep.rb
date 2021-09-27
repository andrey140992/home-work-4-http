require "./allReports"
require 'sinatra'

set :bind, '0.0.0.0'
set :port, 4567


get '/' do
    return "hello!
    on path http://localhost:4567/price you can see price on vm!
    on path  http://localhost:4567/price/dop you can see price on VM with additional hard drive"
end


get '/price' do
  
  cpu = params['cpu']
  ram = params['ram']
  hdd_type = params['hdd_type']
  hdd_capacity = params['hdd_capacity']
 
  report = AllReports.new("./csv/vms.csv", "./csv/prices.csv", "./csv/volumes.csv")
  return  report.price_vm(cpu, ram, hdd_type, hdd_capacity)
  
end
# http://localhost:4567/price?cpu=16&ram=1&hdd_type=sata&hdd_capacity=800

get '/price/dop' do
  
  cpu = params['cpu']
  ram = params['ram']
  hdd_type = params['hdd_type']
  hdd_capacity = params['hdd_capacity']
  dop = params['dop']

  report = AllReports.new("./csv/vms.csv", "./csv/prices.csv", "./csv/volumes.csv")
  return  report.price_vm_with_dop(cpu, ram, hdd_type, hdd_capacity, dop)
  
end

# http://localhost:4567/price/dop?cpu=16&ram=1&hdd_type=sata&hdd_capacity=800&dop[][type]=sata&dop[][value]=1000

