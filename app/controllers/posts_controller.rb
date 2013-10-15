class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]


  # these code blocks are called actions

  # This comes from config-routes: 
  # get 'post/:id' => 'post#show'

  # GET /posts/1
  def show
  end

  def index
    @posts = Post.all
  end

  # GET /posts/new
  def new
  	@post = Post.new
  end
  
  # POST /posts
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render action: 'new'
    end
  end
  
  # GET /posts/1/edit
  def edit
  end

  # POST/PUT/PATCH /posts/1
  def update
  	if @post.update(post_params)
      redirect_to @post
  	else
      render action: 'edit'
  	end
  end

  # DELETE /posts/1
  def destroy
  	@post.destroy
  	redirect_to posts_url
  end
  
  private

  # never trust parameters from the internet
  # only allow white-list through

  def post_params
    params.require(:post).permit(:title, :body)
  end
  
  def set_post
  	@post = Post.find(params[:id])
  end

end
