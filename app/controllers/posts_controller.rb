class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  def index
   @posts = Post.all.order ('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params

    if @post.save
      redirect_to @post, notice: "Post done brah!!"
    else
      render 'new', notice: "Unsuccesfull brah!!"
    end

  end

  def show
  end

  def edit
  end

  def update
    if @post.update post_params
      redirect_to @post, notice: "Article is updated. Bleep Blop"
    else 
      render 'edit'
    end
  end 

  def destroy
    @post.destroy
    redirect_to posts_path
  end


  private
    
    def post_params
      params.require(:post).permit(:title, :content, :subtitle)
    end 

    def find_post
      @post = Post.find(params[:id])
    end


end
