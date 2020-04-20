class PostsController < ApplicationController

  def index
    @posts = Post.includes(:user).order("created_at DESC").page(params[:page]).per(8)
  end

  
  def new
    @posts = Post.new
  end

  def create  
    @posts = Post.create(post_params)
    if @posts.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    # @user = User.find(params[:id])
    # @posts = @user.posts
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to root_path(post.id)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_path
  end

  def search
    @posts = Post.search(params[:keyword])
    
  end


private

  def post_params
    params.require(:post).permit(:title, :content).merge(user_id: current_user.id)
  end
end