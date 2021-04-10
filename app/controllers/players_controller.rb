class PlayersController < ApplicationController

  before_action :find_player, only: [:show, :edit, :update, :destroy]
  
  def index 
    @players = Player.order(id: :desc)
  end

  def show
    
  end

  def new
    @player  = Player.new
  end

  def create
    @player = Player.new(player_params)
      if  @player.save
        redirect_to players_path, notice: "成功建立"
      else
        render :new
      end
  end
  
  def edit
    
  end

  

  def update
    
    
    if @player.update(player_params)
      redirect_to player_path
    else
      render :show
    end
  end

  def destroy
  
    @player.destroy if @player
    redirect_to players_path, notice: "已刪除"
  end

  private
  def player_params
    params.require(:player).permit(:name, :age, :country, :score, :team)
  end

  def find_player
    @player = Player.find(params[:id])
  end

end
