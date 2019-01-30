class UsersController < ApplicationController
  #métodos edit e update acessíveis apenas para usuários logados
  before_action :logged_in_user, only: [:index,:edit,:update, :destroy]
  #método correct_user -> evita que usuário altere dados de outro
  before_action :correct_user, only: [:edit,:update]
  #método admin_user -> limita o delete de usuários
  before_action :admin_user, only: [:destroy]
  
  def index
    #@users = User.all
    @users = User.paginate(page: params[:page])#mostrará usuários do sistema divididos em páginas
  end

  def new
    @user = User.new
  end
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
    #debugando antes de completar a renderização -> escrever "params" no byebug e depois dar ctrl+d para sair
    #debugger
  end

  def edit
    @user = User.find(params[:id])
  end
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Minitext!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success]="Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user == current_user
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

end
