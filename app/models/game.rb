class Game
  attr_accessor :id, :character, :house, :city

  def initialize(input)
    @id = input["id"]
    @character = input["character"]
    @house = input["house"]
    @city = input["city"]

  end

  def self.find_by(options)
    game_hash = Unirest.get("http://localhost:3000/api/v1/games/#{options[:id]}.json").body
    Game.new(game_hash)
  end

  def self.all
    api_games = Unirest.get('http://localhost:3000/api/v1/games.json').body
    @games = []
    api_games.each do |api_game|
    @games << Game.new(api_game)
    end
     employees
  end

  def destroy
    Unirest.delete('http://localhost:3000/api/v1/games/' + id,
    headers: {"Accept" => "application/json"}
    ).body
  end


end
