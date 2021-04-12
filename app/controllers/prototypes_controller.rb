class PrototypesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_prototype, only: [:show, :edit, :update]
  before_action :move_to_index, only: [:edit]
  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    Prototype.create(prototype_params)
    if @prototype.save
      redirect_to prototypes_path
    else
      render :new
    end
  end
    
    def show
      @comment = Comment.new
      @comments = @prototype.comments.includes(:user)
    end

    def edit 
    end
      

   def update
      @prototype = Prototype.find(params[:id])
      
     if @prototype.update(prototype_params)
        redirect_to prototype_path(@prototype)
     else
      render :edit
     end
   end
    
    def destroy
      prototype = Prototype.find(params[:id])
      prototype.destroy
      redirect_to root_path
    end

  private

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def prototype_params
    params.require(:prototype). permit(:title, :concept, :image, :catch_copy).merge(user_id: current_user.id)
  end
    def move_to_index
      unless current_user == @prototype.user
        redirect_to action: :index
      end
    end
end