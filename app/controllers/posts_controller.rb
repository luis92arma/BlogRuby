class PostsController < ApplicationController
  before_action :find_post, only:[:edit, :update, :show, :delete]

  #index para renderisr todos los Posts
  def index
    @posts = Post.all
  end

  #Nueva action para crear un post
  def new
    @post = Post.new
  end

  #Guardar posts en la base de datos
  def create
    @post = Post.new
    if @post.save(post_params)
      flash[:notice] = "Tu post se ha creado"
      redirect_to post_path(@post)
    else
      flash[:alert] = "Error :("
      render :new
    end
  end

  #editar
  def edit
  end

  #Acttualizar
  def update
    if @post.update_attribute(post_params)
      flash[:notice] = "Se actualiso tu post :)"
      redirect_to post_path(@post)
    else
      flash[:alert] = "error al actualizar el post"
      render :edit
    end
  end

  #mostrar
  def show

  end

  #borrar post
  def destroy
    if @post.destroy
      flash[:notice] = "post borrado"
      redirect_to post_path
    else
      flash[:alert] = "error"
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
