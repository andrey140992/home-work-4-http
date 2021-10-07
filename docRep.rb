require "./allReports"
require 'sinatra'

set :bind, '0.0.0.0'
set :port, 4567


get '/' do
    return "hello!
    on path http://localhost:4567/price you can see price on vm!"
end





get '/price' do
  
  cpu = params['cpu']
  ram = params['ram']
  hdd_type = params['hdd_type']
  hdd_capacity = params['hdd_capacity']
  dop = params['dop']


  report = AllReports.new
  return  report.price_vm(cpu, ram, hdd_type, hdd_capacity, dop)
  
end

