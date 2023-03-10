class PostsController < ApplicationController
  def new
    user = User.find_by(id: session[:user_id])
    redirect_to new_login_path unless user
    @user = user
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
      flash[:alert] = "Your post has been successfully saved"
    else
      flash[:alert] = "Unable to save post"
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @post = Post.find_by(id: params[:id])
    if @post.update(post_params)
      redirect_to posts_path
      flash[:alert] = "Your post has been successfully updated"
    else
      flash[:alert] = "Unable to update post"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    user = User.find_by(id: session[:user_id])
    redirect_to new_login_path unless user
    @user = user
    @post = Post.find_by(id: params[:id])
  end

  def destroy
  end

  def index
    @posts = Post.all
  end

  def show
    @user = User.find_by(id: session[:user_id])
    @post = Post.find_by(id: params[:id])
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :user_id)
  end
end
