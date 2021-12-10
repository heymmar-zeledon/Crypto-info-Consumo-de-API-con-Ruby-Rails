
require 'rest-client'
require 'json'


class StaticPagesController < ApplicationController
  #Documentacion de  la API: https://docs.coincap.io/#ee30bea9-bb6b-469d-958a-d3e35d442d7a
  def home

    #Hola mundo
  end

  def listamonedas
    @value = 1
    begin
      response = RestClient.get('https://api.coincap.io/v2/assets')

      @results = JSON.parse(response.to_str) 
      @value = 0
    rescue => exception
      @value=-1
    end 
    
    #@name = results['data'][0]['id']
         
    
    
  end

  def buscarmonedas
   @aprende=1
    if params[:query].present?
      formulariovar = params[:query].downcase
      @monedSearch = formulariovar
      formulariovar = formulariovar.sub " ","-"
      url = 'api.coincap.io/v2/assets/'+formulariovar+'/markets'
      begin
        response = RestClient.get(url)
        @results = JSON.parse(response.to_str)
        @aprende = 0  
      rescue RestClient::ExceptionWithResponse => e
        @aprende = -1
      end
      
    end
    
    
  end

  def exchage
    @aprende = 1  
    begin
      
      response = RestClient.get('https://api.coincap.io/v2/exchanges')
        @results = JSON.parse(response.to_str)
        @aprende = 0  
    rescue => exception
      @aprende = -1  
    end
  end
end
