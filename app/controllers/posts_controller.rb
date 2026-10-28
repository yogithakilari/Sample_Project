class PostsController < ApplicationController
  before_action :set_post , only: %i[ show  ]

  # GET /posts or /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1 or /posts/1.json
  def show
    @post = Post.find(params[:id])
  end

  private 
  
  def set_post
    @post = Post.find(params[:id])
  end

end
