class GamesController < ApplicationController

  def index
    @games = Unirest.get('http://localhost:3000/api/v1/games.json').body
  end

  def show
    @game = Unirest.get('http://localhost:3000/api/v1/games/#{params[:id]}.json').body

  end


  def new
  end

  def create
    @game = Unirest.post('http://localhost:3000/api/v1/games',
    headers: {"Accept" => "application/json"},
    parameters: {character: params[:character],
                house: params[:house],
                city: params[:city]
              }
    ).body

    redirect_to "/games/#{@game['id']}"
  end

  def edit
    @game = Unirest.get('http://localhost:3000/api/v1/games/#{params[:id]}.json').body
  end

  def update
    @game = Unirest.patch('http://localhost:3000/api/v1/games/#{params[:id]',
    headers: {"Accept" => "application/json"},
    parameters: {character: params[:character],
                house: params[:house],
                city: params[:city]
              }
    ).body

    redirect_to "/games/#{@game['id']}"
  end

  def destroy
    @game = Unirest.delete('http://localhost:3000/api/v1/games/#{params[:id]',
    headers: {"Accept" => "application/json"}
    ).body

    redirect_to '/games'

  end
end
