class GamesController < ApplicationController

	def new
		@game = Game.new
	end

	def create
  		@game = Game.create(game_params)
  		if @game.save
  			redirect_to @game
  		else
  			flash.now[:notice] = "invalid input"
  			render :new
  		end
  	end

	def show
		@game = Game.find(params[:id])
	end


	def move
		
  		respond_to do |format|
  		@divVar = params[:data]
    	format.js
		end        
	end

	def update
    	@games = Game.all
    	@game = Game.find(params[:id])
    	@game.update_attributes(game_params)
    	respond_to do |format|              
    		format.js
    	end
	end

	private
	def game_params
		params.require(:game).permit(:one, :two, :three, :four, :five, :six, :seven, :eight, :nine, :piece, :turn, :count)
	end
	end
