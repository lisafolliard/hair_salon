require './lib/client.rb'
require './lib/stylist.rb'
require 'sinatra/reloader'
require 'sinatra'
also_reload '../lib/**/*.rb'
require 'pg'
require 'pry'

DB = PG.connect({:dbname => 'hair_salon_test'})

get('/') do
  @stylists = Stylist.all()
  erb(:index)
end

post('/stylists') do
  firstname = params.fetch('firstname')
  lastname = params.fetch('lastname')
  new_stylist = Stylist.new({:firstname => firstname, :lastname => lastname, :id => nil})
  new_stylist.save()
  @stylists = Stylist.all()
  erb(:index)
end
