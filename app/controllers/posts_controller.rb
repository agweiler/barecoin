class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  def index
   @posts = Post.all.order('created_at DESC').paginate(page: params[:page], per_page: 5)
   set_meta_tags title: 'Blog',
              description: 'News, Interviews, Posts about Cryptocurrencies - namely Bitcoin and Etheruem plus the Blockchain',
              keywords: 'Bitcoin, Ethereum, Ether, Blockchain, News'
  end

  def new
    @post = current_admin.posts.build
    set_meta_tags noindex: true
    set_meta_tags noindex: 'googlebot'

  end

  def create
    @post = current_admin.posts.build(post_params)

    if @post.save
      redirect_to @post, notice: "Post done brah!!"
    else
      render 'new', notice: "Unsuccesfull brah!!"
    end

    set_meta_tags noindex: true
    set_meta_tags noindex: 'googlebot'

  end

  def show
  end

  def edit
    set_meta_tags noindex: true
    set_meta_tags noindex: 'googlebot'
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

    set_meta_tags noindex: true
    set_meta_tags noindex: 'googlebot'
  end


  private
    
    def post_params
      params.require(:post).permit(:title, :content, :subtitle, :image)
    end 

    def find_post
      @post = Post.find(params[:id])
    end


end
